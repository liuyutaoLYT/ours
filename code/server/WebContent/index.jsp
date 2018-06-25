<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
  <head>
    <title>Home</title>

  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
    
<style>
   h3 {
      font-size: 25px;
      text-align: center;
      color: #333;
     margin-bottom: 22px;
     margin-top:20px;
  }
   .form-control{
    width:550px;


  }
h3.heading-style-3 {

    color: #FFBF00;
    font-weight: bold;
}
  .organic-form-2 label{
   font-size:25px;
    font-family: "Playfair Display", serif;
   margin-top:30px;

}
  .pull-right {
  
    margin-right: 225px;
}
  .pull-left {

    margin-left: 225px;
}
.login-wrapper{
   margin:0 auto;
}
.img0{
  margin-right:50px;
}
  </style>

</head>
  <body >
   <%@ include file="menu2.jsp" %>

<!-- 
      <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/logo2.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">厨色</h3>
         
      </section>
   -->
   
   <div>
        <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="images/logo4.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3><img  class="img0" src="images/lo.png"></h3>
       
      </section>
      
      <section class="boxed-sm">
        <div class="container">
         
          <div class="login-wrapper">
            <div class="row">
              <center><h3 class="heading-style-3" color:"red">我的账户</h3>
              </center>
              <div><s:actionerror /></div>
              <center><form action="user" method="get" ccept-charset="utf-8">   
	        	<input type="hidden" name="actionName" value="login"/>
	        	<input type="hidden" name="type" value="2"/>
	        	<div class="form-group organic-form-2">
	        	   <center><label>用户名</label></center>
	              <center><input type="text" required="required" name="userName" class="form-control" maxlength="20">
	              </center>
	               </input>  
	            </div> 
	            <div class="form-group organic-form-2">
	             <center><label>密码</label></center>
	              <center><input type="password" required="required" name="password" class="form-control" maxlength="20"></input>               
	              </center>
	            </div>    
	             <div class="form-group footer-form">
	              <center>
	                 <button class="btn btn-brand pill"  type="submit">登录</button>  
	              </center>
	             </div>
	           
	        </form></center>   
	        
              
            </div>
          </div>
        </div>
      </section>
   
   
   
   
   
   
   
   </div>
    
      <%@ include file="footer.jsp" %>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/function-check-viewport.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/select2.full.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/jquery.mmenu.all.min.js"></script>
    <script src="js/rellax.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/bootstrap-notify.min.js"></script>
    <script src="js/bootstrap-slider.js"></script>
    <script src="js/in-view.min.js"></script>
    <script src="js/countup.js"></script>
    <script src="js/animsition.min.js"></script>
    <script src="js/global.js"></script>
    <script src="js/config-mm-menu.js"></script>
    <script src="js/config-set-bg-blog-thumb.js"></script>
    <script src="js/config-accrodion.js">
    

    </script>
    <script type="text/javascript">
  $(function(){
	  //点击更换验证码
	   $("#captchaImage").click(function(){		   
	   		$("#captchaImage").attr("src","${pageContext.request.contextPath}/getCheckCodeImage?date="+new Date().getTime());		   
	   });
   });
  $(function(){
	  $("#username").focus(function(){
		  $("#username").val("");
	  });
  })
</script>

  </body>
</html>
