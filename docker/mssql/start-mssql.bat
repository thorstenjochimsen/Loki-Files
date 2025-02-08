@echo off
echo Starte Docker Compose...
docker-compose up -d

echo Warte auf den Start des SQL Servers...
timeout /t 30

echo Initialisiere die Datenbank...
docker exec -i mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "lokiloki01!!" -d master -i init-db.sql

echo Datenbank initialisiert.
pause
