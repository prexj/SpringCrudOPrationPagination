package com.spring.services;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bean.EmployeeBean;
import com.spring.dao.EmployeeDao;

@Service("EmployeeServices")
public class EmployeeServices {
 
	@Autowired
	EmployeeDao empDao;
	
	public ArrayList<EmployeeBean> show() throws ClassNotFoundException, SQLException {
		
		return empDao.getAll();
	}

	public int insert(EmployeeBean empBean) {
		
		return empDao.insertdata(empBean);
	}

	public EmployeeBean getById(int id) {
		
		return empDao.getById(id);
	}

	public int update(EmployeeBean empBean) {
		
		return empDao.Update(empBean);
	}

	public int delete(int id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return empDao.delete(id);
	}

}
