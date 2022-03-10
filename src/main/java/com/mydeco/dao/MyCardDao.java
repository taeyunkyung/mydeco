package com.mydeco.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCardDao {

	@Autowired 
	SqlSession sqlSession;
}
