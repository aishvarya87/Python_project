CREATE USER 'scott'@'localhost' IDENTIFIED BY 'pwd123';
GRANT ALL PRIVILEGES ON * . * TO 'scott'@'localhost';
FLUSH PRIVILEGES;