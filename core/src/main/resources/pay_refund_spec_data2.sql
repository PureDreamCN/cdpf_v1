---------------------------------------------
-- Export file for user CDPFV1             --
-- Created by sunchao on 2018/1/9, 9:46:24 --
---------------------------------------------

spool pay_refund_spec_data2.log

prompt
prompt Creating table T_EXAMPLE_COLLEGE
prompt ================================
prompt
create table CDPFV1.T_EXAMPLE_COLLEGE
(
  ID     NUMBER not null,
  NO     VARCHAR2(2) not null,
  NAME   VARCHAR2(30) not null,
  REMARK VARCHAR2(100)
)
tablespace USERS
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
comment on table CDPFV1.T_EXAMPLE_COLLEGE
  is '����ʾ��ѧԺ��';
comment on column CDPFV1.T_EXAMPLE_COLLEGE.ID
  is '������������SEQ_T_EXAMPLE_COLLEGE��ȡ';
comment on column CDPFV1.T_EXAMPLE_COLLEGE.NO
  is 'ѧԺ���';
comment on column CDPFV1.T_EXAMPLE_COLLEGE.NAME
  is 'ѧԺ����';
comment on column CDPFV1.T_EXAMPLE_COLLEGE.REMARK
  is '��ע';
alter table CDPFV1.T_EXAMPLE_COLLEGE
  add constraint PK_T_EXAMPLE_COLLEGE primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table T_EXAMPLE_MAJOR
prompt ==============================
prompt
create table CDPFV1.T_EXAMPLE_MAJOR
(
  ID           NUMBER not null,
  NO           VARCHAR2(4) not null,
  NAME         VARCHAR2(30) not null,
  COLLEGE_NO   VARCHAR2(2) not null,
  COLLEGE_NAME VARCHAR2(30),
  REMARK       VARCHAR2(100)
)
tablespace USERS
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
comment on table CDPFV1.T_EXAMPLE_MAJOR
  is '����ʾ��רҵ��';
comment on column CDPFV1.T_EXAMPLE_MAJOR.ID
  is '������������SEQ_T_EXAMPLE_MAJOR��ȡ';
comment on column CDPFV1.T_EXAMPLE_MAJOR.NO
  is 'רҵ���';
comment on column CDPFV1.T_EXAMPLE_MAJOR.NAME
  is 'רҵ����';
comment on column CDPFV1.T_EXAMPLE_MAJOR.COLLEGE_NO
  is 'ѧԺ���';
comment on column CDPFV1.T_EXAMPLE_MAJOR.COLLEGE_NAME
  is 'ѧԺ����';
comment on column CDPFV1.T_EXAMPLE_MAJOR.REMARK
  is '��ע';
alter table CDPFV1.T_EXAMPLE_MAJOR
  add constraint PK_T_EXAMPLE_MAJOR primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table T_EXAMPLE_STUDENT
prompt ================================
prompt
create table CDPFV1.T_EXAMPLE_STUDENT
(
  ID         NUMBER not null,
  NO         VARCHAR2(12) not null,
  NAME       VARCHAR2(30) not null,
  SEX        CHAR(1),
  IDCARD_NO  VARCHAR2(18),
  COLLEGE_NO VARCHAR2(2),
  MAJOR_NO   VARCHAR2(4),
  REMARK     VARCHAR2(100),
  ISDELETE   CHAR(1) not null
)
tablespace USERS
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
comment on table CDPFV1.T_EXAMPLE_STUDENT
  is '����ʾ��ѧ����';
comment on column CDPFV1.T_EXAMPLE_STUDENT.ID
  is '������������SEQ_T_EXAMPLE_STUDENT��ȡ';
comment on column CDPFV1.T_EXAMPLE_STUDENT.NO
  is 'ѧ��';
comment on column CDPFV1.T_EXAMPLE_STUDENT.NAME
  is '����';
comment on column CDPFV1.T_EXAMPLE_STUDENT.SEX
  is '�Ա�0-�У�1-Ů';
comment on column CDPFV1.T_EXAMPLE_STUDENT.IDCARD_NO
  is '���֤��';
comment on column CDPFV1.T_EXAMPLE_STUDENT.COLLEGE_NO
  is 'ѧԺ���';
comment on column CDPFV1.T_EXAMPLE_STUDENT.MAJOR_NO
  is 'רҵ���';
comment on column CDPFV1.T_EXAMPLE_STUDENT.REMARK
  is '��ע';
comment on column CDPFV1.T_EXAMPLE_STUDENT.ISDELETE
  is '�Ƿ��ܹ�ɾ����N���ܣ�Y��';
alter table CDPFV1.T_EXAMPLE_STUDENT
  add constraint PK_T_EXAMPLE_STUDENT primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table T_EXAMPLE_UEDITOR
prompt ================================
prompt
create table CDPFV1.T_EXAMPLE_UEDITOR
(
  ID          NUMBER(11) not null,
  DESCRIPTION VARCHAR2(4000)
)
tablespace USERS
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
alter table CDPFV1.T_EXAMPLE_UEDITOR
  add constraint PK_T_EXAMPLE_UEDITOR primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table T_EXAMPLE_ZTREENODE
prompt ==================================
prompt
create table CDPFV1.T_EXAMPLE_ZTREENODE
(
  ID   NUMBER not null,
  PID  NUMBER,
  NAME VARCHAR2(50)
)
tablespace USERS
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
alter table CDPFV1.T_EXAMPLE_ZTREENODE
  add constraint PK_T_EXAMPLE_ZTREENODE primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table T_SYS_DEPARTMENT
prompt ===============================
prompt
create table CDPFV1.T_SYS_DEPARTMENT
(
  ID               NUMBER(11) not null,
  NAME             VARCHAR2(40) not null,
  PARENT_ID        NUMBER(11),
  TYPE             NUMBER(2) not null,
  CODE             VARCHAR2(20),
  DISPLAY_ORDER    NUMBER(6) not null,
  NOTE             VARCHAR2(200),
  CREATED_BY       VARCHAR2(20),
  CREATED_AT       DATE,
  LAST_MODIFIED_BY VARCHAR2(20),
  LAST_MODIFIED_AT DATE
)
tablespace USERS
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
comment on column CDPFV1.T_SYS_DEPARTMENT.ID
  is '��������SEQ_T_SYS_DEPARTMENT����';
comment on column CDPFV1.T_SYS_DEPARTMENT.NAME
  is '����';
comment on column CDPFV1.T_SYS_DEPARTMENT.PARENT_ID
  is '�ϼ��ڵ㣬��Ӧ����ID';
comment on column CDPFV1.T_SYS_DEPARTMENT.TYPE
  is '�������ͣ����ֵ�ȡ������1·��2���˶�3������';
comment on column CDPFV1.T_SYS_DEPARTMENT.CODE
  is '���ű���';
comment on column CDPFV1.T_SYS_DEPARTMENT.DISPLAY_ORDER
  is '����';
comment on column CDPFV1.T_SYS_DEPARTMENT.NOTE
  is '��ע';
comment on column CDPFV1.T_SYS_DEPARTMENT.CREATED_BY
  is '������';
comment on column CDPFV1.T_SYS_DEPARTMENT.CREATED_AT
  is '����ʱ��';
comment on column CDPFV1.T_SYS_DEPARTMENT.LAST_MODIFIED_BY
  is '�ϴ��޸���';
comment on column CDPFV1.T_SYS_DEPARTMENT.LAST_MODIFIED_AT
  is '�ϴ��޸�ʱ��';
alter table CDPFV1.T_SYS_DEPARTMENT
  add constraint PK_T_SYS_DEPARTMENT primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table T_SYS_DIC
prompt ========================
prompt
create table CDPFV1.T_SYS_DIC
(
  ID            NUMBER(11) not null,
  CATEGORY      VARCHAR2(40),
  CATEGORY_NAME VARCHAR2(40),
  CODE          VARCHAR2(20),
  NAME          VARCHAR2(40),
  DISPLAY_ORDER NUMBER(6)
)
tablespace USERS
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
comment on column CDPFV1.T_SYS_DIC.ID
  is '��������SEQ_T_SYS_DIC����';
comment on column CDPFV1.T_SYS_DIC.CATEGORY
  is '���ࣺ01����02������ò03�����̶�04ְ��05ְ��
06��������
';
comment on column CDPFV1.T_SYS_DIC.CATEGORY_NAME
  is '��������';
comment on column CDPFV1.T_SYS_DIC.CODE
  is '�ֵ����';
comment on column CDPFV1.T_SYS_DIC.NAME
  is '�ֵ�����';
comment on column CDPFV1.T_SYS_DIC.DISPLAY_ORDER
  is '����';
alter table CDPFV1.T_SYS_DIC
  add constraint PK_T_SYS_DIC primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table T_SYS_LOG
prompt ========================
prompt
create table CDPFV1.T_SYS_LOG
(
  ID           NUMBER not null,
  USER_ID      NUMBER,
  OPERA_DATE   DATE,
  OPERA_IP     VARCHAR2(20),
  MODULE_NAME  VARCHAR2(30),
  OPERA_NAME   VARCHAR2(20),
  OPERA_TYPE   NUMBER,
  OPERA_URL    VARCHAR2(100),
  OPERA_PARAMS VARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CDPFV1.T_SYS_LOG
  add constraint PK_T_SYS_LOG primary key (ID)
  using index 
  tablespace USERS
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
create index CDPFV1.IDX_T_SYS_LOG on CDPFV1.T_SYS_LOG (USER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_RELEASE
prompt ============================
prompt
create table CDPFV1.T_SYS_RELEASE
(
  ID              NUMBER(11) not null,
  NAME            VARCHAR2(50) not null,
  VERSION         VARCHAR2(10) not null,
  RELEASE_DATE    VARCHAR2(10) not null,
  RELEASE_CONTENT VARCHAR2(100) not null,
  RELEASE_BY      VARCHAR2(20) not null
)
tablespace USERS
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
comment on column CDPFV1.T_SYS_RELEASE.ID
  is '������������SEQ_T_SYS_ RELEASE��ȡ';
comment on column CDPFV1.T_SYS_RELEASE.NAME
  is 'ϵͳ����';
comment on column CDPFV1.T_SYS_RELEASE.VERSION
  is '�汾��';
comment on column CDPFV1.T_SYS_RELEASE.RELEASE_DATE
  is '�������ڣ�Yyyy-mm-dd';
comment on column CDPFV1.T_SYS_RELEASE.RELEASE_CONTENT
  is '���������ļ���ַ';
comment on column CDPFV1.T_SYS_RELEASE.RELEASE_BY
  is '������';
alter table CDPFV1.T_SYS_RELEASE
  add constraint PK_T_SYS_RELEASE primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table T_SYS_RESOURCE
prompt =============================
prompt
create table CDPFV1.T_SYS_RESOURCE
(
  ID             NUMBER not null,
  NAME           VARCHAR2(40),
  CODE           VARCHAR2(40),
  PARENT_ID      NUMBER,
  URL            VARCHAR2(200),
  TARGET         VARCHAR2(20),
  ICONIMG        VARCHAR2(40),
  DISPLAY_ORDER  NUMBER,
  TYPE           NUMBER(2),
  DESCRIPTION    VARCHAR2(100),
  RESOURCE_LEVEL NUMBER
)
tablespace USERS
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
comment on table CDPFV1.T_SYS_RESOURCE
  is 'ϵͳ��Դ��';
comment on column CDPFV1.T_SYS_RESOURCE.ID
  is '������������SEQ_T_SYS_RESOURCE��ȡ';
comment on column CDPFV1.T_SYS_RESOURCE.NAME
  is '��Դ����';
comment on column CDPFV1.T_SYS_RESOURCE.CODE
  is '��Դ����';
comment on column CDPFV1.T_SYS_RESOURCE.PARENT_ID
  is '�ϼ��ڵ�';
comment on column CDPFV1.T_SYS_RESOURCE.URL
  is '����';
comment on column CDPFV1.T_SYS_RESOURCE.TARGET
  is '����Ŀ��';
comment on column CDPFV1.T_SYS_RESOURCE.ICONIMG
  is 'ͼ��';
comment on column CDPFV1.T_SYS_RESOURCE.DISPLAY_ORDER
  is '����ֵ';
comment on column CDPFV1.T_SYS_RESOURCE.TYPE
  is '��Դ����,1ģ�飬2����';
comment on column CDPFV1.T_SYS_RESOURCE.DESCRIPTION
  is '����';
comment on column CDPFV1.T_SYS_RESOURCE.RESOURCE_LEVEL
  is '��Դ�ȼ�:1����ϵͳ����2������';
alter table CDPFV1.T_SYS_RESOURCE
  add constraint PK_T_SYS_MODULE primary key (ID)
  using index 
  tablespace USERS
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
create unique index CDPFV1.IDX_T_SYS_RESOURCE1 on CDPFV1.T_SYS_RESOURCE (CODE)
  tablespace USERS
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
prompt Creating table T_SYS_ROLE
prompt =========================
prompt
create table CDPFV1.T_SYS_ROLE
(
  ID               NUMBER not null,
  NAME             VARCHAR2(40),
  DESCRIPTION      VARCHAR2(100),
  DISPLAY_ORDER    NUMBER,
  CREATED_AT       DATE,
  CREATED_BY       VARCHAR2(20),
  LAST_MODIFIED_BY VARCHAR2(20),
  LAST_MODIFIED_AT DATE,
  IS_DELETE        NUMBER
)
tablespace USERS
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
comment on column CDPFV1.T_SYS_ROLE.ID
  is '������������SEQ_T_SYS_ROLE��ȡ';
comment on column CDPFV1.T_SYS_ROLE.NAME
  is '��ɫ����';
comment on column CDPFV1.T_SYS_ROLE.DESCRIPTION
  is '����';
comment on column CDPFV1.T_SYS_ROLE.DISPLAY_ORDER
  is '����ֵ';
comment on column CDPFV1.T_SYS_ROLE.CREATED_AT
  is '������';
comment on column CDPFV1.T_SYS_ROLE.CREATED_BY
  is '����ʱ��';
comment on column CDPFV1.T_SYS_ROLE.LAST_MODIFIED_BY
  is '�ϴ��޸���';
comment on column CDPFV1.T_SYS_ROLE.LAST_MODIFIED_AT
  is '�ϴ��޸�ʱ��';
comment on column CDPFV1.T_SYS_ROLE.IS_DELETE
  is '��ǽ�ɫ�Ƿ���Ա�ɾ����0:�����Ա�ɾ����1�����Ա�ɾ����Ĭ��Ϊ1';
alter table CDPFV1.T_SYS_ROLE
  add constraint PK_T_SYS_ROLE primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table T_SYS_ROLERESOURCE
prompt =================================
prompt
create table CDPFV1.T_SYS_ROLERESOURCE
(
  ID          NUMBER not null,
  ROLE_ID     NUMBER,
  RESOURCE_ID NUMBER
)
tablespace USERS
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
comment on table CDPFV1.T_SYS_ROLERESOURCE
  is '��ɫ��Դ��';
comment on column CDPFV1.T_SYS_ROLERESOURCE.ID
  is '������������SEQ_T_SYS_ROLRESOURCE��ȡ';
comment on column CDPFV1.T_SYS_ROLERESOURCE.ROLE_ID
  is '��ɫid';
comment on column CDPFV1.T_SYS_ROLERESOURCE.RESOURCE_ID
  is '��Դid';
alter table CDPFV1.T_SYS_ROLERESOURCE
  add constraint PK_T_SYS_ROLERESOURCE primary key (ID)
  using index 
  tablespace USERS
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
create index CDPFV1.IDX_T_SYS_ROLERESOURCE1 on CDPFV1.T_SYS_ROLERESOURCE (ROLE_ID)
  tablespace USERS
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
prompt Creating table T_SYS_UI
prompt =======================
prompt
create table CDPFV1.T_SYS_UI
(
  ID                     NUMBER(11) not null,
  ROLE_ID                NUMBER(11),
  MENU_STYLE             NUMBER(4),
  SIDE_THEME_COLOR       VARCHAR2(20),
  SIDE_CORNER            NUMBER(4),
  SIDE_LAYOUT            NUMBER(4),
  SIDE_HEADER            NUMBER(4),
  SIDE_FOOTER            NUMBER(4),
  SIDE_SIDEBAR_MODE      NUMBER(4),
  SIDE_SIDEBAR_MENU      NUMBER(4),
  SIDE_SIDEBAR_SELECTION NUMBER(4),
  TOP_THEME_COLOR        VARCHAR2(20),
  TOP_CORNER             NUMBER(4),
  TOP_LAYOUT             NUMBER(4),
  TOP_HEADER_TOP         NUMBER(4),
  TOP_HEADER_MENU        NUMBER(4)
)
tablespace CDPFV1
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column CDPFV1.T_SYS_UI.ID
  is '����';
comment on column CDPFV1.T_SYS_UI.ROLE_ID
  is 'ϵͳ��ɫ������';
comment on column CDPFV1.T_SYS_UI.MENU_STYLE
  is '�˵����1�����SIDE��2������TOP';
comment on column CDPFV1.T_SYS_UI.SIDE_THEME_COLOR
  is '��߲˵�_������ɫ';
comment on column CDPFV1.T_SYS_UI.SIDE_CORNER
  is '��߲˵�_���Ƿ��1: ֱ�ǣ�2��Բ��';
comment on column CDPFV1.T_SYS_UI.SIDE_LAYOUT
  is '��߲˵�_ҳ�沼�ַ��1����ʽ��2����ʽ';
comment on column CDPFV1.T_SYS_UI.SIDE_HEADER
  is '��߲˵�_ҳü���1���̶���2���ǹ̶�';
comment on column CDPFV1.T_SYS_UI.SIDE_FOOTER
  is '��߲˵�_ҳ�ŷ��1���̶���2���ǹ̶�';
comment on column CDPFV1.T_SYS_UI.SIDE_SIDEBAR_MODE
  is '��߲˵�_�˵�ģʽ1���̶���2���ǹ̶�';
comment on column CDPFV1.T_SYS_UI.SIDE_SIDEBAR_MENU
  is '��߲˵�_�˵�ѡ����ʽ1��accordion�ַ��٣�2��hover����';
comment on column CDPFV1.T_SYS_UI.SIDE_SIDEBAR_SELECTION
  is '��߲˵�_�˵�ѡ�и������1��Ĭ�ϣ�2��light';
comment on column CDPFV1.T_SYS_UI.TOP_THEME_COLOR
  is '�����˵�_������ɫ';
comment on column CDPFV1.T_SYS_UI.TOP_CORNER
  is '�����˵�_���Ƿ��1: ֱ�ǣ�2��Բ��';
comment on column CDPFV1.T_SYS_UI.TOP_LAYOUT
  is '�����˵�_ҳ�沼�ַ��1����ʽ��2����ʽ';
comment on column CDPFV1.T_SYS_UI.TOP_HEADER_TOP
  is '�����˵�_ҳü���1���̶���2���ǹ̶�';
comment on column CDPFV1.T_SYS_UI.TOP_HEADER_MENU
  is '�����˵�_�˵�ģʽ1���̶���2���ǹ̶�';
alter table CDPFV1.T_SYS_UI
  add constraint PK_T_SYS_UI primary key (ID)
  using index 
  tablespace CDPFV1
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table T_SYS_USER
prompt =========================
prompt
create table CDPFV1.T_SYS_USER
(
  ID               NUMBER not null,
  USERNAME         VARCHAR2(30),
  PASSWORD         VARCHAR2(40),
  RANDOMCODE       VARCHAR2(6),
  STATUS           NUMBER(2),
  REALNAME         VARCHAR2(20),
  MOBILE           VARCHAR2(11),
  CREATED_AT       DATE,
  CREATED_BY       VARCHAR2(20),
  ROLE_ID          NUMBER,
  LAST_MODIFIED_BY VARCHAR2(20),
  LAST_MODIFIED_AT DATE,
  AVATAR           VARCHAR2(100),
  DEPARTMENT_ID    NUMBER,
  IS_ADMIN         NUMBER default 0,
  IS_CHECK         NUMBER,
  PINYIN           VARCHAR2(10),
  EMAIL            VARCHAR2(40),
  GENDER           VARCHAR2(4),
  NATION           VARCHAR2(20),
  POLITICAL        VARCHAR2(20),
  EDUCATION        VARCHAR2(20),
  GRADUATED_SCHOOL VARCHAR2(40),
  MAJOR            VARCHAR2(40),
  IDCARD           VARCHAR2(18),
  TELEPHONE        VARCHAR2(20),
  POST             VARCHAR2(20),
  JOB_TITLE        VARCHAR2(20),
  DISPLAY_ORDER    NUMBER,
  LAST_LOGIN_DATE  DATE,
  COMPLETION       NUMBER
)
tablespace USERS
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
comment on table CDPFV1.T_SYS_USER
  is 'ϵͳ�û���';
comment on column CDPFV1.T_SYS_USER.ID
  is '������������SEQ_T_SYS_USER��ȡ';
comment on column CDPFV1.T_SYS_USER.USERNAME
  is '��¼�˺�';
comment on column CDPFV1.T_SYS_USER.PASSWORD
  is '����';
comment on column CDPFV1.T_SYS_USER.RANDOMCODE
  is '�����';
comment on column CDPFV1.T_SYS_USER.STATUS
  is '״̬��1������2����';
comment on column CDPFV1.T_SYS_USER.REALNAME
  is '��ʵ����';
comment on column CDPFV1.T_SYS_USER.MOBILE
  is '�ֻ���';
comment on column CDPFV1.T_SYS_USER.CREATED_AT
  is '����ʱ��';
comment on column CDPFV1.T_SYS_USER.CREATED_BY
  is '������';
comment on column CDPFV1.T_SYS_USER.ROLE_ID
  is '��ɫid';
comment on column CDPFV1.T_SYS_USER.LAST_MODIFIED_BY
  is '�ϴ��޸���';
comment on column CDPFV1.T_SYS_USER.LAST_MODIFIED_AT
  is '�ϴ��޸�ʱ��';
comment on column CDPFV1.T_SYS_USER.AVATAR
  is 'ͷ��';
comment on column CDPFV1.T_SYS_USER.DEPARTMENT_ID
  is '����T_SYS_DEPARTMENT��id';
comment on column CDPFV1.T_SYS_USER.IS_ADMIN
  is '�Ƿ����Ա��0��1�ǣ�Ĭ��0
����Ա��������Ȩ�ޡ�ֻ��ϵͳ��ʼ��ʱadmin�ǹ���Ա�������û��Ĳ��˸ı�ʶ
';
comment on column CDPFV1.T_SYS_USER.IS_CHECK
  is '�Ƿ���ˣ�1�ǣ�0���ڲ������û�Ĭ��Ϊ1
Ԥ���ֶ�
';
comment on column CDPFV1.T_SYS_USER.PINYIN
  is '���������Զ����ɼ�д';
comment on column CDPFV1.T_SYS_USER.EMAIL
  is '����';
comment on column CDPFV1.T_SYS_USER.GENDER
  is '�Ա�';
comment on column CDPFV1.T_SYS_USER.NATION
  is '������ֵ�ȡ';
comment on column CDPFV1.T_SYS_USER.POLITICAL
  is '������ò���ֵ�ȡ';
comment on column CDPFV1.T_SYS_USER.EDUCATION
  is '�����̶ȴ��ֵ�ȡ';
comment on column CDPFV1.T_SYS_USER.GRADUATED_SCHOOL
  is '��ҵԺУ';
comment on column CDPFV1.T_SYS_USER.MAJOR
  is 'רҵ';
comment on column CDPFV1.T_SYS_USER.IDCARD
  is '���֤��';
comment on column CDPFV1.T_SYS_USER.TELEPHONE
  is '����';
comment on column CDPFV1.T_SYS_USER.POST
  is 'ְ����ֵ�ȡ';
comment on column CDPFV1.T_SYS_USER.JOB_TITLE
  is 'ְ�ƴ��ֵ�ȡ';
comment on column CDPFV1.T_SYS_USER.DISPLAY_ORDER
  is '����';
comment on column CDPFV1.T_SYS_USER.LAST_LOGIN_DATE
  is '����¼ʱ�䣺��¼���޸ĸ��ֶ�';
comment on column CDPFV1.T_SYS_USER.COMPLETION
  is '�û���Ϣ�����ȣ�100Ϊ���������б�����Ϣռ51��������Ϣռ49��������Ϣ����һ��δ�������Ϣ������ȫΪ0�����û����������Ϊ49�������Ȳ���50���û���Ҫά��������Ϣ��';
alter table CDPFV1.T_SYS_USER
  add constraint PK_T_SYS_USER primary key (ID)
  using index 
  tablespace USERS
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
create index CDPFV1.IDX_T_SYS_USER on CDPFV1.T_SYS_USER (USERNAME)
  tablespace USERS
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
prompt Creating table T_SYS_USERLOGIN
prompt ==============================
prompt
create table CDPFV1.T_SYS_USERLOGIN
(
  ID              NUMBER not null,
  USER_ID         NUMBER,
  LOGIN_DATE      DATE,
  LOGIN_IP        VARCHAR2(20),
  TERMINAL        NUMBER(4),
  EXPLORERTYPE    VARCHAR2(40),
  EXPLORERVERSION VARCHAR2(40),
  SESSIONID       VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table CDPFV1.T_SYS_USERLOGIN
  is '�û���¼��¼';
comment on column CDPFV1.T_SYS_USERLOGIN.ID
  is '������������SEQ_T_SYS_USERLOGIN��ȡ';
comment on column CDPFV1.T_SYS_USERLOGIN.USER_ID
  is '�û�id';
comment on column CDPFV1.T_SYS_USERLOGIN.LOGIN_DATE
  is '��¼ʱ��';
comment on column CDPFV1.T_SYS_USERLOGIN.LOGIN_IP
  is '��¼IP';
comment on column CDPFV1.T_SYS_USERLOGIN.TERMINAL
  is '��¼�նˣ�0:pc,1:wap,2:android,3:ios';
comment on column CDPFV1.T_SYS_USERLOGIN.EXPLORERTYPE
  is '���������';
comment on column CDPFV1.T_SYS_USERLOGIN.EXPLORERVERSION
  is '������汾';
comment on column CDPFV1.T_SYS_USERLOGIN.SESSIONID
  is 'session id';
alter table CDPFV1.T_SYS_USERLOGIN
  add constraint PK_T_SYS_USERLOGIN primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index CDPFV1.IDX_T_SYS_USERLOGIN on CDPFV1.T_SYS_USERLOGIN (USER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TREE_GRID
prompt ==========================
prompt
create table CDPFV1.T_TREE_GRID
(
  ID            NUMBER not null,
  NAME          VARCHAR2(40),
  CODE          VARCHAR2(40),
  PARENT_ID     NUMBER,
  DISPLAY_ORDER NUMBER,
  DESCRIPTION   VARCHAR2(100),
  COL1          VARCHAR2(100),
  COL2          VARCHAR2(100)
)
tablespace USERS
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
comment on column CDPFV1.T_TREE_GRID.ID
  is '����,������SEQ_T_TREE_GRID��ȡֵ';
comment on column CDPFV1.T_TREE_GRID.NAME
  is '�ڵ�����';
comment on column CDPFV1.T_TREE_GRID.CODE
  is '����';
comment on column CDPFV1.T_TREE_GRID.PARENT_ID
  is '�ϼ����ڵ�';
comment on column CDPFV1.T_TREE_GRID.DISPLAY_ORDER
  is '����ֵ';
comment on column CDPFV1.T_TREE_GRID.DESCRIPTION
  is '����';

prompt
prompt Creating sequence SEQ_T_EXAMPLE_COLLEGE
prompt =======================================
prompt
create sequence CDPFV1.SEQ_T_EXAMPLE_COLLEGE
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_EXAMPLE_MAJOR
prompt =====================================
prompt
create sequence CDPFV1.SEQ_T_EXAMPLE_MAJOR
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_EXAMPLE_STUDENT
prompt =======================================
prompt
create sequence CDPFV1.SEQ_T_EXAMPLE_STUDENT
minvalue 1
maxvalue 9999999999999999999999999999
start with 181
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_EXAMPLE_UEDITOR
prompt =======================================
prompt
create sequence CDPFV1.SEQ_T_EXAMPLE_UEDITOR
minvalue 1
maxvalue 999999999
start with 10
increment by 1
nocache;

prompt
prompt Creating sequence SEQ_T_EXAMPLE_ZTREENODE
prompt =========================================
prompt
create sequence CDPFV1.SEQ_T_EXAMPLE_ZTREENODE
minvalue 1
maxvalue 999999999
start with 1
increment by 1
nocache;

prompt
prompt Creating sequence SEQ_T_SYS_ RELEASE
prompt ====================================
prompt
create sequence CDPFV1.SEQ_T_SYS_ RELEASE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_DEPARTMENT
prompt ======================================
prompt
create sequence CDPFV1.SEQ_T_SYS_DEPARTMENT
minvalue 1
maxvalue 9999999999999999999999999999
start with 141
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_DIC
prompt ===============================
prompt
create sequence CDPFV1.SEQ_T_SYS_DIC
minvalue 1
maxvalue 9999999999999999999999999999
start with 181
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ILLUSTRATE
prompt ======================================
prompt
create sequence CDPFV1.SEQ_T_SYS_ILLUSTRATE
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_LOG
prompt ===============================
prompt
create sequence CDPFV1.SEQ_T_SYS_LOG
minvalue 1
maxvalue 9999999999999999999999999999
start with 2561
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ORGANIZATION
prompt ========================================
prompt
create sequence CDPFV1.SEQ_T_SYS_ORGANIZATION
minvalue 1
maxvalue 9999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_RELEASE
prompt ===================================
prompt
create sequence CDPFV1.SEQ_T_SYS_RELEASE
minvalue 1
maxvalue 9999999999999999999999999999
start with 34
increment by 1
nocache;

prompt
prompt Creating sequence SEQ_T_SYS_RESOURCE
prompt ====================================
prompt
create sequence CDPFV1.SEQ_T_SYS_RESOURCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 5701
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ROLE
prompt ================================
prompt
create sequence CDPFV1.SEQ_T_SYS_ROLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 161
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ROLERESOURCE
prompt ========================================
prompt
create sequence CDPFV1.SEQ_T_SYS_ROLERESOURCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_UI
prompt ==============================
prompt
create sequence CDPFV1.SEQ_T_SYS_UI
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_USER
prompt ================================
prompt
create sequence CDPFV1.SEQ_T_SYS_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 201
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_USERLOGIN
prompt =====================================
prompt
create sequence CDPFV1.SEQ_T_SYS_USERLOGIN
minvalue 1
maxvalue 9999999999999999999999999999
start with 3841
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_TREE_GRID
prompt =================================
prompt
create sequence CDPFV1.SEQ_T_TREE_GRID
minvalue 1
maxvalue 9999999999999999999999999999
start with 40
increment by 1
cache 20;


spool off
