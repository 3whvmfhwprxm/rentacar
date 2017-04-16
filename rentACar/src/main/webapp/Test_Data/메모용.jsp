<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	월요일 
	* DB수정: 회원,예약정보,예약자 관계 재설정 예약정보가 예약자의 부모가 되도록
	
	* 예약자 컬럼도 바뀌어야함 -> 기본키를 현재 유저아이디가 아닌 시퀀스넘버같은 값으로 설정하도록
						-> 예약정보의 기본키를 참조하도록 포린키 설정
						
	* 예약시스템 기본틀 완성 ->

 -->