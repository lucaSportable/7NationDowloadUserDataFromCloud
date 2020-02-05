package dbReplica

import (
	"bitbucket.org/liamstask/goose/lib/goose"
	"database/sql"
	"fmt"
	"github.com/aws/aws-sdk-go-v2/aws/external"
	"github.com/aws/aws-sdk-go-v2/service/rds/rdsutils"
	"github.com/jinzhu/gorm"
	"io"
	"log"
	"os"
	"os/exec"
	"time"
)

const (
	awsRegion           = "eu-west-1"
	dbEndpoint          = "wallaby-dev.cfspb6yr2qxe.eu-west-1.rds.amazonaws.com"
	dbUser              = "metrics_server_iam"
	DbNameOrigin        = "metrics_server_dev"
	dbNameToSaveDefault = "metrics_server_luca"
	dbPort              = "5432"
	cert                = "./rds-ca-2019-root.pem"
	migrationPath       = "/home/lucasportable/Documents/Documents9Nov19/STUDYFUN/work/7NationArmy/sandbox/oliExample/examples/ConnectToRDS/db"
)

// createSessionDB creates a new postgres database for a session and returns a connection to it.
func CreateTmpUserDataDB(db*gorm.DB, dbname string)(err error){
	// create new database
	command := fmt.Sprintf("create database \"%v\" with owner %v", dbname, dbUser)
	errs := db.Exec(command).GetErrors()
	if len(errs) > 0 {
		return errs[0]
	}
	// Return a connection to the new database
	db.Close()
	return nil
}

func connString(dbname string, localhost bool)string{
	cfg, err := external.LoadDefaultAWSConfig()
	if err != nil {
		fmt.Fprintf(os.Stderr, "failed to load configuration, %v", err)
		os.Exit(1)
	}
	cfg.Region = awsRegion

	// Creating an auth token for RDS connection
	endpoint := fmt.Sprintf("%s:%s/", dbEndpoint, dbPort)
	authToken, err := rdsutils.BuildAuthToken(endpoint, awsRegion, dbUser, cfg.Credentials)
	if err != nil {
		log.Fatal("Creating auth token error: ", err)
	}

	if localhost{
		return fmt.Sprintf("'host=localhost user=%s dbname=%s password=%s'",dbUser,dbname,authToken)
	}
	//Use db to perform SQL operations on database
	remoteConnString := fmt.Sprintf("host=%v user=%v dbname=%v password=%v port=%v sslmode=verify-full sslrootcert=%v", dbEndpoint, dbUser, dbname, authToken, dbPort, cert)
	//fmt.Println(remoteConnString)
	return remoteConnString
}

// RdsConnect connects to the default instance of rds ton the specified database.
func RdsConnect(dbname string)(db *gorm.DB){
	conn := connString(dbname,false )
	db, err := gorm.Open("postgres", conn)
	if err != nil {
		log.Fatal("Opening DB conn error: ", err)
	}
	return db
}

// createSessionDB creates a new postgres database for a session and returns a connection to it.
func DeleteTmpUserDataDB(db*gorm.DB, dbname string){
	// delete the target database
	command := fmt.Sprintf("drop database \"%s\"", dbname)
	err := db.Exec(command).Error
	if err !=nil {
		log.Fatal("Deleting DB conn error: ", err)
	}
	// Return a connection to the new database
	return
}

// MigrateSchema execute all gorm migration and the export of the user rows.
func MigrateSchema(DB *sql.DB,dest string, userId string) {
	//Directory to the db folder or the migration folder within
	var conf = goose.DBConf{
		MigrationsDir: migrationPath,
		// Call it whatever you want
		Env: "testRandom",
		// postgres TODO: update the driver
		Driver: goose.DBDriver{Name:"postgres", OpenStr:dest, Import:"github.com/lib/pq",Dialect:goose.PostgresDialect{}},
		//public
		PgSchema: "public",
	}
	version, err:= goose.GetMostRecentDBVersion(migrationPath)
	TmpLogError(err)
	// execution time
	start := time.Now()
	err = goose.RunMigrationsOnDb(&conf, migrationPath, version, DB)
	fmt.Println("migrationTime:"+time.Now().Sub(start).String())

	TmpLogError(err)
	fmt.Println("to execute\n",dest)
	// Execute all the import queries
	gdb, err := gorm.Open("postgres", DB)
	TmpLogError(err)

	ExportQueries(gdb,dest,userId)
}

// ExportUserData returns a dump of the data of the user specified.
func ExportUserData(userId string,w io.Writer)error{
	cfg, err := external.LoadDefaultAWSConfig()
	TmpLogError(err)
	if err != nil {
		return fmt.Errorf("failed to load configuration, %v", err)
	}
	cfg.Region = awsRegion
	dbNameToSave := userId
	// create database for that id log in case of error
	TmpLogError(CreateTmpUserDataDB(RdsConnect(DbNameOrigin), dbNameToSave))
	// connect to origin and destination and defer
	dbMaster := RdsConnect(DbNameOrigin)
	dbSlave := RdsConnect(dbNameToSave)
	// closing the database dev
	defer func() {
		dbSlave.Close()
		//delete the tmp database via the db source
		DeleteTmpUserDataDB(dbMaster, dbNameToSave)
		dbMaster.Close()
	}()
	// use the user id to create the replica
	MigrateSchema(dbSlave.DB(),connString(DbNameOrigin,true), userId)
	// do the pdg dump and respond with the file itself
	if err:= DumpPostgres(dbNameToSave, w); err !=nil{
		return err
	}
	return nil
}

// DumpPostgres dump from postgres.
func DumpPostgres(databaseName string, writer io.Writer) error{
	// execute command
	cmd := exec.Command("pg_dump", "-Z6", connString(databaseName,false))
	cmd.Stdout = writer
	err := cmd.Run()
	return err
}

func TmpLogError(err error){
	if err != nil{
		log.Println(err.Error())
		// TODO: panic on purpose and catch it in the main
	}
}
