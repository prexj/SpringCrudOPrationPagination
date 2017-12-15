<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script
 src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
 type="text/javascript"></script>
<script
 src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
 type="text/javascript"></script>
<script
 src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js"
 type="text/javascript"></script>
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
    firstname: "required",
    // mandatory entry
    lastname: "required",
    
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
     gender: "required",
     
     // mandatory checkbox selection  
    skill: "required",
    
    // mandatory drop down selection  
    city: "required",
    
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
         gender:{
          required: "Please select Gender."
          },
         skill:{
             required: "Please select the skill as per you require"
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
<div id="allContent">
 <%-- <%@include file="/header.jsp"%> --%>
  <div id="myContent">
   <form id="" name="" method="POST" action="registration">
     <fieldset>
      <legend><b>&nbsp;&nbsp;&nbsp;Registration Form Of Employee&nbsp;&nbsp;&nbsp;</b></legend>
      <table>
      <tr>
       <td valign="top">
       <label for="firstname"> First Name  </label>
       </td>
       <td>
       <input id="firstname" type="text" name="firstname" size="50" value=""/>
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="lastname"> Last Name  </label>
       </td>
       <td>
       <input id="lastname" type="text" name="lastname" size="50" value=""/>
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="skill"> Skills  </label>
       </td>
       <td>
       <input type="checkbox" name="skill" value="php" /> Php
       <input type="checkbox" name="skill" value="java" /> Java
       <input type="checkbox" name="skill" value=".net" /> .Net 
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="city"> City  </label>
       </td>
       <td>
       <select id="city" name="city" title="Please select your city">
       <option value="">Choose one</option>
       <option value="ahemdabad">Ahemdabad</option>
       <option value="baroda">Baroda</option>
       <option value="surat">Surat</option>
       <option value="other">Others</option>
       </select>
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="gender"> Gender  </label>
       </td>
       <td>
       <input type="radio" name="gender" value="male" /> Male
       <input type="radio" name="gender" value="female" /> Female
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
        <input id="" type="submit" name="" value="submit" />
       </td>
      </tr>
      </table>
     </fieldset>
   </form>
  </div>
 </div>

</body>
</html>