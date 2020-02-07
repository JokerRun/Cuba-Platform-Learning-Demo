alter table FOODRESERVATIONESHOP_ORDER alter column AMOUNT rename to AMOUNT__U66477 ^
-- update FOODRESERVATIONESHOP_ORDER set STORE_ID = <default_value> where STORE_ID is null ;
alter table FOODRESERVATIONESHOP_ORDER alter column STORE_ID set not null ;
alter table FOODRESERVATIONESHOP_ORDER add column AMOUNT varchar(255) ^
update FOODRESERVATIONESHOP_ORDER set AMOUNT = '' where AMOUNT is null ;
alter table FOODRESERVATIONESHOP_ORDER alter column AMOUNT set not null ;
