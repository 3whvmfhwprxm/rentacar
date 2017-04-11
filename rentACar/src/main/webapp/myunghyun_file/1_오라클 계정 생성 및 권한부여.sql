--SYS 계정으로 계정생성 및 권한 부여
--drop user rent cascade;
create user rent
identified by rent123;

grant create session to rent;
grant connect, resource to rent;

commit;