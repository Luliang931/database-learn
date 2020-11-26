/*
case表达式：
1、简单表达式 simple case expression
case sex
    when '1' then 'm'
    when '0' then 'f'
    else 'other' end

2、搜索表达式 searched case expression
case
    when sex = '1' then 'm'
    when sex = '0' then 'f'
    else 'other' end

*/



select case
           when status = 0 then '创建订单'
           when status = 1 then '待发货'
           when status in(14,15) then '采购人确认'
           when status = 16 then '签订合同'
           when status = 4 then '验收'
           when status = 18 then '待支付'
           when status = 7 then '订单完成'
           when status < 0 then '订单关闭'
           when status = 3 then '全部发货'
           else '其他' end as stat,count(*) as count
from zcy_orders group by stat order by count asc;

select instance_code,
       sum(IF(order_item_type = 0, fee, 0))                  as '定价订单总金额' ,
       sum(case when order_item_type =1 then fee else 0 end) as '不定价订单总金额'
from zcy_orders group by instance_code;