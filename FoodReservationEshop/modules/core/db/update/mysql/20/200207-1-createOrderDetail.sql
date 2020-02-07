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
    ORDER_AT date not null,
    --
    primary key (ID)
);