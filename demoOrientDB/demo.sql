-------------------------------------------------------------------------
-- let's creat database has name blog
-- create 3 users: admin and luke, steve in blog database by hand :v
-- connect with admin acc, then create class has name dailyNews
connect remote:localhost/blog admin admin
create class dailyNews extends ORestricted

-- create 2 post in each user luke and steve
connect remote:localhost/blog luke luke
insert into dailyNews set title = "This is Luke's Post"
select from dailyNews

connect remote:localhost/blog steve steve
insert into dailyNews set title = "This is Steve's Post"
select from dailyNews
-- Now u can see, Steve can only see his post, without luke's post

-- Luke log in, now him share his post with steve
connect remote:localhost/blog luke luke
update [rid_of_luke_post] set _allow = _allow || [rid_allow_of_steve_post]
-- now then Steve log in
connect remote:localhost/blog steve steve
select from dailyNews
--he can see the content of Luke shared with him
-------------------------------------------------------------------------
---------------------------DEMO2-----------------------------------------
--------------------------SSL/TLS----------------------------------------
-- my cert folder: C:\orientdb-3.2.3\config\cert
-- 1.Using Keytool, create a certificate for the server:
keytool.exe -genkey -alias server -keystore C:\orientdb-3.2.3\config\cert\orientdb.ks -keyalg RSA -keysize 2048 -validity 3650
-- 2.Export the server certificate to share it with client:
keytool.exe -export -alias server -keystore C:\orientdb-3.2.3\config\cert\orientdb.ks -file C:\orientdb-3.2.3\config\cert\orientdb.cert
-- 3.Create a certificate/keystore for the console/clients:
keytool.exe -genkey -alias console -keystore C:\orientdb-3.2.3\config\cert\orientdb-console.ks -keyalg RSA -keysize 2048 -validity 3650
-- 4.Create a trust-store for the client, then import the server certificate.
keytool.exe -import -alias server -keystore C:\orientdb-3.2.3\config\cert\orientdb-console.ts -file C:\orientdb-3.2.3\config\cert\orientdb.cert

-- Server Configuration
/*
The server configuration file, $ORIENTDB_HOME/config/orientdb-server-config.xml
By default, the OrientDB server looks for its keys and trust-stores in $ORIENTDB_HOME/config/cert
*/
--------------------------------------------------------------
-- 1.Creating Encrypted Database
CONFIG SET storage.encryptionKey T1JJRU5UREJfSVNfQ09PTA==
create database plocal:C:\orientdb-3.2.3\databases\test root r00t plocal

-- 2. opening enc database
connect plocal:C:\orientdb-3.2.3\databases\test root r00t
select from orole

-- 3. opening enc database without key in another cmd prompt
connect plocal:C:\orientdb-3.2.3\databases\test root r00t
-- We get a bunch of errs, when i try to connect the database

-- 4. open it again, with the key which we created database before
CONFIG SET storage.encryptionKey T1JJRU5UREJfSVNfQ09PTA==
connect plocal:C:\orientdb-3.2.3\databases\test root r00t
select from orole