cmd := exec.Command("pg_dump", "-Z6", "--dbname=postgresql://metrics_server:"+os.Getenv("SPORTABLEDB")+"@127.0.0.1:5432/"+databaseName)

pg_dump 'host=wallaby-dev.cfspb6yr2qxe.eu-west-1.rds.amazonaws.com user=metrics_server_iam dbname=metrics_server_dev password=wallaby-dev.cfspb6yr2qxe.eu-west-1.rds.amazonaws.com:5432/?Action=connect&DBUser=metrics_server_iam&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIATUAWEIUCARBSCXZW%2F20200205%2Feu-west-1%2Frds-db%2Faws4_request&X-Amz-Date=20200205T160014Z&X-Amz-Expires=900&X-Amz-SignedHeaders=host&X-Amz-Signature=6660324b3375e6ea1cd216d7e478c11cfd8a32345470f13e1e99f373f9a3f170'

# note yes it works