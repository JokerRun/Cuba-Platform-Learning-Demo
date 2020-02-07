alter table FOODRESERVATIONESHOP_ORDER add column AMOUNT decimal(19, 2) ;
alter table FOODRESERVATIONESHOP_ORDER add column ORDER_AT date ^
update FOODRESERVATIONESHOP_ORDER set ORDER_AT = current_date where ORDER_AT is null ;
alter table FOODRESERVATIONESHOP_ORDER modify column ORDER_AT date not null ;
