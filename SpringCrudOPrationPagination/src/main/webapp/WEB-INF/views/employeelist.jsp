<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
  <thead>
	  <th>Id</th>
	  <th>FirstName</th>
	  <th>Lastname</th>
	  <th>Skill</th>
	  <h>City</th>
	  <th>Gender</th>
	  <th>Action</th>
  </thead>
  <tbody>
  	<c:forEach items="${show}" var="item">
	  <tr>
		  <td>${item.id }</td>
		  <td>${item.fname }</td>
		  <td>${item.lname }</td>
		  <td>${item.skill }</td>
		  <td>${item.city }</td>
		  <td>${item.gen }</td>
		  <td>
			  <form action="edit" method="get">
			  <input type="hidden" name="id" value="${item.id }">
			  <input type="submit" name="submit" value="edit">
			  </form>
		  </td>
		  <td>
			  <form action="delete" method="get">
			  <input type="hidden" name="id" value="${item.id }">
			  <input type="submit" name="submit" value="delete">
			  </form>
		  </td>
	  </tr>
	</c:forEach>
  </tbody>
</table>

</body>
</html>