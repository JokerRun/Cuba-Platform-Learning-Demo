alter table FOODRESERVATIONESHOP_DISH change column STORE_ID STORE_ID__U55891 varchar(32)^
alter table FOODRESERVATIONESHOP_DISH modify column STORE_ID__U55891 varchar(32) null ;
alter table FOODRESERVATIONESHOP_DISH drop foreign key FK_FOODRESERVATIONESHOP_DISH_ON_STORE;
drop index IDX_FOODRESERVATIONESHOP_DISH_ON_STORE on FOODRESERVATIONESHOP_DISH ;
-- alter table FOODRESERVATIONESHOP_DISH add column STORE_ID varchar(32) ^
-- update FOODRESERVATIONESHOP_DISH set STORE_ID = <default_value> ;
-- alter table FOODRESERVATIONESHOP_DISH modify column STORE_ID varchar(32) not null ;
alter table FOODRESERVATIONESHOP_DISH add column STORE_ID varchar(32) not null ;
