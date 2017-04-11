select *from Counsel;



select * from rent_admin;
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('jinwootea','1','진우태','010','1125','1254','jinwootea','nate',sysdate,'1');


insert into Counsel(counsel_id, user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(1,'010','1231','1251','예약','1년 이상 재직하신 고객님
여러곳 견적 받으신 상태 3년,4년 유리한 상태 문의',sysdate,'상담결과 할부구입에 대해 
고민하셔서 보험경력을 여쭤보니 사고가 나셨던 이력이 있으신 고객님이셨습니다.','Y',
'jinwootea');

commit;