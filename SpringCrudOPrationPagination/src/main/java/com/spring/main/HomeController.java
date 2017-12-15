package com.spring.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.print.DocFlavor.STRING;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.bean.Employee;
import com.spring.bean.EmployeeBean;
import com.spring.services.EmployeeServices;
//import com.websystique.springmvc.model.Employee;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	EmployeeServices serv;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {		
		//return "registration";
		return "redirect:/list3";
	}
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String employeelist(Locale locale, Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("show", serv.show() );
		return "employeelist";
	}
	@RequestMapping(value="list2",method = RequestMethod.GET)
	public String list2(Model model,
			@RequestParam(value="iSwRws" ,required = false) Integer iTotPags,
			@RequestParam(value="iPagNo" ,required = false) Integer iPagNo,
			@RequestParam(value="cPagNo" ,required = false) Integer cPagNo) throws IOException,NumberFormatException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		logger.info("page is"+iPagNo);
		Connection con = null; 
		Integer iTotRslts =0;
		//Class.forName("com.mysql.jdbc.Driver").newInstance(); // @RequestParam(required = false) Integer iTotRslts,
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "123456");
		ResultSet rsPgin = null;
		ResultSet rsRwCn = null;
		PreparedStatement psPgintn=null;
		PreparedStatement psRwCn=null;
		// Number of records displayed on each page
		int iSwRws=5;
		// Number of pages index displayed
		int iTotSrhRcrds=2;
		/*int iTotRslts=Converter(request.getParameter("iTotRslts"));
		int iTotPags=Converter(request.getParameter("iTotPags"));
		int iPagNo=Converter(request.getParameter("iPagNo"));
		int cPagNo=Converter(request.getParameter("cPagNo"));*/
		int iStRsNo=0;
		int iEnRsNo=0;
		List<Employee> emplist = new ArrayList<Employee>();
		if(iPagNo == null) {
			iPagNo=0;
			System.out.println("iPagNo >>>>>"+iPagNo);
			} else{
				iPagNo=Math.abs((iPagNo-1)*iSwRws);
				System.out.println("iPagNo >>>>>"+iPagNo);
				}
		String sqlPgintn="SELECT SQL_CALC_FOUND_ROWS * FROM employee78 limit "+iPagNo+","+iSwRws+"";
		psPgintn=con.prepareStatement(sqlPgintn);
		System.out.println("psPgintn >>>>"+ psPgintn);
		rsPgin=psPgintn.executeQuery();
		while(rsPgin.next()){
			Employee empl =new Employee();
			empl.setId(rsPgin.getInt("id"));
			empl.setSalary(rsPgin.getInt("salary"));
			emplist.add(empl);
		}
		
		
		
		// Count total number of fetched rows
		String sqlRwCnt="SELECT FOUND_ROWS() as cnt";
		psRwCn=con.prepareStatement(sqlRwCnt);
		System.out.println("psRwCn >>>>"+ psRwCn);
		rsRwCn=psRwCn.executeQuery();
		if(rsRwCn.next()) {
			iTotRslts=rsRwCn.getInt("cnt");
			System.out.println("iTotRslts >>>>"+ iTotRslts);
			}
		
		try{
			if(iTotRslts<(iPagNo+iSwRws)) {
				iEnRsNo=iTotRslts;
				System.out.println("iEnRsNo >>>>"+ iEnRsNo);
			} else {
				iEnRsNo=(iPagNo+iSwRws);
				System.out.println("iEnRsNo >>>>"+ iEnRsNo);
			} 
			iStRsNo=(iPagNo+1);
			System.out.println("iStRsNo >>>>"+ iStRsNo);
			iTotPags=((int)(Math.ceil((double)iTotRslts/iSwRws)));
			System.out.println("iTotPags >>>>"+ iTotPags);
		} catch(Exception e) {
			e.printStackTrace();
		} 
		//((${cPge}*${iTotSrhRcrds})-(${iTotSrhRcrds})>0)
		
		int i=0;
			int cPge=0;
			Integer prePageNo= 0;
			if(iTotRslts!=0) {
				cPge=((int)(Math.ceil((double)iEnRsNo/(iTotSrhRcrds*iSwRws))));
				prePageNo=(cPge*iTotSrhRcrds)-((iTotSrhRcrds-1)+iTotSrhRcrds);
				System.out.println("prePageNo >>>>"+ prePageNo);
			}
			System.out.println(" cPge :::"+cPge);
			System.out.println(" iTotSrhRcrds :::"+iTotSrhRcrds);
			/*System.out.println(" iTotSrhRcrds :::"+iTotSrhRcrds);*/
			int prepage=((cPge*iTotSrhRcrds)-(iTotSrhRcrds));
			int perpage=((cPge*iTotSrhRcrds)-(iTotSrhRcrds -1));
			int propage=(cPge*iTotSrhRcrds);
			System.out.println(" perpage :::"+perpage);
			System.out.println(" propage :::"+propage);
			System.out.println(" i :::"+i);
			
			model.addAttribute("prepage", prepage);
			model.addAttribute("perpage", perpage);
			model.addAttribute("propage", propage);
			System.out.println(" prepage :::"+prepage);
			System.out.println("iSwRws :::"+iSwRws+"\n"+"iPagNo :::"+iPagNo+"\n"+"cPagNo :::"+cPagNo);
			model.addAttribute("i", i);
			model.addAttribute("employee", emplist);
			model.addAttribute("iSwRws", iSwRws);
			model.addAttribute("iTotSrhRcrds", iTotSrhRcrds);
			model.addAttribute("iPagNo", iPagNo);
			model.addAttribute("iTotPags", iTotPags);
			model.addAttribute("cPagNo", cPagNo);
			model.addAttribute("iTotRslts", iTotRslts);
			model.addAttribute("iEnRsNo", iEnRsNo);
			model.addAttribute("iStRsNo", iStRsNo);
			model.addAttribute("iTotPags", iTotPags);
			model.addAttribute("prePageNo", prePageNo);

		return "showemp"; 
	}
	
	@RequestMapping(value="list3",method = RequestMethod.GET)
	public String list3(Model model,
			@RequestParam(value="iSwRws" ,required = false) Integer iTotPags,
			@RequestParam(value="iPagNo" ,required = false) Integer iPagNo,
			@RequestParam(value="cPagNo" ,required = false) Integer cPagNo) 
			throws IOException,NumberFormatException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		logger.info("page is"+iPagNo);
		Connection con = null; 
		Integer iTotRslts =0;
		//Class.forName("com.mysql.jdbc.Driver").newInstance(); // @RequestParam(required = false) Integer iTotRslts,
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "123456");
		ResultSet rsPgin = null;
		ResultSet rsRwCn = null;
		PreparedStatement psPgintn=null;
		PreparedStatement psRwCn=null;
		if(iPagNo == null || iPagNo==0 || iPagNo<0) {
			iPagNo=1;
			System.out.println("iPagNo >>>>>"+iPagNo);
		}
		Integer totalRecord =null;
		Integer startIndex =0;
		Integer limit =3;
		startIndex =((iPagNo-1)*3);
		int contentStart = startIndex+1;
		int contentEnd =startIndex+3;
		List<Employee> emplist = new ArrayList<Employee>();
		String sqlPgintn="SELECT SQL_CALC_FOUND_ROWS * FROM employee78 limit "+startIndex+","+limit+"";
		psPgintn=con.prepareStatement(sqlPgintn);
		System.out.println("psPgintn >>>>"+ psPgintn);
		rsPgin=psPgintn.executeQuery();
		while(rsPgin.next()){
			Employee empl =new Employee();
			empl.setId(rsPgin.getInt("id"));
			empl.setSalary(rsPgin.getInt("salary"));
			emplist.add(empl);
		}
		String sqlRwCnt="SELECT FOUND_ROWS() as cnt";
		psRwCn=con.prepareStatement(sqlRwCnt);
		System.out.println("psRwCn >>>>"+ psRwCn);
		rsRwCn=psRwCn.executeQuery();
		if(rsRwCn.next()) {
			iTotRslts=rsRwCn.getInt("cnt");
			totalRecord=iTotRslts;
			System.out.println("iTotRslts >>>>"+ iTotRslts);
			System.out.println("totalRecord >>>>"+ totalRecord);
		}
		double totalPages =1d;
		totalPages=((Math.ceil(Double.parseDouble(totalRecord.toString())/Double.parseDouble(limit.toString()))));
		
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("emplist", emplist);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("iPagNo", iPagNo);
		
		
		return "showemp"; 
	}
	
	@RequestMapping(value = "registration", method = RequestMethod.POST)
	public String insert(@RequestParam("firstname") String firstname,
			@RequestParam("lastname")String lastname,
			@RequestParam("skill")String[] skillarray, 
			@RequestParam("city") String city,
			@RequestParam("gender") String gender , Model model) throws ClassNotFoundException, SQLException {
		logger.info("firstname"+firstname);
		logger.info("lastname"+lastname);
		for (int i = 0; i < skillarray.length; i++) {
			logger.info(skillarray[i]);
		}
		logger.info("skill"+skillarray);
		logger.info("city"+city);
		logger.info("gender"+gender);
		
		String skill="";
		for (int i = 0; i < skillarray.length; i++) {
			skill = skill+skillarray[i]+",";
		}
		
		EmployeeBean empBean = new EmployeeBean();
		empBean.setFname(firstname);
		empBean.setLname(lastname);
		empBean.setSkill(skill);
		empBean.setCity(city);
		empBean.setGen(gender);
		
		String rtn = "";
		
		int i = serv.insert(empBean);
		if(i == 1){
			logger.info("Insert data sucesfully");
			//model.addAttribute("show", serv.show() );
			rtn = "redirect:/all";
		}else{
			System.out.println("Data can not insert success fully please reinsert");
			logger.info("Data can not insert success fully please reinsert");
		}
		
		return "employeelist";
	}
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(@RequestParam("id") int id, Model model) {
		logger.info("id is:"+id);
		
		model.addAttribute("employee", serv.getById(id) );
		model.addAttribute("city", "ahemdabad,surat,baroda" );
		model.addAttribute("skill", "php,java,.net");
		return "update";
	}
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") int id, Model model) throws ClassNotFoundException, SQLException {
		logger.info("id is:"+id);
		String rtn = "";
		
		int i = serv.delete(id);
		if(i == 1){
			logger.info("delete sucessfully....!!!!");
			model.addAttribute("show", serv.show());
			rtn = "redirect:/all";
		}
		else{
			logger.info("delete not sucessful please delete again....!!!!");
			rtn = "/";
		}
		return rtn;
	}
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@RequestParam("id") int id,@RequestParam("firstname") String firstname,
			@RequestParam("lastname")String lastname,
			@RequestParam("skill")String[] skillarray, 
			@RequestParam("city") String city,
			@RequestParam("gender") String gender, Model model) throws ClassNotFoundException, SQLException {
		
		EmployeeBean empBean =null;
		logger.info("id is:"+id);
		logger.info("firstname"+firstname);
		logger.info("lastname"+lastname);
		for (int i = 0; i < skillarray.length; i++) {
			System.out.println(skillarray[i]);
		}
		logger.info("skill"+skillarray);
		logger.info("city"+city);
		logger.info("gender"+gender);
		String skill="";
		for (int i = 0; i < skillarray.length; i++) {
			skill = skill+skillarray[i]+",";
		}
		 empBean = new EmployeeBean();
		 empBean.setId(id);
		empBean.setFname(firstname);
		empBean.setLname(lastname);
		empBean.setSkill(skill);
		empBean.setCity(city);
		empBean.setGen(gender);
		
		
		

		
		int i = serv.update(empBean);
		if(i == 1){
			logger.info("Update sucessfully....!!!!");
			model.addAttribute("show", serv.show());
		}
		else{
			logger.info("Update not sucessful please update again....!!!!");
		}
		
		//model.addAttribute("employee", empBean);
		
		
		
		return "employeelist";
	}
	
}
