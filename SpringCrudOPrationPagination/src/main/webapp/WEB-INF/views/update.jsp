<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="robots" content="noindex,nofollow" />
<title>Registration</title>
<link rel="stylesheet" href="/resources/themes/master.css" type="text/css" />
<link
 href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
 rel="stylesheet" type="text/css" />
<style>
 
 .myErrors {
  color:red;
 }
 
</style> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<script src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js" type="text/javascript"></script>
<script src="/resources/scripts/mysamplecode.js" type="text/javascript"></script>
<script src="/resources/scripts/date.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function() {

 // attach datepicker to the input field
 // an interactive calendar appears as soon as you focus on the field
 // for more information read http://jqueryui.com/demos/datepicker/
 $("#myDate").datepicker();
 
 // modify default settings for validation
 jQuery.validator.setDefaults({
  // where to display the error relative to the element
  errorPlacement: function(error, element) {
      error.appendTo(element.parent().find('div.myErrors'));
     }
 });
 
 // custom validation method to make sure the date is in mm/dd/yyyy format 
 jQuery.validator.addMethod(
     "usaDate",
     function(value, element) {
      console.log(value);
      var date = getDateFromFormat(value,'MM/dd/yyyy');
      console.log(date);
      if (date == 0) { 
       return false; 
      }
      return true;
     },
     "Please enter a date in the format mm/dd/yyyy"
 );
 
 
 $("#samplecode").validate({
   rules: {
    
    // mandatory entry
    myInputBox: "required",
    
    // mandatory entry and valid email address
    myEmail: {
        required: true,
        email: true
      },
      
    // mandatory entry and valid URL  
       myURL: {
        required: true,
        url: true
      }, 
      
    // madatory date entry and valid date format  
    myDate : {
     required: true,
              usaDate : true
            },
            
          // mandatory radio button selection  
     myRadioButton: "required",
     
     // mandatory checkbox selection  
    myCheckbox: "required",
    
    // mandatory drop down selection  
    mySelect: "required",
    
    //conditional validation of the textarea based on the radion button selection
    convicted: "required",
    explain: {
     required: function(element) {
      return $("input:radio[name=convicted]:checked").val() == 'Y';
       }
    }
  },
  
  //custom error messages
        messages: {
         myRadioButton:{
          required: "Please choose a Color."
          },
         myCheckbox:{
             required: "Please select the Fruits that you love."
             }, 
        },
        
        // on page submit 
        submitHandler: function(){
          alert('Form validation was a success, please proceed!');
        }

 });
 
 
});
</script>
</head>
<body>

<b>${editBean.fname }</b>${skill }
<hr>

		<div id="allContent">
		 <%-- <%@include file="/header.jsp"%> --%>
		  <div id="myContent">
		   <form id="samplecode" name="samplecode" method="POST" action="update">
		     <fieldset>
		      <legend><b>&nbsp;&nbsp;&nbsp;Registration Form Of Employee&nbsp;&nbsp;&nbsp;</b></legend>
		      <table>
		      <tr>
		       <td valign="top">
		       <label for="firstname"> First Name  </label>
		       </td>
		       <td>
		       <input id="firstname" type="text" name="firstname" size="50" value="${edit.fname }"/>
		       <div class="myErrors"></div>
		       </td>
		      </tr>
		      <tr>
		       <td valign="top">
		       <label for="lastname"> Last Name  </label>
		       </td>
		       <td>
		       <input id="lastname" type="text" name="lastname" size="50" value="${employee.lname }"/>
		       <div class="myErrors"></div>
		       </td>
		      </tr>
		      <tr>
		       <td valign="top">
		       <label for="skill" > Skills  </label>
		       </td>
		       <td>
		      <c:forEach items="${skill}" var="skill">
		        <c:set value="0" var="counter"></c:set>
		      	<c:forEach items="${employee.skill}" var="emp">
		           
		           <c:if test="${emp == skill}">
		           	<input type="checkbox" name="Skill" value="${skill}"  checked="checked" >${skill}&nbsp;
		           	<c:set value="1" var="counter"></c:set>
		           </c:if>
		           
		           
		           <%--
		           
		           <c:out value="${salary}"/>
		           <c:if test="${emp == skill}">
		           	<input type="checkbox" name="Skill" value="${skill}"  checked="checked" >${skill}&nbsp;
		           </c:if> 
		           <c:if test="${emp != skill}">
		           	<input type="checkbox" name="Skill" value="${skill}"  >${skill}&nbsp;
		           </c:if>
					--%>
		           
		           <%-- <c:choose>
		           <c:when test="${emp == skill}">
				       <input type="checkbox" name="Skill" value="${skill}"  checked="checked" >${skill}&nbsp;
				    </c:when>
				    <c:when test="${emp != skill}">
				      <input type="checkbox" name="Skill" value="${skill}"  >${skill}&nbsp;
				    </c:when>
		           </c:choose> --%>
		        </c:forEach>
		        <c:if test="${counter == 0}">
		           	<input type="checkbox" name="Skill" value="${skill}"  >${skill}&nbsp;
		        </c:if>
		    </c:forEach>
		     <%--   <c:choose>
		    <c:when test="${employee.skill == php}">
		       <input type="checkbox" name="skill" checked value="php"  /> Php
		       <input type="checkbox" name="skill" value="java"  /> Java
		       <input type="checkbox" name="skill" value=".net" /> .Net 
		    </c:when>
		    <c:when test="${employee.skill == java}">
		       <input type="checkbox" name="skill" value="php"  /> Php
		       <input type="checkbox" name="skill"  checked value="java"  /> Java
		       <input type="checkbox" name="skill" value=".net" /> .Net 
		    </c:when>
		    <c:otherwise>
		      <input type="checkbox" name="skill" value="php"  /> Php
		       <input type="checkbox" name="skill"   value="java"  /> Java
		       <input type="checkbox" name="skill"  checked value=".net" /> .Net 
		    </c:otherwise>
		</c:choose> --%>
		         <%--  <c:forEach items="${fn:split(employee.skill, ',')}" var="obj">
		                    <input type="checkbox" value="${obj}" ${obj == employee.skill ? 'checked' : ''}/>${employee.skill}
		                    </c:forEach>
		                </c:forEach> --%>
		     <%--  <input type="checkbox" name="skill" value="php" ${employee.skill == 'php'?'checked':'' } /> Php
		       <input type="checkbox" name="skill" value="java" ${employee.skill == 'java'?'checked':'' } /> Java
		       <input type="checkbox" name="skill" value=".net" ${employee.skill == '.net'?'checked':'' } /> .Net  --%>  
		       <div class="myErrors"></div>
		       </td>
		      </tr>
		      <tr>
		       <td valign="top">
		       <label for="city"> City  </label>
		       </td>
		       <td>
		        <select id="city" name="city" title="Please select your city" value="${employee.city}" >
		               <c:forEach items="${fn:split(city, ',')}" var="obj">
		                    <option value="${obj}" ${obj == employee.city ? 'selected' : ''}>${employee.city}</option>
		                </c:forEach>
		            <%-- </select> 
		             --%> 
		            
		       <option value="">Choose one</option>
		       <option value="ahemdabad" ${employee.city == 'ahemdabad'?'selected':'' }>Ahemdabad</option>
		       <option value="baroda" ${employee.city == 'baroda'?'selected':'' }>Baroda</option>
		       <option value="surat" ${employee.city == 'surat'?'selected':'' }>Surat</option>
		       <option value="other" ${employee.city == 'other'?'selected':'' }>Others</option>
		       
		      <%--  </c:forEach> --%>
		       </select> 
		       <div class="myErrors"></div>
		       </td>
		      </tr>
		      <tr>
		       <td valign="top">
		       <label for="gender"> Gender  </label>
		       </td>
		       <td>
		       <input type="radio" name="gender" value="male" ${employee.gen == 'male'?'checked':'' }/> Male
		       <input type="radio" name="gender" value="female"${employee.gen == 'female'?'checked':'' } /> Female
		       <div class="myErrors"></div>
		       </td>
		      </tr>
		      <tr>
		       <td colspan="2">
		        &nbsp;
		       </td>
		      </tr>
		      <tr>
		       <td>
		        &nbsp;
		       </td>
		       <td>
		        <input id="processForm" type="submit" value="Process Form" />
		       </td>
		      </tr>
		      </table>
		     </fieldset>
		   </form>
		  </div>
		 </div>

</body>
</html>