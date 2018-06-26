<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Vector"%>
<%@page import="com.example.bean.user"%>
<%@page import="com.example.bean.user_score"%>
<%@page import="com.example.dao.DeleteDao"%>
<%@page import="com.example.util.Util"%>
<%@page import="com.example.dao.SelectDao"%>
<%@page import="com.example.bean.resource"%>
<%@page import="java.util.ArrayList"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

	<link rel="stylesheet" type="text/css" href="css/all.css?v1=9">
	

<link href="${ pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />

<link href="${ pageContext.request.contextPath}/css/flexslider1.css" rel="stylesheet" />

<link href="${ pageContext.request.contextPath}/css/style2.css" rel="stylesheet" />
<style type="text/css">
.footer-area{padding:10px 0}.footer-area .w{padding-top:10px;border-top:1px solid #e8e8e8}.footer-area a{color:#666}.footer-area a:hover{color:#ff6767}.ft1{clear:none;float:left;font-size:11px;color:#666;width:680px;padding-top:10px}.ft1 .c3b{color:#c90;font-size:14px;font-weight:700;margin-bottom:6px}.ft1 .c3b a{color:#f50}.ft1 .c3c{color:#aaa;font-size:12px;margin-bottom:6px}.ft2,.ft3,.ft4{clear:none;float:right;text-align:center}.ft3{margin:0 25px}
</style>



<style>
.wx{
  width:80px;

}
.sj{
width:80px;
}
.img1{
width:80px;
}
.img2{
width:80px;
}
.img3{
width:80px;
}
.img4{
width:25px;
}
.img5{
width:230px;
margin-left:90px;
}

.footer-area {
    padding: 10px 0;
}
.clear1{
    zoom: 1;
}
.clear1:after {
    clear: both;
    content: ' ';
    display: block;
    height: 0;
    overflow: hidden;
    visibility: hidden;
}
.ac{
font-size:13px;
}
.pp {
    margin: 0 0 10px;

    font-size: 13px;
    /* margin-right: 20px; */
    /* margin-bottom: 50px; */
}
p {
    margin: 0 0 10px;
    font-size: 16px;
}
.footer-area .w {
    padding-top: 10px;
    border-top: 1px solid #e8e8e8;
    width: 1200px;
}
.af{
 font-size:13px;
}
.footer-area {
    padding: 10px 0;
   
}
.ft4 {
    clear: none;
    float: right;
    text-align: center;
    margin-right: 120px;
}
</style>

  <style>
  
  
header .navbar {
  	margin-top:15px;
    }
  
  .navbar .nav > li > a {
    color: #5A5A5A;
    text-shadow: none;
    border: 1px solid rgba(255, 255, 255, 0) !important;
    font-size: 18px ;
}
a{
color:#654e2d;
}
  .navbar-default .navbar-brand {

top:-38px;
    width: 184px;
}


.scrollup {
    position: fixed;
    width: 82px;
    height: 82px;
    bottom: 0px;
    right: 20px;
    z-index: 102410;
    /* background: #CF6A14; */
    background: url(//static.meishichina.com/v6/img/wap_a/gotop.png) no-repeat scroll center center/58px 58px;
}
.imgl{
margin-left:40px;
}

  </style>  
  <div class="fixed-footer">
  <a href="#" class="scrollup"></a>
  </div>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.fancybox.pack.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.fancybox-media.js"></script> 
<script src="${pageContext.request.contextPath}/js/portfolio/jquery.quicksand.js"></script>
<script src="${pageContext.request.contextPath}/js/portfolio/setting.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
<script src="${pageContext.request.contextPath}/js/animate.js"></script>
<script src="${pageContext.request.contextPath}/js/custom.js"></script>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>


<style type="text/css">
	body{ 
		text-align:center
	}
	#bar{
		margin:0 auto;   
     	width:1000px;   
     	height:30px;  
     	background:#dddddd;
     	color:white;
     	padding-left:50px;
     	position: relative;
     	margin-bottom:20px;
	}
	#bar ul{
		padding:5px;
		display: block;
		margin: 0 auto;
		position: relative;
	}
	#bar li{
		float:left; 
		list-style:none;
		margin-right:40px
	}
	
	#frameright ul{
		padding:5px;
		display: block;
		margin: 0 auto;
		list-style:none;
		position: relative;
	}
	
	#frameright i{
		height:25px;
		font-size:23px;
		margin-bottom:5px;
	}
	
	#form {
	font-size:20px;
}

.currentPage{
	font-weight:bold;
	color:#ff9a00;
}

.ortPage{
	font-weight:bold;
	color:#0000ff;
}

#jumpTo{
	width:20px;
}

table{ 
table-layout:fixed; 
empty-cells:show; 
border-collapse: collapse; 
margin:0 auto; 
} 

td{ 
height:30px; 
} 

.table{ 
border:1px solid #cad9ea; 
color:#666; 
} 

.table td,.table th{ 
border:1px solid #cad9ea; 
padding:0 1em 0; 
} 
.table tr.alter{ 
background-color:#f5fafe; 
} 
	
	.block{
		width:200px;
		height:290px;
		margin:0;
	}
	.movie_image{
		width:200px;
		height:240px;
		margin:0;
	}
	.movie_title{
		font-size:18px;
		margin:0;
		margin-right:10px;
		color:#888277;
	}
	.movie_score{
		font-size:18px;
		color:#FFF68F;
		margin:0;
	}
	
	p {
    margin: 0 0 10px;
    font-size: 20px;
}
input, button, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
    color: black;
}
#frame{ margin:0 auto;width:1024px;height:100%} 
#frameleft{ float:left; width:800px; height:100%;} 
#frameright{ margin-left:20px;float:left; width:200px;height:100%;background:#FAFAD2;} 

a:link {  color: #000000; text-decoration: none}
a:visited {  color: #000000; text-decoration: none}
a:hover {  color: #000000; text-decoration: none}

</style>

</head>

<body>   
    
    
    
    
<div class="wrap-body">
	
  <div id="wrapper" class="home-page">
	<!-- start header -->
	<header>
        <div class="navbar navbar-default navbar-static-top" margin-top="20px" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-Bistro=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="" href="${ pageContext.request.contextPath}/index"><img class="imgl" src="${pageContext.request.contextPath}/images/lo.png" alt="logo"/></a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                     <li class="active"><a  href="#">主页</a></li> 
						<li><a href="#">菜谱</a></li>
						<li><a href="#">周边</a></li>
                        <li><a href="#">甄选</a></li>
                        <li><a href="#">健康</a></li>
                        <li><a href="#">专题</a></li>
                        <li><a href="#">社区</a></li>
                        <li><a href="#">话题</a></li>
                       
                </ul>
                </div>
            </div>
        </div>
	</header>
	<!-- end header -->

	
		<section id="banner">

	</section>
	
	
</div>
	 

	<%
		String userId = null;
		String userName = "";
		HttpSession session2 = request.getSession();
		if(session2!=null){
			userId = request.getSession().getAttribute("userId").toString();
		}
		if(userId != null){
			user u = SelectDao.findUser(Integer.valueOf(userId));
			userName = u.getUser_name();
		}
	%>
	<p >当前用户：<%=userName %></p>
	
	
	
    <div id="bar"> 
		<ul>
			<li><a href="main.jsp?type=推荐">推荐美食</a></li>
			<li><a href="main.jsp">所有类型</a></li>
			<li><a href="main.jsp?c=类型&type=爱情">蛋糕甜点</a></li>
			<li><a href="main.jsp?c=类型&type=喜剧">火锅</a></li>
			<li><a href="main.jsp?c=类型&type=剧情">自助餐</a></li>
			<li><a href="main.jsp?c=类型&type=动画">日韩料理</a></li>
			<li><a href="main.jsp?c=类型&type=科幻">烧烤烤肉</a></li>
			
			<li><a href="main.jsp?c=类型&type=动作">江浙菜</a></li>
			<li><a href="main.jsp?c=类型&type=经典">粤菜</a></li>
			<li><a href="main.jsp?c=类型&type=悬疑">西北菜</a></li>
			<li><a href="main.jsp?c=类型&type=青春">京菜</a></li>
			<li><a href="main.jsp?c=类型&type=犯罪">鲁菜</a></li>
			<li><a href="main.jsp?c=类型&type=惊悚">东南亚菜</a></li>
			<li><a href="main.jsp?c=类型&type=文艺">素食</a></li>
			
		</ul>
		 </div>
		 
		<div id="bar"> 
		<ul>
			<li></li>
			<li><a href="main.jsp">所有年份</a></li>
			<li><a href="main.jsp?c=年份&type=2017">2017</a></li>
			<li><a href="main.jsp?c=年份&type=2016">2016</a></li>
			<li><a href="main.jsp?c=年份&type=2015">2015</a></li>
			<li><a href="main.jsp?c=年份&type=2014">2014</a></li>
			<li><a href="main.jsp?c=年份&type=2013">2013</a></li>
			<li><a href="main.jsp?c=年份&type=2012">2012</a></li>
			<li><a href="main.jsp?c=年份&type=2011">2011</a></li>
			<li><a href="main.jsp?c=年份&type=2010">2010</a></li>
			<li><a href="main.jsp?c=年份&type=2009">2009</a></li>
			<li><a href="main.jsp?c=年份&type=2008">2008</a></li>
			<li><a href="main.jsp?c=年份&type=2007">2007</a></li>
			<li><a href="main.jsp?c=年份&type=2006">2006</a></li>
			<li><a href="main.jsp?c=年份&type=2005">2005</a></li>
			<li><a href="main.jsp?c=年份&type=2004">2004</a></li>
			<li><a href="main.jsp?c=年份&type=2003">2003</a></li>
			<li><a href="main.jsp?c=年份&type=2002">2002</a></li>
			<li><a href="main.jsp?c=年份&type=2001">2001</a></li>
		</ul>
		 </div>
		 
		<div id="bar"> 
		<ul>
			<li></li>
			<li><a href="main.jsp">所有地区</a></li>
			<li><a href="main.jsp?c=地区&type=美国">龙华区</a></li><!-- 大陆 -->
			<li><a href="main.jsp?c=地区&type=日本">宝安区</a></li><!-- 港台 -->
			<li><a href="main.jsp?c=地区&type=香港">罗湖区</a></li><!-- 日韩 -->
			<li><a href="main.jsp?c=地区&type=英国">南山区</a></li><!-- 欧美 -->
			<li><a href="main.jsp?c=地区&type=中国">平山区</a></li>
			<li><a href="main.jsp?c=地区&type=韩国">福田区</a></li>
			<li><a href="main.jsp?c=地区&type=法国">龙岗区</a></li>
			
		</ul>
    </div>
    
    
    <div id="bar"> 
		<form action="main.jsp" accept-charset="utf-8" method="get" >
		<ul>
		<li><a href="">按名称搜索:</a></li>
		<li><input type=text placeholder="关键字" name="key" ize=30 /></li>
		<li><input type="submit" value="搜索" style="width: 80px;"></li>
		</ul>
		</form>
    </div>
	
	
<%  //
	String type = request.getParameter("type"); 
	String ctype = request.getParameter("c");
	
	ArrayList<resource> resources = SelectDao.getAllResources();
	
	if(type != null){
		if(type.equals("推荐")){//获取推荐列表
			if(userId == null){
				out.println("请登录后查看推荐列表");	
			}else{
				String path = request.getSession().getServletContext().getRealPath("") + "relation.txt"; 
				resources = SelectDao.getPreferResources(Integer.valueOf(userId),path);
			}
		}else{//根据类别,地区，年份，显示
			List<resource> temp = new ArrayList<resource>();
			for(resource r : resources){
				if(ctype.equals("类型")){
					if(r.getType().contains(type)){
						temp.add(r);
					}
				}
				if(ctype.equals("地区")){
					if(r.getArea().contains(type)){
						temp.add(r);
					}
				}
				if(ctype.equals("年份")){
					if(r.getYear().contains(type)){
						temp.add(r);
					}
				}

			}
			resources.clear();
			resources.addAll(temp);
		}
	}
	
	String key = request.getParameter("key");
	if(key != null){
		List<resource> temp = new ArrayList<resource>();
		for(resource r : resources){
			if(r.getName().contains(key)){
				temp.add(r);
			}
		}
		resources.clear();
		resources.addAll(temp);
	}
	
	String user = request.getParameter("user");
	if(user != null){
		List<resource> temp = new ArrayList<resource>();
		temp = SelectDao.getSelectedResources(Integer.valueOf(user));
		resources.clear();
		resources.addAll(temp);
	}
	
	class SortByScore implements Comparator<resource> {
		@Override
		public int compare(resource o1, resource o2){
			return Double.compare(o1.getScore(), o2.getScore());
		}
	}

	//按评分排序
	Collections.sort(resources, new SortByScore());
	Collections.reverse(resources);

	
	List<List<resource>> tableData = new ArrayList<>();
	int col = 3;//每行显示4个。
	int row = resources.size() / col + (resources.size()%col==0?0:1);
	for(int r=0;r<row;r++){
		List<resource> rowData = new ArrayList<>();
		for(int c=0;c< col;c++){
			int k = r*col+c;//Math.min(resources.size()%col,col)
			if(k<resources.size()){
				rowData.add(resources.get(k));
			}
		}
		tableData.add(rowData);
	}
%>


<div id="frame" style="float:inherit"> 
<div id="frameleft">



<table width='800px'  class="table" cellpadding='2px' cellspacing='2'>
	<!-- 
	<tr>
		<td>
			<div class="block">	<a href="resource_single.jsp?id=1"> <img class="movie_image" src="image/default.jpg" /> </a> <br/>
			<span class="movie_title">标题</span> <span class="movie_score">0.0</span></div>
		</td>
	</tr> 
	 -->
	<%
		for(List<resource> rowData:tableData){
			String html = "";
			html += "<tr>";
			for(resource r:rowData){
				html += "<td>";
				
				if(r.getUrl().startsWith("http")){
					html += "<div class='block'> <a href='resource_single.jsp?id=" + r.getId() + "'> <img class='movie_image' src='" + r.getUrl() + "'/>  </a> <br/>\n";
				}else{
					html += "<div class='block'> <a href='resource_single.jsp?id=" + r.getId() + "'> <img class='movie_image' src='image/" + r.getUrl() + "'/>  </a> <br/>\n";
				}
				html += "<span class='movie_title'>" + r.getName() + "</span> <span class='movie_score'>" + r.getScore() + "</span></div>\n";
				
				html += "</td>\n";
			}
			html += "</tr>";
			out.print(html);
		}
	%>
</table>


</div> 
<div id="frameright">

	<H3>我的最近邻居</H3>
	<ul>
	<%
		if(userId != null){
			List<user> neighbors = SelectDao.getNeighbors(Integer.valueOf(userId));
			for (user u : neighbors) {
				if(u.getId().equals(Integer.valueOf(userId))){
					continue;
				}
			if(u.getId()!=7)//最近邻居显示的时候不显示管理员admin
				{
				   String html = "<li><a href=\"main.jsp?user=" + "" + u.getId() + "\">" + u.getUser_name() + "</a></li>";
				   out.println(html);
				}
			}
		}
	%>
	</ul>
</div> 




</div> 




<br/>


<div id="pageControl" style="text-align: center; position:fixed;bottom:0;left:50%">
				<h5><a href="index.jsp">退出登录</a></h5>
</div>
</div>












</body>

</html>