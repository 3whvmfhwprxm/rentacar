--SYS �������� �������� �� ���� �ο�
--drop user rent cascade;
create user rent
identified by rent123;

grant create session to rent;
grant connect, resource to rent;

commit;