CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

CREATE USER phpadmin @'localhost' IDENTIFIED BY 'phpadmin';
GRANT ALL PRIVILEGES ON *.* TO  phpadmin @'localhost' WITH GRANT OPTION;
