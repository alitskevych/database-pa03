create user 'admin_user'@'localhost' identified by 'admin'
grant all on *.* to 'admin_user'@'localhost' with grant option

create user 'regular_user'@'localhost' identified by 'qwerty';
grant select, insert, update, delete on *.* to 'regular_user'@'localhost';

create user 'test_user'@'localhost' identified by 'TestPass';
grant select on *.* to 'test_user'@'localhost';