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
  is '代码示例学院表';
comment on column CDPFV1.T_EXAMPLE_COLLEGE.ID
  is '主键，从序列SEQ_T_EXAMPLE_COLLEGE获取';
comment on column CDPFV1.T_EXAMPLE_COLLEGE.NO
  is '学院编号';
comment on column CDPFV1.T_EXAMPLE_COLLEGE.NAME
  is '学院名称';
comment on column CDPFV1.T_EXAMPLE_COLLEGE.REMARK
  is '备注';
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
  is '代码示例专业表';
comment on column CDPFV1.T_EXAMPLE_MAJOR.ID
  is '主键，从序列SEQ_T_EXAMPLE_MAJOR获取';
comment on column CDPFV1.T_EXAMPLE_MAJOR.NO
  is '专业编号';
comment on column CDPFV1.T_EXAMPLE_MAJOR.NAME
  is '专业名称';
comment on column CDPFV1.T_EXAMPLE_MAJOR.COLLEGE_NO
  is '学院编号';
comment on column CDPFV1.T_EXAMPLE_MAJOR.COLLEGE_NAME
  is '学院名称';
comment on column CDPFV1.T_EXAMPLE_MAJOR.REMARK
  is '备注';
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
  is '代码示例学生表';
comment on column CDPFV1.T_EXAMPLE_STUDENT.ID
  is '主键，从序列SEQ_T_EXAMPLE_STUDENT获取';
comment on column CDPFV1.T_EXAMPLE_STUDENT.NO
  is '学号';
comment on column CDPFV1.T_EXAMPLE_STUDENT.NAME
  is '姓名';
comment on column CDPFV1.T_EXAMPLE_STUDENT.SEX
  is '性别，0-男，1-女';
comment on column CDPFV1.T_EXAMPLE_STUDENT.IDCARD_NO
  is '身份证号';
comment on column CDPFV1.T_EXAMPLE_STUDENT.COLLEGE_NO
  is '学院编号';
comment on column CDPFV1.T_EXAMPLE_STUDENT.MAJOR_NO
  is '专业编号';
comment on column CDPFV1.T_EXAMPLE_STUDENT.REMARK
  is '备注';
comment on column CDPFV1.T_EXAMPLE_STUDENT.ISDELETE
  is '是否能够删除，N不能，Y能';
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
  is '主键，从SEQ_T_SYS_DEPARTMENT生成';
comment on column CDPFV1.T_SYS_DEPARTMENT.NAME
  is '名称';
comment on column CDPFV1.T_SYS_DEPARTMENT.PARENT_ID
  is '上级节点，对应本表ID';
comment on column CDPFV1.T_SYS_DEPARTMENT.TYPE
  is '部门类型，从字典取，比如1路局2客运段3车辆段';
comment on column CDPFV1.T_SYS_DEPARTMENT.CODE
  is '部门编码';
comment on column CDPFV1.T_SYS_DEPARTMENT.DISPLAY_ORDER
  is '排序';
comment on column CDPFV1.T_SYS_DEPARTMENT.NOTE
  is '备注';
comment on column CDPFV1.T_SYS_DEPARTMENT.CREATED_BY
  is '创建人';
comment on column CDPFV1.T_SYS_DEPARTMENT.CREATED_AT
  is '创建时间';
comment on column CDPFV1.T_SYS_DEPARTMENT.LAST_MODIFIED_BY
  is '上次修改人';
comment on column CDPFV1.T_SYS_DEPARTMENT.LAST_MODIFIED_AT
  is '上次修改时间';
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
  is '主键，从SEQ_T_SYS_DIC生成';
comment on column CDPFV1.T_SYS_DIC.CATEGORY
  is '分类：01民族02政治面貌03教育程度04职务05职称
06部门类型
';
comment on column CDPFV1.T_SYS_DIC.CATEGORY_NAME
  is '分类名称';
comment on column CDPFV1.T_SYS_DIC.CODE
  is '字典代码';
comment on column CDPFV1.T_SYS_DIC.NAME
  is '字典名称';
comment on column CDPFV1.T_SYS_DIC.DISPLAY_ORDER
  is '排序';
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
  is '主键，从序列SEQ_T_SYS_ RELEASE获取';
comment on column CDPFV1.T_SYS_RELEASE.NAME
  is '系统名称';
comment on column CDPFV1.T_SYS_RELEASE.VERSION
  is '版本号';
comment on column CDPFV1.T_SYS_RELEASE.RELEASE_DATE
  is '发布日期：Yyyy-mm-dd';
comment on column CDPFV1.T_SYS_RELEASE.RELEASE_CONTENT
  is '发布内容文件地址';
comment on column CDPFV1.T_SYS_RELEASE.RELEASE_BY
  is '发布人';
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
  is '系统资源表';
comment on column CDPFV1.T_SYS_RESOURCE.ID
  is '主键，从序列SEQ_T_SYS_RESOURCE获取';
comment on column CDPFV1.T_SYS_RESOURCE.NAME
  is '资源名称';
comment on column CDPFV1.T_SYS_RESOURCE.CODE
  is '资源代码';
comment on column CDPFV1.T_SYS_RESOURCE.PARENT_ID
  is '上级节点';
comment on column CDPFV1.T_SYS_RESOURCE.URL
  is '链接';
comment on column CDPFV1.T_SYS_RESOURCE.TARGET
  is '链接目标';
comment on column CDPFV1.T_SYS_RESOURCE.ICONIMG
  is '图标';
comment on column CDPFV1.T_SYS_RESOURCE.DISPLAY_ORDER
  is '排序值';
comment on column CDPFV1.T_SYS_RESOURCE.TYPE
  is '资源类型,1模块，2操作';
comment on column CDPFV1.T_SYS_RESOURCE.DESCRIPTION
  is '描述';
comment on column CDPFV1.T_SYS_RESOURCE.RESOURCE_LEVEL
  is '资源等级:1仅限系统管理，2所有人';
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
  is '主键，从序列SEQ_T_SYS_ROLE获取';
comment on column CDPFV1.T_SYS_ROLE.NAME
  is '角色名称';
comment on column CDPFV1.T_SYS_ROLE.DESCRIPTION
  is '描述';
comment on column CDPFV1.T_SYS_ROLE.DISPLAY_ORDER
  is '排序值';
comment on column CDPFV1.T_SYS_ROLE.CREATED_AT
  is '创建人';
comment on column CDPFV1.T_SYS_ROLE.CREATED_BY
  is '创建时间';
comment on column CDPFV1.T_SYS_ROLE.LAST_MODIFIED_BY
  is '上次修改人';
comment on column CDPFV1.T_SYS_ROLE.LAST_MODIFIED_AT
  is '上次修改时间';
comment on column CDPFV1.T_SYS_ROLE.IS_DELETE
  is '标记角色是否可以被删除。0:不可以被删除；1：可以被删除。默认为1';
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
  is '角色资源表';
comment on column CDPFV1.T_SYS_ROLERESOURCE.ID
  is '主键，从序列SEQ_T_SYS_ROLRESOURCE获取';
comment on column CDPFV1.T_SYS_ROLERESOURCE.ROLE_ID
  is '角色id';
comment on column CDPFV1.T_SYS_ROLERESOURCE.RESOURCE_ID
  is '资源id';
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
  is '主键';
comment on column CDPFV1.T_SYS_UI.ROLE_ID
  is '系统角色的主键';
comment on column CDPFV1.T_SYS_UI.MENU_STYLE
  is '菜单风格1：侧边SIDE；2：顶部TOP';
comment on column CDPFV1.T_SYS_UI.SIDE_THEME_COLOR
  is '侧边菜单_主题颜色';
comment on column CDPFV1.T_SYS_UI.SIDE_CORNER
  is '侧边菜单_顶角风格1: 直角；2：圆角';
comment on column CDPFV1.T_SYS_UI.SIDE_LAYOUT
  is '侧边菜单_页面布局风格1：流式；2：盒式';
comment on column CDPFV1.T_SYS_UI.SIDE_HEADER
  is '侧边菜单_页眉风格1：固定；2：非固定';
comment on column CDPFV1.T_SYS_UI.SIDE_FOOTER
  is '侧边菜单_页脚风格1：固定；2：非固定';
comment on column CDPFV1.T_SYS_UI.SIDE_SIDEBAR_MODE
  is '侧边菜单_菜单模式1：固定；2；非固定';
comment on column CDPFV1.T_SYS_UI.SIDE_SIDEBAR_MENU
  is '侧边菜单_菜单选项样式1：accordion手风琴；2：hover悬浮';
comment on column CDPFV1.T_SYS_UI.SIDE_SIDEBAR_SELECTION
  is '侧边菜单_菜单选中高亮风格1：默认；2：light';
comment on column CDPFV1.T_SYS_UI.TOP_THEME_COLOR
  is '顶部菜单_主题颜色';
comment on column CDPFV1.T_SYS_UI.TOP_CORNER
  is '顶部菜单_顶角风格1: 直角；2：圆角';
comment on column CDPFV1.T_SYS_UI.TOP_LAYOUT
  is '顶部菜单_页面布局风格1：流式；2：盒式';
comment on column CDPFV1.T_SYS_UI.TOP_HEADER_TOP
  is '顶部菜单_页眉风格1：固定；2：非固定';
comment on column CDPFV1.T_SYS_UI.TOP_HEADER_MENU
  is '顶部菜单_菜单模式1：固定；2；非固定';
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
  is '系统用户表';
comment on column CDPFV1.T_SYS_USER.ID
  is '主键，从序列SEQ_T_SYS_USER获取';
comment on column CDPFV1.T_SYS_USER.USERNAME
  is '登录账号';
comment on column CDPFV1.T_SYS_USER.PASSWORD
  is '密码';
comment on column CDPFV1.T_SYS_USER.RANDOMCODE
  is '随机数';
comment on column CDPFV1.T_SYS_USER.STATUS
  is '状态，1正常，2锁定';
comment on column CDPFV1.T_SYS_USER.REALNAME
  is '真实姓名';
comment on column CDPFV1.T_SYS_USER.MOBILE
  is '手机号';
comment on column CDPFV1.T_SYS_USER.CREATED_AT
  is '创建时间';
comment on column CDPFV1.T_SYS_USER.CREATED_BY
  is '创建人';
comment on column CDPFV1.T_SYS_USER.ROLE_ID
  is '角色id';
comment on column CDPFV1.T_SYS_USER.LAST_MODIFIED_BY
  is '上次修改人';
comment on column CDPFV1.T_SYS_USER.LAST_MODIFIED_AT
  is '上次修改时间';
comment on column CDPFV1.T_SYS_USER.AVATAR
  is '头像';
comment on column CDPFV1.T_SYS_USER.DEPARTMENT_ID
  is '关联T_SYS_DEPARTMENT的id';
comment on column CDPFV1.T_SYS_USER.IS_ADMIN
  is '是否管理员：0否1是，默认0
管理员开放所有权限。只有系统初始化时admin是管理员，其余用户改不了改标识
';
comment on column CDPFV1.T_SYS_USER.IS_CHECK
  is '是否审核：1是，0否，内部新增用户默认为1
预留字段
';
comment on column CDPFV1.T_SYS_USER.PINYIN
  is '根据姓名自动生成简写';
comment on column CDPFV1.T_SYS_USER.EMAIL
  is '邮箱';
comment on column CDPFV1.T_SYS_USER.GENDER
  is '性别';
comment on column CDPFV1.T_SYS_USER.NATION
  is '民族从字典取';
comment on column CDPFV1.T_SYS_USER.POLITICAL
  is '政治面貌从字典取';
comment on column CDPFV1.T_SYS_USER.EDUCATION
  is '教育程度从字典取';
comment on column CDPFV1.T_SYS_USER.GRADUATED_SCHOOL
  is '毕业院校';
comment on column CDPFV1.T_SYS_USER.MAJOR
  is '专业';
comment on column CDPFV1.T_SYS_USER.IDCARD
  is '身份证号';
comment on column CDPFV1.T_SYS_USER.TELEPHONE
  is '座机';
comment on column CDPFV1.T_SYS_USER.POST
  is '职务从字典取';
comment on column CDPFV1.T_SYS_USER.JOB_TITLE
  is '职称从字典取';
comment on column CDPFV1.T_SYS_USER.DISPLAY_ORDER
  is '排序';
comment on column CDPFV1.T_SYS_USER.LAST_LOGIN_DATE
  is '最后登录时间：登录后修改该字段';
comment on column CDPFV1.T_SYS_USER.COMPLETION
  is '用户信息完整度，100为完整，其中必填信息占51，其他信息占49。必填信息的任一项未填，必填信息完整度全为0，则用户完整度最高为49。完整度不足50的用户需要维护必填信息。';
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
  is '用户登录记录';
comment on column CDPFV1.T_SYS_USERLOGIN.ID
  is '主键，从序列SEQ_T_SYS_USERLOGIN获取';
comment on column CDPFV1.T_SYS_USERLOGIN.USER_ID
  is '用户id';
comment on column CDPFV1.T_SYS_USERLOGIN.LOGIN_DATE
  is '登录时间';
comment on column CDPFV1.T_SYS_USERLOGIN.LOGIN_IP
  is '登录IP';
comment on column CDPFV1.T_SYS_USERLOGIN.TERMINAL
  is '登录终端，0:pc,1:wap,2:android,3:ios';
comment on column CDPFV1.T_SYS_USERLOGIN.EXPLORERTYPE
  is '浏览器类型';
comment on column CDPFV1.T_SYS_USERLOGIN.EXPLORERVERSION
  is '浏览器版本';
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
  is '主键,从序列SEQ_T_TREE_GRID获取值';
comment on column CDPFV1.T_TREE_GRID.NAME
  is '节点名称';
comment on column CDPFV1.T_TREE_GRID.CODE
  is '代码';
comment on column CDPFV1.T_TREE_GRID.PARENT_ID
  is '上级父节点';
comment on column CDPFV1.T_TREE_GRID.DISPLAY_ORDER
  is '排序值';
comment on column CDPFV1.T_TREE_GRID.DESCRIPTION
  is '描述';

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
