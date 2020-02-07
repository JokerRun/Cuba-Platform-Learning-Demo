-- begin FOODRESERVATIONESHOP_STORE
create table FOODRESERVATIONESHOP_STORE (
    ID varchar(32),
    VERSION integer not null,
    CREATE_TS datetime(3),
    CREATED_BY varchar(50),
    UPDATE_TS datetime(3),
    UPDATED_BY varchar(50),
    DELETE_TS datetime(3),
    DELETED_BY varchar(50),
    --
    NAME varchar(255) not null,
    --
    primary key (ID)
)^
-- end FOODRESERVATIONESHOP_STORE
-- begin FOODRESERVATIONESHOP_ORDER_DETAIL
create table FOODRESERVATIONESHOP_ORDER_DETAIL (
    ID varchar(32),
    VERSION integer not null,
    CREATE_TS datetime(3),
    CREATED_BY varchar(50),
    UPDATE_TS datetime(3),
    UPDATED_BY varchar(50),
    DELETE_TS datetime(3),
    DELETED_BY varchar(50),
    --
    ORDER_ID varchar(32),
    DISH_ID varchar(32) not null,
    --
    primary key (ID)
)^
-- end FOODRESERVATIONESHOP_ORDER_DETAIL
-- begin FOODRESERVATIONESHOP_DISH
create table FOODRESERVATIONESHOP_DISH (
    ID varchar(32),
    VERSION integer not null,
    CREATE_TS datetime(3),
    CREATED_BY varchar(50),
    UPDATE_TS datetime(3),
    UPDATED_BY varchar(50),
    DELETE_TS datetime(3),
    DELETED_BY varchar(50),
    --
    NAME varchar(255) not null,
    STORE_ID varchar(32) not null,
    PRICE decimal(19, 2) not null,
    --
    primary key (ID)
)^
-- end FOODRESERVATIONESHOP_DISH
-- begin FOODRESERVATIONESHOP_ORDER
create table FOODRESERVATIONESHOP_ORDER (
    ID varchar(32),
    VERSION integer not null,
    CREATE_TS datetime(3),
    CREATED_BY varchar(50),
    UPDATE_TS datetime(3),
    UPDATED_BY varchar(50),
    DELETE_TS datetime(3),
    DELETED_BY varchar(50),
    --
    USER_ID varchar(32) not null,
    STORE_ID varchar(32),
    AMOUNT decimal(19, 2),
    ORDER_AT date not null,
    --
    primary key (ID)
)^
-- end FOODRESERVATIONESHOP_ORDER
