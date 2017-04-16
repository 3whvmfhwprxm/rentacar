package com.third.rent.admin_CarModel.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class Admin_CarModelDAOmyBatis extends SqlSessionDaoSupport
	implements Admin_CarModelDAO{
	
	private String namespace="config.mybatis.mapper.oracle.admin_CarModel";

}
