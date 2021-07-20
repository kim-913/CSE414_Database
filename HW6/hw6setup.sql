 DROP DATAVERSE geo IF EXISTS;
 CREATE DATAVERSE geo;
 
 CREATE TYPE geo.worldType AS {auto_id:uuid };
 CREATE DATASET geo.world(worldType)  PRIMARY KEY auto_id AUTOGENERATED;
 LOAD DATASET geo.world USING localfs

(("path"="127.0.0.1:///Users/ziruoke/Desktop/CSE414/HW6/hw7/mondial.adm"),("format"="adm"));