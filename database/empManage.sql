----------------------------------------------
-- Export file for user ROOT                --
-- Created by lenovo on 2016/9/10, 12:25:46 --
----------------------------------------------

set define off
spool empManage.log

prompt
prompt Creating table TB_ACCESSION_FORM
prompt ================================
prompt
create table ROOT.TB_ACCESSION_FORM
(
  id   INTEGER not null,
  name VARCHAR2(20)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_ACCESSION_FORM
  add constraint ACCESSION_FORM_ID primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TB_ACCOUNT_ITEM
prompt ==============================
prompt
create table ROOT.TB_ACCOUNT_ITEM
(
  id          INTEGER not null,
  name        VARCHAR2(10),
  type        CHAR(4),
  unit        CHAR(2),
  is_timecard CHAR(2)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_ACCOUNT_ITEM
  add constraint ACCOUNT_ITEM_ID primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TB_BRING_UP_CONTENT
prompt ==================================
prompt
create table ROOT.TB_BRING_UP_CONTENT
(
  id         INTEGER not null,
  name       VARCHAR2(40),
  content    VARCHAR2(100),
  object     VARCHAR2(100),
  start_date DATE,
  end_date   DATE,
  unit       VARCHAR2(40),
  lecturer   VARCHAR2(10),
  place      VARCHAR2(60)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ROOT.TB_BRING_UP_CONTENT
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table TB_NATION
prompt ========================
prompt
create table ROOT.TB_NATION
(
  id   INTEGER not null,
  name VARCHAR2(20)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_NATION
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TB_NATIVE_PLACE
prompt ==============================
prompt
create table ROOT.TB_NATIVE_PLACE
(
  id   INTEGER not null,
  name VARCHAR2(20)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_NATIVE_PLACE
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TB_RECORD
prompt ========================
prompt
create table ROOT.TB_RECORD
(
  id               INTEGER not null,
  record_number    CHAR(6),
  name             VARCHAR2(10),
  sex              CHAR(2),
  birthday         DATE,
  photo            CHAR(10),
  id_card          VARCHAR2(20),
  marriaged        CHAR(4),
  nation_id        NUMBER,
  native_place_id  NUMBER,
  address          VARCHAR2(100),
  postalcode       CHAR(6),
  party_member     CHAR(2),
  school_age       VARCHAR2(10),
  specialty        VARCHAR2(40),
  foreign_language VARCHAR2(10),
  grade            VARCHAR2(10)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table ROOT.TB_RECORD
  is '档案信息';
alter table ROOT.TB_RECORD
  add constraint ID primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_RECORD
  add constraint ALTER_004 foreign key (NATION_ID)
  references ROOT.TB_NATION (ID);
alter table ROOT.TB_RECORD
  add constraint ALTER_005 foreign key (NATIVE_PLACE_ID)
  references ROOT.TB_NATIVE_PLACE (ID);

prompt
prompt Creating table TB_BRING_UP_ONTENT
prompt =================================
prompt
create table ROOT.TB_BRING_UP_ONTENT
(
  id                  INTEGER not null,
  bring_up_content_id INTEGER,
  record_id           INTEGER,
  score               INTEGER,
  up_to_grade         CHAR(2),
  remark              VARCHAR2(60)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ROOT.TB_BRING_UP_ONTENT
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ROOT.TB_BRING_UP_ONTENT
  add foreign key (BRING_UP_CONTENT_ID)
  references ROOT.TB_BRING_UP_CONTENT (ID);
alter table ROOT.TB_BRING_UP_ONTENT
  add foreign key (RECORD_ID)
  references ROOT.TB_RECORD (ID);

prompt
prompt Creating table TB_DEPT
prompt ======================
prompt
create table ROOT.TB_DEPT
(
  id        INTEGER not null,
  parent_id INTEGER,
  name      VARCHAR2(20)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_DEPT
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_DEPT
  add foreign key (PARENT_ID)
  references ROOT.TB_DEPT (ID);

prompt
prompt Creating table TB_DUTY
prompt ======================
prompt
create table ROOT.TB_DUTY
(
  id   INTEGER not null,
  name VARCHAR2(20)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_DUTY
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TB_DUTY_INFO
prompt ===========================
prompt
create table ROOT.TB_DUTY_INFO
(
  id                   INTEGER not null,
  dept_id              INTEGER,
  duty_id              INTEGER,
  accession_date       DATE,
  accession_form_id    INTEGER,
  dimission_date       DATE,
  dimission_reason     VARCHAR2(100),
  first_pact_date      DATE,
  pact_start_date      DATE,
  pact_end_date        DATE,
  bank_name            VARCHAR2(60),
  bank_no              VARCHAR2(30),
  society_safety_no    VARCHAR2(30),
  annuity_safety_no    VARCHAR2(30),
  dole_safety_no       VARCHAR2(30),
  medicare_safety_no   VARCHAR2(30),
  compo_safety_no      VARCHAR2(30),
  accumulation_fund_no VARCHAR2(30)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table ROOT.TB_DUTY_INFO
  is '职务信息';
alter table ROOT.TB_DUTY_INFO
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_DUTY_INFO
  add constraint ALTER_001 foreign key (DEPT_ID)
  references ROOT.TB_DEPT (ID);
alter table ROOT.TB_DUTY_INFO
  add constraint ALTER_002 foreign key (DUTY_ID)
  references ROOT.TB_DUTY (ID);
alter table ROOT.TB_DUTY_INFO
  add constraint ALTER_003 foreign key (ACCESSION_FORM_ID)
  references ROOT.TB_ACCESSION_FORM (ID);
alter table ROOT.TB_DUTY_INFO
  add foreign key (ID)
  references ROOT.TB_RECORD (ID);

prompt
prompt Creating table TB_MANAGER
prompt =========================
prompt
create table ROOT.TB_MANAGER
(
  id       INTEGER not null,
  password VARCHAR2(20),
  state    CHAR(4),
  purview  CHAR(10)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_MANAGER
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_MANAGER
  add foreign key (ID)
  references ROOT.TB_RECORD (ID);

prompt
prompt Creating table TB_PERSONAL_INFO
prompt ===============================
prompt
create table ROOT.TB_PERSONAL_INFO
(
  id                INTEGER not null,
  qq                VARCHAR2(20),
  e_mail            VARCHAR2(30),
  handset           VARCHAR2(15),
  telephone         VARCHAR2(15),
  address           VARCHAR2(100),
  postalcode        CHAR(6),
  second_school_age VARCHAR2(10),
  second_specialty  VARCHAR2(40),
  graduate_school   VARCHAR2(40),
  graduate_date     DATE,
  party_member_date DATE,
  computer_grade    VARCHAR2(10),
  likes             VARCHAR2(50),
  ones_strong_suit  VARCHAR2(50)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_PERSONAL_INFO
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_PERSONAL_INFO
  add foreign key (ID)
  references ROOT.TB_RECORD (ID) on delete cascade;

prompt
prompt Creating table TB_RECKONING
prompt ===========================
prompt
create table ROOT.TB_RECKONING
(
  id      INTEGER not null,
  name    VARCHAR2(20),
  explain VARCHAR2(100)
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_RECKONING
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TB_RECKONING_INFO
prompt ================================
prompt
create table ROOT.TB_RECKONING_INFO
(
  id              INTEGER not null,
  reckoning_id    INTEGER,
  account_item_id INTEGER,
  money           INTEGER
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_RECKONING_INFO
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_RECKONING_INFO
  add foreign key (RECKONING_ID)
  references ROOT.TB_RECKONING (ID);
alter table ROOT.TB_RECKONING_INFO
  add foreign key (ACCOUNT_ITEM_ID)
  references ROOT.TB_ACCOUNT_ITEM (ID);

prompt
prompt Creating table TB_RECKONING_LIST
prompt ================================
prompt
create table ROOT.TB_RECKONING_LIST
(
  record_id    INTEGER not null,
  reckoning_id INTEGER
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_RECKONING_LIST
  add primary key (RECORD_ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_RECKONING_LIST
  add foreign key (RECORD_ID)
  references ROOT.TB_RECORD (ID);
alter table ROOT.TB_RECKONING_LIST
  add foreign key (RECKONING_ID)
  references ROOT.TB_RECKONING (ID);

prompt
prompt Creating table TB_REWARD_AND_PUNISHMENT
prompt =======================================
prompt
create table ROOT.TB_REWARD_AND_PUNISHMENT
(
  id                 INTEGER not null,
  record_id          INTEGER,
  type               CHAR(4),
  reason             VARCHAR2(60),
  content            VARCHAR2(100),
  money              INTEGER,
  start_date         DATE,
  end_date           DATE,
  ratifier_dept_id   INTEGER,
  ratifier_record_id INTEGER,
  ratifier_date      DATE
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ROOT.TB_REWARD_AND_PUNISHMENT
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ROOT.TB_REWARD_AND_PUNISHMENT
  add foreign key (RECORD_ID)
  references ROOT.TB_RECORD (ID);
alter table ROOT.TB_REWARD_AND_PUNISHMENT
  add foreign key (RATIFIER_RECORD_ID)
  references ROOT.TB_RECORD (ID);
alter table ROOT.TB_REWARD_AND_PUNISHMENT
  add foreign key (RATIFIER_DEPT_ID)
  references ROOT.TB_DEPT (ID);

prompt
prompt Creating table TB_TIMECARD
prompt ==========================
prompt
create table ROOT.TB_TIMECARD
(
  id                 INTEGER not null,
  record_id          INTEGER,
  account_item_id    INTEGER,
  explain            VARCHAR2(100),
  start_date         DATE,
  end_date           DATE,
  ratifier_dept_id   INTEGER,
  ratifier_record_id INTEGER,
  ratifier_date      DATE
)
tablespace ROOT_TS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_TIMECARD
  add primary key (ID)
  using index 
  tablespace ROOT_TS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOT.TB_TIMECARD
  add foreign key (RECORD_ID)
  references ROOT.TB_RECORD (ID);
alter table ROOT.TB_TIMECARD
  add foreign key (RATIFIER_RECORD_ID)
  references ROOT.TB_RECORD (ID);
alter table ROOT.TB_TIMECARD
  add foreign key (ACCOUNT_ITEM_ID)
  references ROOT.TB_ACCOUNT_ITEM (ID);
alter table ROOT.TB_TIMECARD
  add foreign key (RATIFIER_DEPT_ID)
  references ROOT.TB_DEPT (ID);


spool off
