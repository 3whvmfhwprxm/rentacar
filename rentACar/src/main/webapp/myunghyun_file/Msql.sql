select *from Counsel;



select * from rent_admin;
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('jinwootea','1','������','010','1125','1254','jinwootea','nate',sysdate,'1');


insert into Counsel(counsel_id, user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(1,'010','1231','1251','����','1�� �̻� �����Ͻ� ����
������ ���� ������ ���� 3��,4�� ������ ���� ����',sysdate,'����� �Һα��Կ� ���� 
����ϼż� �������� ���庸�� ��� ���̴� �̷��� ������ �����̼̽��ϴ�.','Y',
'jinwootea');

commit;