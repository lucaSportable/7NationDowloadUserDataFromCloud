package main

import (
	"fmt"
	"log"
	"os"

	"github.com/aws/aws-sdk-go-v2/aws/external"
	"github.com/aws/aws-sdk-go-v2/service/rds/rdsutils"
	"github.com/jinzhu/gorm"
	_ "github.com/lib/pq" // here
)

const (
	awsRegion = "eu-west-1"
	dbEndpoint     = "wallaby.cfspb6yr2qxe.eu-west-1.rds.amazonaws.com"
	dbUser       = "synctool"
	dbName       = "wallabytest"
	dbPort       = "5432"
	cert = "./rds-ca-2019-root.pem"
)

func rdsConnect(dbname string)(db *gorm.DB){
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

	//Use db to perform SQL operations on database
	conn := fmt.Sprintf("host=%v user=%v dbname=%v password=%v port=%v sslmode=verify-full sslrootcert=%v", dbEndpoint, dbUser, dbname, authToken, dbPort, cert)
	db, err = gorm.Open("postgres", conn)
	if err != nil {
		log.Fatal("Opening DB conn error: ", err)
	}
	return db
}

// createSessionDB creates a new postgres database for a session and returns a connection to it
func createTmpUserDataDB(db*gorm.DB, dbname string)(databaseTmp *gorm.DB){

	// create new database
	command := fmt.Sprintf("create database \"%v\" with owner %v", dbname, dbUser)
	errs := db.Exec(command).GetErrors()
	if len(errs) > 0 {
		log.Fatal("Opening DB conn error: ", errs[0])
		return nil
	}
	// Return a connection to the new database
	return rdsConnect(dbname)
}







// createSessionDB creates a new postgres database for a session and returns a connection to it
func deleteTmpUserDataDB(db*gorm.DB, dbname string){

	// create new database
	command := fmt.Sprintf("drop database \"%v\"", dbname)
	errs := db.Exec(command).GetErrors()
	if len(errs) > 0 {
		log.Fatal("Deleting DB conn error: ", errs[0])

	}
	// Return a connection to the new database
	return
}


func main() {
	// connection the original
	db := rdsConnect(dbName)

	deleteTmpUserDataDB(db,"tmp-UserID")
	// connection to the tmp database.
	db2:= createTmpUserDataDB(db,"tmp-UserID")

	// execute all the quer

	//Testing database connection
	var i int
	err := db2.Raw("SELECT 1;").Row().Scan(&i)
	if err != nil {
		log.Fatal("Execute command error: ", err)
	}

	//Checking if response from database query was successful
	if i == 1 {
		log.Println("Successfully connected to database ", dbName)
	}
}

