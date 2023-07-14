create table if not exists devices(
                                      id serial primary key ,
                                      device_name varchar,
                                      device_company varchar,
                                      price numeric,
                                      date_of_issue date
);

create table if not exists customers(
                                        id serial primary key ,
                                        name varchar
);

create table if not exists basket(
                                     id serial primary key ,
                                     device_id int references devices(id),
    customer_id int references customers(id),
    price numeric,
    date_of_purchase date
    );

insert into devices(device_name, device_company, price, date_of_issue) VALUES
                                                                           ('Iphone 13','Apple',100000,'1-3-2021'),
                                                                           ('Samsung J5','Samsung',110000,'3-6-2016'),
                                                                           ('Redmi note 14','Xiaomi',114000,'2-11-2018'),
                                                                           ('Iphone 12 Pro Max','Apple',131000,'23-12-2021'),
                                                                           ('Motorola A20','Motorola ',103000,'1-12-2021'),
                                                                           ('Nokia 4','Nokia',10000,'1-12-2021'),
                                                                           ('Samsung','Samsung',76000,'4-12-2021');


insert into basket(device_id, customer_id, price, date_of_purchase) VALUES
                                                                        (
                                                                            (select id from devices where device_name='Iphone 13'),
                                                                            (select id from customers where name='Daniyar'),
                                                                            (select id from devices where devices.price=76000),
                                                                            '4-12-2021'
                                                                        ),
                                                                        (
                                                                            (select id from devices where device_company='Nokia 4'),
                                                                            (select id from customers where name='Akylai'),
                                                                            (select id from devices where devices.price=110000),
                                                                            '1-12-2021'
                                                                        );

select * from basket where price=(select id from devices where price=110000);
create type DeviceType as enum ('PHONE','LAPTOP','TABLET');
alter table devices add column device_type DeviceType;
update devices set device_type='PHONE' where id=2;

