#MySql User setup

Set the environment variables
MYSQL_USER
MYSQL_PASSWD

```
sudo useradd -mk . -G admin $MYSQL_USER
sudo passwd $MYSQL_USER
mysql -u root -p
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER';
GRANT ALL ON test.* TO '$MYSQL_USER'@'%';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;
```

```
visudo /etc/sudoers
%admin ALL = (ALL) NOPASSWD: ALL
---------------------
sudo vi /etc/sudoers
#ADDTHIS
# User privilege specification
username ALL=(ALL) NOPASSWD:ALL
```

```
SET GLOBAL validate_password_policy=LOW;
CREATE USER $MYSQL_USER@'%' IDENTIFIED BY $MYSQL_PASSWD;
CREATE DATABASE testdb;
GRANT ALL ON testdb.* TO '$MYSQL_USER'@'%';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION; --Everything
CREATE table Students(FirstName TEXT, LastName TEXT, BirthDate TEXT , STDAddress TEXT);
INSERT INTO Students (FirstName, LastName, BirthDate, STDAddress) VALUES ('John','Horold','2005-10-01','London, St15');
INSERT INTO Students (FirstName, LastName, BirthDate, STDAddress) VALUES ('Mike','Zikle','2005-06-08','London, St18');
INSERT INTO Students (FirstName, LastName, BirthDate, STDAddress) VALUES ('Faruk','Cedrik','2005-03-15','London, St24');
INSERT INTO Students (FirstName, LastName, BirthDate, STDAddress) VALUES ('Faisal','Ali','2005-12-05','London, St41');
```
