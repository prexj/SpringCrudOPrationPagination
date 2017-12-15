<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="robots" content="noindex,nofollow" />
<title>jQuery HTML page Validation Plugin</title>
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
 <div id="allContent">
 <%-- <%@include file="/header.jsp"%> --%>
  <div id="myContent">
   <form id="samplecode" name="samplecode" method="POST" action="">
     <fieldset>
      <legend><b>&nbsp;&nbsp;&nbsp;jQuery Validation DEMO&nbsp;&nbsp;&nbsp;</b></legend>
      <table>
      <tr>
       <td valign="top">
       <label for="myInputBox"> Input Text Box  </label>
       </td>
       <td>
       <input id="myInputBox" type="text" name="myInputBox" size="50" value=""/>
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="myEmail"> Email Address  </label>
       </td>
       <td>
       <input id="myEmail" type="text" name="myEmail" size="50" value=""/>
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="myURL"> Website URL  </label>
       </td>
       <td>
       <input id="myURL" type="text" name="myURL" size="50" value=""/>
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="myDate"> Date of Birth  </label>
       </td>
       <td>
       <input id="myDate" type="text" name="myDate" size="10" value=""/>&nbsp;(mm/dd/yyyy)
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="myRadioButton"> Radio Buttons  </label>
       </td>
       <td>
       <input type="radio" name="myRadioButton" value="R" /> Red
       <input type="radio" name="myRadioButton" value="G" /> Green
       <input type="radio" name="myRadioButton" value="B" /> Blue 
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="myCheckbox"> Some fruits to Choose from  </label>
       </td>
       <td>
       <input type="checkbox" name="myCheckbox" value="apple" /> Apple
       <input type="checkbox" name="myCheckbox" value="orange" /> Orange
       <input type="checkbox" name="myCheckbox" value="banana" /> Banana 
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="mySelect"> Drop down for car models  </label>
       </td>
       <td>
       <select id="mySelect" name="mySelect" title="Please select your Car">
       <option value="">Choose one</option>
       <option value="toyota">Toyota</option>
       <option value="honda">Honda</option>
       <option value="ford">Ford</option>
       <option value="other">Others</option>
       </select>
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="convicted"> Have you ever been convicted of a crime?   </label>
       </td>
       <td>
       <input type="radio" name="convicted" value="Y" /> Yes
       <input type="radio" name="convicted" value="N" /> No
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
        <label for="explain"> If yes, please explain </label> 
       </td>
       <td>
        <textarea id="explain" name="explain" rows="5" cols="60" maxlength="300"></textarea>
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

 <%-- <%@include file="/footer.jsp"%> --%>
 <div></div>
</body>
</html>