select DISTINCT u.golden_id,o.dealerid,o.order_id into #temp from crm_draw_user_ulp u,crm_tyre t,crm_tyre_order o where u.campaign_code='KAGFGB_2309' 
and u.biz_key=t.qrcode and t.order_id=o.order_id
 and CONVERT(Nvarchar, u.create_time, 23) < convert(Nvarchar,dateadd(dd,0,getdate()),23)

select d.dealer_type,d.dealer_no,d.dealer_name ,
u3.qty3	'已注册人数',u3.qty2	'已注册轮胎数',
(select count( distinct u.id ) from crm_draw_user_ulp u,#temp t where  U.campaign_code='KAGFGB_2309' and u.golden_id=t.golden_id and t.dealerid=d.dealer_no and CONVERT(Nvarchar, u.create_time, 23) < convert(Nvarchar,dateadd(dd,0,getdate()),23) )'有效轮胎数' ,
(select count(distinct u.id) from crm_draw_user_ulp u,#temp t where  U.campaign_code='KAGFGB_2309' and u.golden_id=t.golden_id and t.dealerid=d.dealer_no AND u.name=N'38元红包' and CONVERT(Nvarchar, u.create_time, 23) < convert(Nvarchar,dateadd(dd,0,getdate()),23) )'38元红包个数',
(select count(distinct u.id) from crm_draw_user_ulp u,#temp t where  U.campaign_code='KAGFGB_2309' and u.golden_id=t.golden_id and t.dealerid=d.dealer_no AND u.name=N'100元加油卡' and CONVERT(Nvarchar, u.create_time, 23) < convert(Nvarchar,dateadd(dd,0,getdate()),23) )'100元加油卡个数'，
(select count(distinct u.id) from crm_draw_user_ulp u,#temp t where  U.campaign_code='KAGFGB_2309' and u.golden_id=t.golden_id and t.dealerid=d.dealer_no AND u.name=N'188元红包' and CONVERT(Nvarchar, u.create_time, 23) < convert(Nvarchar,dateadd(dd,0,getdate()),23) )'188元红包个数'
from  crm_campaign_dealer_ulp cd  ,crm_dealer d 
    left join (select o.dealerid,count(distinct t.tyre_id)qty2,count(distinct o.user_id)qty3 from crm_tyre_order o,crm_tyre t,crm_tyre_channel_info i 
	where o.order_id = t.order_id  and  t.tyre_id=i.tyre_id  and o.create_time>='2023-09-15 00:00:00'and i.rebate_code not in('55','-104','104','-55','-61')
	and o.order_type<>'R'and CONVERT(Nvarchar, o.create_time, 23) < convert(Nvarchar,dateadd(dd,0,getdate()),23)  group by o.dealerid) u3 on u3.dealerid=d.dealer_no  
  where  cd.dealer_no=d.dealer_no and cd.draw_code='KAGFGB_2309' and cd.[desc]=N'广本'
  ORDER BY  d.dealer_type DESC;

select * from crm_draw_user_ulp where campaign_code='KAGFGB_2309'


select d.dealer_no,d.dealer_name,t.qrcode ,t.cai,c.inch,c.pattern_name,i.tire_wholesaler_name,i.kind_of_customer,o.active_channel ,o.create_time,o.order_id,o.user_id from crm_tyre_order o,crm_tyre t,crm_cai c,crm_dealer d,crm_campaign_dealer_ulp d1,crm_tyre_channel_info i
where d1.[desc]=N'广本' and o.order_id = t.order_id and t.cai=c.cai and o.dealerid=d.dealer_no and  o.create_time>='2023-09-15 00:00:00' and d.dealer_no=d1.dealer_no and d1.draw_code='KAGFGB_2309' and d.dealer_no<>'888888'
and t.tyre_id=i.tyre_id and o.order_type<>'R'and CONVERT(Nvarchar, o.create_time, 23) < convert(Nvarchar,dateadd(dd,0,getdate()),23)  order by  o.create_time,o.order_id,o.user_id
-- select top 1* from crm_tyre_channel_info o,crm_tyre t where t.qrcode='3085768084586087' and t.tyre_id=o.tyre_id




 select  t1.order_id,u.create_time,u.golden_id,d.dealer_type,t1.dealerid,d.dealer_name,
 (SELECT top 1 s.cai
          FROM crm_tyre l, crm_cai s
         WHERE l.order_id = t1.order_id AND s.cai = l.cai)
          轮胎CAI,
  (SELECT top 1 s.inch
          FROM crm_tyre l, crm_cai s
         WHERE l.order_id = t1.order_id AND s.cai = l.cai)
          轮胎尺寸,
       (SELECT top 1 s.pattern_name
          FROM crm_tyre l, crm_cai s
         WHERE l.order_id = t1.order_id AND s.cai = l.cai)
          轮胎花纹,
       (SELECT COUNT(l.tyre_id)
          FROM crm_tyre l,crm_tyre_channel_info f
         WHERE l.order_id = t1.order_id and l.tyre_id=f.tyre_id and f.rebate_code not in('55','-104','104','-55','-61')  )
          轮胎条数,
 u.name from crm_draw_user_ulp u ,#temp t1,crm_dealer d where u.campaign_code='KAGFGB_2309' 
and u.golden_id=t1.golden_id and t1.dealerid=d.dealer_no and d.dealer_no<>'888888'
 and CONVERT(Nvarchar, u.create_time, 23) < convert(Nvarchar,dateadd(dd,0,getdate()),23)  ORDER BY create_time

 
 
select U.name,CONVERT(Nvarchar, u.create_time, 23)时间,count(*)个数 from  crm_draw_user_ulp u
 where campaign_code='KAGFGB_2309' 
   and  CONVERT(Nvarchar, u.create_time, 23) < convert(Nvarchar,dateadd(dd,0,getdate()),23) 
 group by CONVERT(Nvarchar, u.create_time, 23), U.name order by CONVERT(Nvarchar, u.create_time, 23)
