alter table FOODRESERVATIONESHOP_ORDER alter column AMOUNT rename to AMOUNT__U21678 ^
alter table FOODRESERVATIONESHOP_ORDER alter column AMOUNT__U21678 set null ;
alter table FOODRESERVATIONESHOP_ORDER add column AMOUNT decimal(19, 2) ^
update FOODRESERVATIONESHOP_ORDER set AMOUNT = 0 where AMOUNT is null ;
alter table FOODRESERVATIONESHOP_ORDER alter column AMOUNT set not null ;
