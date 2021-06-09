# testguru_rails_course
Learning Application of Ruby on Rails course from [Thinknetica school](https://thinknetica.com/ruby_on_rails).

Application helps to provide testing process. It includes next entities:

* __Test__ - a container for some scope of questions 
* __Question__ - contains question text
* __Answer__ - describes answer. With answer text also contains option - is question correct. Answer 
* __TestSession__ - describes some all information about one testing session. Links with Test which was pass, each answer result - wrong or correct. Additionally may contain passing time.   

### Configuration notices
#### Database (MySQL)
Before install gems you need to install MySQL server with next:
```shell
apt install mysql-server libmysqlclient-dev
```
After installation need to inialize first configuration 
```shell
mysql_secure_installation
```
and create new user
```shell
sudo mysql -uroot -p --execute="CREATE USER 'oleg'@'localhost' IDENTIFIED BY '123';GRANT ALL PRIVILEGES ON * . * TO 'oleg'@'localhost';"
```