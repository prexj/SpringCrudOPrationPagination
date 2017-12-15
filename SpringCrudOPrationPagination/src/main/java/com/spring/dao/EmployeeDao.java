package com.spring.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.spring.bean.EmployeeBean;
import com.spring.util.Dbconnection;

@Component
public class EmployeeDao {
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	Statement st =null;
	EmployeeBean empBean = null;

	public int insertdata(EmployeeBean empBean) {
		
		int i = 0;
        try {
			con = Dbconnection.getDbCon();
			ps = con.prepareStatement("insert into employee (fname,lname,skill,city,gen) values(?,?,?,?,?)");
			ps.setString(1, empBean.getFname());
			ps.setString(2, empBean.getLname());
			ps.setString(3, empBean.getSkill());
			ps.setString(4, empBean.getCity());
			ps.setString(5, empBean.getGen());
			i = ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		

		return i;
	}

	public ArrayList<EmployeeBean> getAll() throws SQLException, ClassNotFoundException {
		ArrayList<EmployeeBean> empList = new ArrayList<EmployeeBean>();
		
			con =Dbconnection.getDbCon();
			st = con.createStatement();
			rs = st.executeQuery("select * from employee where dflag = 1");
			while (rs.next()) {
				
				empBean = new EmployeeBean();
				empBean.setId(rs.getInt("id"));
				empBean.setFname(rs.getString("fname"));
				empBean.setLname(rs.getString("lname"));
				empBean.setSkill(rs.getString("skill"));
				empBean.setCity(rs.getString("city"));
				empBean.setGen(rs.getString("gen"));
				empList.add(empBean);
			}
		
		return empList;
	}

	public EmployeeBean getById(int id) {
		
		try {
			con = Dbconnection.getDbCon();
			st = con.createStatement();
			rs = st.executeQuery("select * from employee where id="+id);
			if(rs.next()){
				empBean = new EmployeeBean();
				empBean.setId(rs.getInt("id"));
				empBean.setFname(rs.getString("fname"));
				empBean.setLname(rs.getString("lname"));
				empBean.setSkill(rs.getString("skill"));
				empBean.setCity(rs.getString("city"));
				empBean.setGen(rs.getString("gen"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return empBean;
	}

	public int Update(EmployeeBean empBean) {
		int i =0;
		try {
			con = Dbconnection.getDbCon();
			st = con.createStatement();
			 i = st.executeUpdate("update employee set fname ='"+empBean.getFname()+"',"
					+ "lname='"+empBean.getLname()+"',"
					+ "skill='"+empBean.getSkill()+"',"
					+ "city='"+empBean.getCity()+"',gen='"+empBean.getGen()+"'where id ='"+empBean.getId()+"'");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public int delete(int id) throws ClassNotFoundException, SQLException {
		int i =0;
		
		con = Dbconnection.getDbCon();
		st =con.createStatement();
		i = st.executeUpdate("update employee set dflag = 0 where id ="+id);
		st.close();
		
		return i;
	}

}
