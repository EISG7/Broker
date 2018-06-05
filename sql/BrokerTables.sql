/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/6/5 18:21:36                            */
/*==============================================================*/


drop table if exists Broker;

drop table if exists MarketDepth;

drop table if exists "Order";

drop table if exists Product;

/*==============================================================*/
/* Table: Broker                                                */
/*==============================================================*/
create table Broker
(
   id                   int not null,
   name                 varchar(20) not null,
   password             varchar(32) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: MarketDepth                                           */
/*==============================================================*/
create table MarketDepth
(
   product              varchar(8),
   id                   int not null,
   unitPrice            int not null,
   quantity             int not null,
   type                 bool not null,
   primary key (id)
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order"
(
   id                   int not null,
   code                 varchar(8) not null,
   product              varchar(16) not null,
   period               varchar(16) not null,
   price                int not null,
   quantity             int not null,
   initiatorName        varchar(20) not null,
   initiatorComp        varchar(20) not null,
   initiatorSide        bool not null,
   initializationTime   timestamp not null,
   completionName       varchar(20),
   completionComp       varchar(20),
   completionTime       timestamp,
   type                 int not null,
   "condition"          int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product
(
   code                 varchar(8) not null,
   name                 varchar(16) not null,
   period               varchar(16) not null,
   measurement          varchar(8) not null,
   level                int not null,
   primary key (code)
);

alter table MarketDepth add constraint FK_Reference_3 foreign key (product)
      references Product (code) on delete restrict on update restrict;

alter table "Order" add constraint FK_Reference_2 foreign key (code)
      references Product (code) on delete restrict on update restrict;

