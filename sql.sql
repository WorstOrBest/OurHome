#数据库名字：ourhome
#数据库字符集：utf-8
#排序规则：utf8_general_ci


create table user(
user_id int(5)  unique PRIMARY KEY not null auto_increment,   #auto_increment为自增属性
user_name varchar(15) not null,
user_sex varchar(10)  not null check(age = '男' or age = '女'),
user_phonenumber varchar(14) unique not null,
user_email varchar(20) unique not null,
user_university varchar(20) not null,
user_address varchar(80) not null,
user_register_time datetime DEFAULT now() not null,
user_last_login_time datetime DEFAULT now() not null,
user_last_ip varchar(68)  not null,      #存放用户最后登录的IP，如果使用代理，会产生多个IP地址
user_image varchar(255) unique not null,            #存放图片路径
type int(1) default 0 not null,          #0为普通用户，1具有管理员权限
status int(1) default 0   not null      #0为正常状态，1为禁止登录
);

#插入语句模板
INSERT INTO user VALUES(DEFAULT,'幸龙飞','男','17679398598','1828919295@qq.com' ,'昌大技工学院' ,'江西南昌',DEFAULT,DEFAULT,'1.1.1.1', '/home/phoenix1.jpg',DEFAULT,DEFAULT);

#注意id得先去上一个表查找到id，因为这里不能使用default！！
create table login(
user_id int(5) unique PRIMARY KEY not null,         #用户不可使用，只供内部使用
user_phonenumber varchar(14) unique not null,
user_email varchar(20) unique not null,
user_name varchar(15) not null,
user_password varchar(20) not null,
foreign key (user_id) references user(user_id)
)


#插入语句模板
insert into login values(1,'17679398598','1828919295@qq.com','123456')

#注意id得先去上一个表查找到id，因为这里不能使用default！！
create table article(
article_id int(5) unique not null auto_increment,   #发表时间排序，最近发表序号越大,
user_id int(5) unique,    
article_time datetime DEFAULT now(),
article_text mediumtext,
primary key (article_id,user_id),             #使用复合主键，否则会报错
foreign key (user_id) references user(user_id)
);

#插入语句模板
insert into article values(DEFAULT,1,DEFAULT,'<p>建个完美数据库真TM难，一点一点测试!<p>')


