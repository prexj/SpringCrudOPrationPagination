<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.PreparedStatement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%-- <%! public int Converter(String str) { 
			int convrtr=0; 
				if(str==null) { 
					str="0"; 
				} else if((str.trim()).equals("null")) {
					str="0"; 
				} else if(str.equals("")) {
					str="0"; 
				}
				try{
					convrtr=Integer.parseInt(str); 
				} catch(Exception e) { 
					e.printStackTrace();
				}	 
				
				return convrtr; 
} %>  --%>
 <%-- <% 	
	 Connection con = null; 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "root");
	ResultSet rsPgin = null;
	ResultSet rsRwCn = null;
	PreparedStatement psPgintn=null;
	PreparedStatement psRwCn=null;
	// Number of records displayed on each page
	int iSwRws=5;
	// Number of pages index displayed
	int iTotSrhRcrds=10;
	int iTotRslts=Converter(request.getParameter("iTotRslts"));
	int iTotPags=Converter(request.getParameter("iTotPags"));
	int iPagNo=Converter(request.getParameter("iPagNo"));
	int cPagNo=Converter(request.getParameter("cPagNo"));
	System.out.println("iTotRslts :::"+iTotRslts+"\n"+"iTotPags :::"+iTotPags+"\n"+"iPagNo :::"+iPagNo+"\n"+"cPagNo :::"+cPagNo);
	int iStRsNo=0;
	int iEnRsNo=0;
	if(iPagNo==0) {
		iPagNo=0;
		} else{
			iPagNo=Math.abs((iPagNo-1)*iSwRws);
			}
	String sqlPgintn="SELECT SQL_CALC_FOUND_ROWS * FROM employee78 limit "+iPagNo+","+iSwRws+"";
	psPgintn=con.prepareStatement(sqlPgintn);
	rsPgin=psPgintn.executeQuery();
	// Count total number of fetched rows
	String sqlRwCnt="SELECT FOUND_ROWS() as cnt";
	psRwCn=con.prepareStatement(sqlRwCnt);
	rsRwCn=psRwCn.executeQuery();
	if(rsRwCn.next()) {
		iTotRslts=rsRwCn.getInt("cnt");
		}  
%> --%>
<html>
<head>
  <title>Pagination using JSP page</title>
  <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet"> 
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</head>
<body>
   <form name="frm">
    <%-- <input type="text" name="iPagNo" value="${iPagNo}">
    <input type="text" name="cPagNo" value="${cPagNo}">
    <input type="text" name="iSwRws" value="${iSwRws}"> --%>
    <%-- <%System.out.println("iSwRws :::"+iSwRws+"\n"+"iPagNo :::"+iPagNo+"\n"+"cPagNo :::"+cPagNo); %> --%>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" >
		<tr> 
			<td>Emp id</td> 
			<td>Emp salary</td> 
			<!-- <td>Emp Address</td> -->
		</tr>
		<c:forEach items="${emplist}" var="emp" >
            <tr>
                <td>${emp.id}</td> 
                <td>${emp.salary}</td>
                <%-- <td>${emp.name}</td>
                <td>${emp.age}</td> --%>
                <%-- <td>${employee.deptName}</td> --%>
            </tr>
        </c:forEach>
       	<tr>
				 <td colspan="3" > 
				 		<table border="1" cellpadding="5" cellspacing="5">
					        <tr id="customPagination">
					            <%-- <c:forEach begin="${ iPagNo }" end="${totalPages}" var="i"> --%>
					            		<%-- <c:if test="${(i == ((iPagNo/iSwRws)+1))}"> --%>
					                      <%-- <td>  <a href="list3?iPagNo=${iPagNo}" style="cursor:pointer;color:red" onclick="saveCurrentpage("+i+");"><b>i</b></a></td> --%>
					                    <%-- </c:if> --%>
					                    <%-- <c:if test="${(i<=iTotPags)}">
					                       <td> <a href="index.jsp?iPagNo=${i}">${i}</a> </td>
					                    </c:if> --%>
					              
					           <%--  </c:forEach> --%>
					        </tr>
					    </table>
				 </td> 
			</tr>
			<%-- <tr>
				 <td colspan="3"> 
				 	<div> 
				 	${prepage},${ i == perpage},${i <= propage}
				 	 <c:if test="${prepage>0}">
         					<td><a href="list2?iPagNo=${prePageNo}&cPagNo=${prePageNo}"><< Previous</a> </td> 
    				</c:if>
    				
					    <table border="1" cellpadding="5" cellspacing="5">
					        <tr>
					            <c:forEach begin="${ i }" end="${propage}" var="i">
					            		<c:if test="${(i == ((iPagNo/iSwRws)+1))}">
					                      <td>  <a href="list2?iPagNo=${i}&cPagNo=${cPagNo}" style="cursor:pointer;color:red"><b>${i}</b></a></td>
					                    </c:if>
					                    <c:if test="${(i<=iTotPags)}">
					                       <td> <a href="index.jsp?iPagNo=${i}&cPagNo=${cPagNo}">${i}</a> </td>
					                    </c:if>
					              
					            </c:forEach>
					        </tr>
					    </table>
					    
					     <c:if test="${((iTotPags> iTotSrhRcrds) && (i< iTotPags) )}">
         					<td><a href="list2?iPagNo=${i}&cPagNo=${i}">>> Next</a> <b>Rows ${iStRsNo} - ${iEnRsNo} Total Result ${iTotRslts}</b></td> 
    					</c:if>
				 		 
				 		</div> 
				 	</td> 
			</tr> --%> 
		</table>
	</form>
	<script type="text/javascript">
	$(document).ready(function(){
		var totalPages= "${totalPages}";
		datalink ="";
		for (var i = 1; i <= totalPages.length; i++) {
			datalink +='<td><a href="list3?iPagNo='+i+'" style="cursor:pointer;color:red" onclick="saveCurrentpage('+i+');"><b>'+i+'</b></a></td>';
		}
		$('#customPagination').html(datalink);
		/* console.log()
		if(totalPages != null ){
			
		} */
	});
	function saveCurrentpage(i){
		localStorage.setItem('currentpage',i);
	}
	</script>
</body>
</html>
