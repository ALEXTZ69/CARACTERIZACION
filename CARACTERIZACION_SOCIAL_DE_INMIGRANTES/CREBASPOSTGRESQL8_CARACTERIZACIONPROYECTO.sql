/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     09/06/2022 5:44:36                           */
/*==============================================================*/


drop index ARRIBO_PK;

drop table ARRIBO;

drop index RELATIONSHIP_5_FK;

drop index AYUDA_PK;

drop table AYUDA;

drop index RELATIONSHIP_1_FK;

drop index DEPARTAMENTO_PK;

drop table DEPARTAMENTO;

drop index RELATIONSHIP_7_FK;

drop index RELATIONSHIP_8_FK;

drop index RELATIONSHIP_6_FK;

drop index RELATIONSHIP_3_FK;

drop index FICHA_PK;

drop table FICHA;

drop index RELATIONSHIP_2_FK;

drop index FUNCIONARIO_PUBLICO_PK;

drop table FUNCIONARIO_PUBLICO;

drop index INMIGRANTE_PK;

drop table INMIGRANTE;

drop index MOTIVO_PK;

drop table MOTIVO;

drop index OFICINA_PK;

drop table OFICINA;

/*==============================================================*/
/* Table: ARRIBO                                                */
/*==============================================================*/
create table ARRIBO (
   ID_LLEGADA           INT4                 not null,
   FECHA_ARRIBO         DATE                 not null,
   UNIDAD_CONTROL       VARCHAR(10)          not null,
   CIUDAD_RESIDENCIA    VARCHAR(20)          not null,
   TIEMPO_ESTADIA       VARCHAR(35)          not null,
   FECHA_SALIDA         DATE                 not null,
   constraint PK_ARRIBO primary key (ID_LLEGADA)
);

/*==============================================================*/
/* Index: ARRIBO_PK                                             */
/*==============================================================*/
create unique index ARRIBO_PK on ARRIBO (
ID_LLEGADA
);

/*==============================================================*/
/* Table: AYUDA                                                 */
/*==============================================================*/
create table AYUDA (
   ID_AYUDA             INT4                 not null,
   ID__MOTIVO           INT4                 not null,
   TIPO_AYUDA           VARCHAR(20)          not null,
   CANTIDAD_ECONOMICA   VARCHAR(8)           null,
   EXPLICACION_AYUDA    VARCHAR(200)         not null,
   constraint PK_AYUDA primary key (ID_AYUDA)
);

/*==============================================================*/
/* Index: AYUDA_PK                                              */
/*==============================================================*/
create unique index AYUDA_PK on AYUDA (
ID_AYUDA
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on AYUDA (
ID__MOTIVO
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_OFICINA           INT4                 not null,
   ID_DEP               INT4                 not null,
   NOMBRE_DEPARTAMENTO  VARCHAR(15)          null,
   CANTIDAD_EMPLEADOS   VARCHAR(10)          null,
   constraint PK_DEPARTAMENTO primary key (ID_OFICINA, ID_DEP)
);

/*==============================================================*/
/* Index: DEPARTAMENTO_PK                                       */
/*==============================================================*/
create unique index DEPARTAMENTO_PK on DEPARTAMENTO (
ID_OFICINA,
ID_DEP
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on DEPARTAMENTO (
ID_OFICINA
);

/*==============================================================*/
/* Table: FICHA                                                 */
/*==============================================================*/
create table FICHA (
   ID_LLEGADA           INT4                 not null,
   ID__MOTIVO           INT4                 not null,
   ID_INM               INT4                 not null,
   ID_OFICINA           INT4                 not null,
   ID_DEP               INT4                 not null,
   ID_FUN               INT4                 not null,
   ID_FICHA             INT4                 not null,
   FECHA_SUP            DATE                 not null,
   constraint PK_FICHA primary key (ID_LLEGADA, ID__MOTIVO, ID_INM, ID_OFICINA, ID_DEP, ID_FUN, ID_FICHA)
);

/*==============================================================*/
/* Index: FICHA_PK                                              */
/*==============================================================*/
create unique index FICHA_PK on FICHA (
ID_LLEGADA,
ID__MOTIVO,
ID_INM,
ID_OFICINA,
ID_DEP,
ID_FUN,
ID_FICHA
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on FICHA (
ID_OFICINA,
ID_DEP,
ID_FUN
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on FICHA (
ID_INM
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on FICHA (
ID__MOTIVO
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on FICHA (
ID_LLEGADA
);

/*==============================================================*/
/* Table: FUNCIONARIO_PUBLICO                                   */
/*==============================================================*/
create table FUNCIONARIO_PUBLICO (
   ID_OFICINA           INT4                 not null,
   ID_DEP               INT4                 not null,
   ID_FUN               INT4                 not null,
   NOMBRES_FUN          VARCHAR(20)          not null,
   APELLIDOS_FUN        VARCHAR(20)          not null,
   DNI_FUN              VARCHAR(10)          not null,
   CELULAR_FUN          VARCHAR(15)          not null,
   DOB_FUN              DATE                 not null,
   GENERO_FUN           VARCHAR(1)           not null,
   NAC_FUN              VARCHAR(3)           not null,
   constraint PK_FUNCIONARIO_PUBLICO primary key (ID_OFICINA, ID_DEP, ID_FUN)
);

/*==============================================================*/
/* Index: FUNCIONARIO_PUBLICO_PK                                */
/*==============================================================*/
create unique index FUNCIONARIO_PUBLICO_PK on FUNCIONARIO_PUBLICO (
ID_OFICINA,
ID_DEP,
ID_FUN
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on FUNCIONARIO_PUBLICO (
ID_OFICINA,
ID_DEP
);

/*==============================================================*/
/* Table: INMIGRANTE                                            */
/*==============================================================*/
create table INMIGRANTE (
   ID_INM               INT4                 not null,
   N_PASAPORTE_INM      VARCHAR(9)           not null,
   NOMBRES_INM          VARCHAR(30)          not null,
   APELLIDOS_INM        VARCHAR(30)          not null,
   DOB_INM              DATE                 not null,
   NAC_INM              VARCHAR(3)           not null,
   DNI_INM              VARCHAR(10)          not null,
   GENERO_INM           VARCHAR(1)           not null,
   PROFESION_INM        VARCHAR(20)          null,
   constraint PK_INMIGRANTE primary key (ID_INM)
);

/*==============================================================*/
/* Index: INMIGRANTE_PK                                         */
/*==============================================================*/
create unique index INMIGRANTE_PK on INMIGRANTE (
ID_INM
);

/*==============================================================*/
/* Table: MOTIVO                                                */
/*==============================================================*/
create table MOTIVO (
   ID__MOTIVO           INT4                 not null,
   MOTIVO_SALIDA        VARCHAR(30)          not null,
   MOTIVO_LLEGADA       VARCHAR(30)          null,
   SITUACION_ECONOMICA  VARCHAR(11)          null,
   constraint PK_MOTIVO primary key (ID__MOTIVO)
);

/*==============================================================*/
/* Index: MOTIVO_PK                                             */
/*==============================================================*/
create unique index MOTIVO_PK on MOTIVO (
ID__MOTIVO
);

/*==============================================================*/
/* Table: OFICINA                                               */
/*==============================================================*/
create table OFICINA (
   ID_OFICINA           INT4                 not null,
   PROVINCIA_OFICINA    VARCHAR(20)          not null,
   CIUDAD_OFICINA       VARCHAR(20)          not null,
   DIRECCION_OFICINA    VARCHAR(30)          null,
   constraint PK_OFICINA primary key (ID_OFICINA)
);

/*==============================================================*/
/* Index: OFICINA_PK                                            */
/*==============================================================*/
create unique index OFICINA_PK on OFICINA (
ID_OFICINA
);

alter table AYUDA
   add constraint FK_AYUDA_RELATIONS_MOTIVO foreign key (ID__MOTIVO)
      references MOTIVO (ID__MOTIVO)
      on delete restrict on update restrict;

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_RELATIONS_OFICINA foreign key (ID_OFICINA)
      references OFICINA (ID_OFICINA)
      on delete restrict on update restrict;

alter table FICHA
   add constraint FK_FICHA_RELATIONS_FUNCIONA foreign key (ID_OFICINA, ID_DEP, ID_FUN)
      references FUNCIONARIO_PUBLICO (ID_OFICINA, ID_DEP, ID_FUN)
      on delete restrict on update restrict;

alter table FICHA
   add constraint FK_FICHA_RELATIONS_INMIGRAN foreign key (ID_INM)
      references INMIGRANTE (ID_INM)
      on delete restrict on update restrict;

alter table FICHA
   add constraint FK_FICHA_RELATIONS_ARRIBO foreign key (ID_LLEGADA)
      references ARRIBO (ID_LLEGADA)
      on delete restrict on update restrict;

alter table FICHA
   add constraint FK_FICHA_RELATIONS_MOTIVO foreign key (ID__MOTIVO)
      references MOTIVO (ID__MOTIVO)
      on delete restrict on update restrict;

alter table FUNCIONARIO_PUBLICO
   add constraint FK_FUNCIONA_RELATIONS_DEPARTAM foreign key (ID_OFICINA, ID_DEP)
      references DEPARTAMENTO (ID_OFICINA, ID_DEP)
      on delete restrict on update restrict;

