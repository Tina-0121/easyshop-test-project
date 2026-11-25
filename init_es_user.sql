create database if not exists easyshop default character set utf8mb4;
use easyshop;

drop table if exists es_user;

create table es_user(

 user_id int primary key auto_increment comment '用户id',
 user_name varchar(50) not null comment '用户名',
 password VARCHAR(50) NOT NULL COMMENT '密码，演示用明文，生产加密',
 phone VARCHAR(20) UNIQUE COMMENT '手机号',
 status TINYINT DEFAULT 1 COMMENT '1正常 0冻结',
 register_source VARCHAR(20) COMMENT 'pc / app'
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into es_user(user_name,password,phone,status,register_source)
values 
('test01',123,13188888888,1,'pc'),
('test02',111,18866666666,0,'app');

-- 2. 商品表 es_goods
DROP TABLE IF EXISTS es_goods;
CREATE TABLE es_goods (
  goods_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '商品id',
  goods_name VARCHAR(100) NOT NULL COMMENT '商品名称',
  price DECIMAL(10,2) NOT NULL COMMENT '价格',
  stock INT NOT NULL DEFAULT 0 COMMENT '库存',
  is_on_sale TINYINT DEFAULT 1 COMMENT '1上架 0下架'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO es_goods(goods_name,price,stock,is_on_sale)
VALUES
('商城爆款T恤',99.00,200,1),
('无线蓝牙耳机',199.00,50,1),
('机械键盘',299.00,0,1);

-- 3. 订单表 es_order
DROP TABLE IF EXISTS es_order;
CREATE TABLE es_order (
  order_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '订单号',
  user_id INT NOT NULL,
  goods_id INT NOT NULL,
  buy_num INT NOT NULL,
  total_price DECIMAL(10,2),
  create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
  order_status TINYINT DEFAULT 0 COMMENT '0待支付 1已支付 2已取消'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 重置密码
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
FLUSH PRIVILEGES;
 