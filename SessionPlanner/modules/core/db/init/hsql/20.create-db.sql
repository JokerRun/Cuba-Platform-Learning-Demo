-- begin SESSIONPLANNER_SESSION
alter table SESSIONPLANNER_SESSION add constraint FK_SESSIONPLANNER_SESSION_ON_SPEAKER foreign key (SPEAKER_ID) references SESSIONPLANNER_SPEAKER(ID)^
create index IDX_SESSIONPLANNER_SESSION_ON_SPEAKER on SESSIONPLANNER_SESSION (SPEAKER_ID)^
-- end SESSIONPLANNER_SESSION
