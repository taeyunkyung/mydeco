package com.mydeco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.MyCardDao;

@Service
public class MyCardService {

	@Autowired 
	MyCardDao mycardDao;
	
}
