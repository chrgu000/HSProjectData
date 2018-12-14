/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/9/7 9:28:07                             */
/*==============================================================*/


drop table if exists hs_advertisement;

drop table if exists hs_browse_record;

drop table if exists hs_good_type;

drop table if exists hs_order;

drop table if exists hs_saleman;

drop table if exists hs_user;

/*==============================================================*/
/* Table: hs_advertisement                                      */
/*==============================================================*/
create table hs_advertisement
(
   banne_id             int not null,
   image_url            varchar(250),
   is_show              varchar(10) comment '0不展示，1展示',
   order_by             int comment '值越小越靠前',
   create_time          datetime,
   creater              datetime,
   update_time          datetime,
   updater              datetime,
   primary key (banne_id)
);

/*==============================================================*/
/* Table: hs_browse_record                                      */
/*==============================================================*/
create table hs_browse_record
(
   ID                   int not null,
   user_id              varchar(250),
   shop_title           varchar(250),
   user_type            varchar(250) comment '0表示集市，1表示商城',
   zk_final_price       varchar(250),
   title                varchar(250),
   nick                 varchar(250),
   seller_id            varchar(250),
   volume               varchar(250),
   pict_url             varchar(250),
   item_url             varchar(250),
   coupon_total_count   varchar(250),
   commission_rate      varchar(250),
   coupon_info          varchar(250),
   category             varchar(250),
   num_iid              varchar(250),
   coupon_remain_coun   varchar(250),
   coupon_start_time    varchar(250),
   coupon_end_time      varchar(250),
   coupon_click_url     varchar(250),
   item_description     varchar(2500),
   create_time          datetime,
   creater              datetime,
   update_time          datetime,
   updater              datetime,
   primary key (ID)
);

/*==============================================================*/
/* Table: hs_good_type                                          */
/*==============================================================*/
create table hs_good_type
(
   cid                  varchar(250) not null,
   name                 varchar(250),
   parent_cid           varchar(250) comment '0为一级目录',
   is_parent            varchar(250) comment '0为不是,1这是',
   order_by             int,
   create_time          datetime,
   creater              datetime,
   update_time          datetime,
   updater              datetime,
   primary key (cid)
);

/*==============================================================*/
/* Table: hs_order                                              */
/*==============================================================*/
create table hs_order
(
   order_create_time    varchar(250),
   click_time           varchar(250),
   goods_info           varchar(250),
   goods_id             varchar(250),
   wang_wang            varchar(250),
   affiliated_store     varchar(250),
   goods_amount         varchar(250),
   Item_price           varchar(250),
   order_status         varchar(250),
   order_type           varchar(250),
   income_ratio         varchar(250),
   split_rate           varchar(250),
   payment_amount       varchar(250),
   result_estimate      varchar(250),
   settlement_amount    varchar(250),
   estimated_revenue    varchar(250),
   settlement_time      varchar(250),
   commission_rate      varchar(250),
   commission_amount    varchar(250),
   subsidy_ratio        varchar(250),
   subsidy_amount       varchar(250),
   subsidy_type         varchar(250),
   transaction_platform varchar(250),
   product_type         varchar(250),
   order_id             varchar(250) not null,
   category_name        varchar(250),
   source_media_id      varchar(250),
   source_media_name    varchar(250),
   ad_position_id       varchar(250),
   ad_position_name     varchar(250),
   create_time          datetime,
   creater              datetime,
   update_time          datetime,
   updater              datetime,
   primary key (order_id)
);

/*==============================================================*/
/* Table: hs_saleman                                            */
/*==============================================================*/
create table hs_saleman
(
   saleman_id           varchar(250) not null,
   invite_code          varchar(250),
   parent_id            varchar(250),
   create_time          datetime,
   creater              datetime,
   update_time          datetime,
   updater              datetime,
   primary key (saleman_id)
);

/*==============================================================*/
/* Table: hs_user                                               */
/*==============================================================*/
create table hs_user
(
   user_id              varchar(250) not null,
   phone_number         varchar(250),
   head_image           varchar(250),
   password             varchar(250),
   nick_name            varchar(250),
   invite_code          varchar(250),
   create_time          datetime,
   creater              datetime,
   update_time          datetime,
   updater              datetime,
   primary key (user_id)
);

alter table hs_browse_record add constraint FK_Reference_1 foreign key (user_id)
      references hs_user (user_id) on delete restrict on update restrict;

