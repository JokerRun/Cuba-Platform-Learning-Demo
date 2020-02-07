-- begin FOODRESERVATIONESHOP_ORDER_DETAIL
alter table FOODRESERVATIONESHOP_ORDER_DETAIL add constraint FK_FOODRESERVATIONESHOP_ORDER_DETAIL_ON_ORDER foreign key (ORDER_ID) references FOODRESERVATIONESHOP_ORDER(ID)^
alter table FOODRESERVATIONESHOP_ORDER_DETAIL add constraint FK_FOODRESERVATIONESHOP_ORDER_DETAIL_ON_DISH foreign key (DISH_ID) references FOODRESERVATIONESHOP_DISH(ID)^
create index IDX_FOODRESERVATIONESHOP_ORDER_DETAIL_ON_ORDER on FOODRESERVATIONESHOP_ORDER_DETAIL (ORDER_ID)^
create index IDX_FOODRESERVATIONESHOP_ORDER_DETAIL_ON_DISH on FOODRESERVATIONESHOP_ORDER_DETAIL (DISH_ID)^
-- end FOODRESERVATIONESHOP_ORDER_DETAIL
-- begin FOODRESERVATIONESHOP_DISH
alter table FOODRESERVATIONESHOP_DISH add constraint FK_FOODRESERVATIONESHOP_DISH_ON_STORE foreign key (STORE_ID) references FOODRESERVATIONESHOP_DISH(ID)^
create index IDX_FOODRESERVATIONESHOP_DISH_ON_STORE on FOODRESERVATIONESHOP_DISH (STORE_ID)^
-- end FOODRESERVATIONESHOP_DISH
-- begin FOODRESERVATIONESHOP_ORDER
alter table FOODRESERVATIONESHOP_ORDER add constraint FK_FOODRESERVATIONESHOP_ORDER_ON_USER foreign key (USER_ID) references SEC_USER(ID)^
alter table FOODRESERVATIONESHOP_ORDER add constraint FK_FOODRESERVATIONESHOP_ORDER_ON_STORE foreign key (STORE_ID) references FOODRESERVATIONESHOP_STORE(ID)^
create index IDX_FOODRESERVATIONESHOP_ORDER_ON_USER on FOODRESERVATIONESHOP_ORDER (USER_ID)^
create index IDX_FOODRESERVATIONESHOP_ORDER_ON_STORE on FOODRESERVATIONESHOP_ORDER (STORE_ID)^
-- end FOODRESERVATIONESHOP_ORDER