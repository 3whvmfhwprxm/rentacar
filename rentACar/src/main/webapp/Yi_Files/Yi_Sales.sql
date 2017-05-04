select yyyy,
    sum("01") as "January", sum("02") as "February", sum("03") as "March", sum("04") as "April", 
    sum("05") as "May", sum("06") as "June", sum("07") as "July", sum("08") as "August", 
    sum("09") as "September", sum("10") as "October", sum("11") as "November", sum("12") as "December",
    sum(pay_money)-sum(pay_discount) as "sales"
from
(
    select to_char(r.reserv_start_date,'YYYY') AS yyyy, 
    to_char(r.reserv_start_date,'MM') AS MM, to_char(r.reserv_start_date,'DD') AS DD, p.pay_money, p.pay_discount
    , decode(to_char(r.reserv_start_date,'MM'), '01', p.pay_money-p.pay_discount, 0) AS "01"
    , decode(to_char(r.reserv_start_date,'MM'), '02', p.pay_money-p.pay_discount, 0) AS "02"
    , decode(to_char(r.reserv_start_date,'MM'), '03', p.pay_money-p.pay_discount, 0) AS "03"
    , decode(to_char(r.reserv_start_date,'MM'), '04', p.pay_money-p.pay_discount, 0) AS "04"
    , decode(to_char(r.reserv_start_date,'MM'), '05', p.pay_money-p.pay_discount, 0) AS "05"
    , decode(to_char(r.reserv_start_date,'MM'), '06', p.pay_money-p.pay_discount, 0) AS "06"
    , decode(to_char(r.reserv_start_date,'MM'), '07', p.pay_money-p.pay_discount, 0) AS "07"
    , decode(to_char(r.reserv_start_date,'MM'), '08', p.pay_money-p.pay_discount, 0) AS "08"
    , decode(to_char(r.reserv_start_date,'MM'), '09', p.pay_money-p.pay_discount, 0) AS "09"
    , decode(to_char(r.reserv_start_date,'MM'), '10', p.pay_money-p.pay_discount, 0) AS "10"
    , decode(to_char(r.reserv_start_date,'MM'), '11', p.pay_money-p.pay_discount, 0) AS "11"
    , decode(to_char(r.reserv_start_date,'MM'), '12', p.pay_money-p.pay_discount, 0) AS "12"
    from reservation r join payinfo p
    on r.RESERV_NUM=p.RESERV_NUM
)  
group by yyyy
order by yyyy

select*from payinfo;

select*from reservation;

update payinfo
set pay_discount=0
where reserv_num=001

commit;