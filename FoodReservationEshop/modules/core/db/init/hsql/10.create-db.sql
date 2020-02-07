-- begin FOODRESERVATIONESHOP_STORE
create table FOODRESERVATIONESHOP_STORE (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(255) not null,
    --
    primary key (ID)
)^
-- end FOODRESERVATIONESHOP_STORE
-- begin FOODRESERVATIONESHOP_DISH
create table FOODRESERVATIONESHOP_DISH (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(255) not null,
    PRICE decimal(19, 2) not null,
    STORE_ID varchar(36) not null,
    --
    primary key (ID)
)^
-- end FOODRESERVATIONESHOP_DISH
-- begin FOODRESERVATIONESHOP_ORDER
create table FOODRESERVATIONESHOP_ORDER (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    USER_ID varchar(36) not null,
    STORE_ID varchar(36) not null,
    ORDER_AT date not null,
    AMOUNT varchar(255) not null,
    --
    primary key (ID)
)^
-- end FOODRESERVATIONESHOP_ORDER
-- begin FOODRESERVATIONESHOP_ORDER_DISH_LINK
create table FOODRESERVATIONESHOP_ORDER_DISH_LINK (
    ORDER_ID varchar(36) not null,
    DISH_ID varchar(36) not null,
    primary key (ORDER_ID, DISH_ID)
)^
-- end FOODRESERVATIONESHOP_ORDER_DISH_LINK
