package com.mydeco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.TestDao;

@Service
public class TestService {

	@Autowired
	private TestDao testDao;
	
	public void tests() {
		System.out.println("service test");
		testDao.test();
	}
}
