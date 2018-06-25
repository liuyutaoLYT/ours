<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <footer class="footer-style-1">
      <div class="container">
        <div class="row">
          <div class="footer-style-1-inner">
            <div class="widget-footer widget-text col-first col-small">
              <a href="#">
                <img src="${pageContext.request.contextPath}/images/lo.png" alt="Logo Organic"/>
              </a>
              <div class="widget-link">
              
                <ul>
                  <li>
                    
                    <span>379 5th Ave New York, NYC 10018</span>
                  </li>
                  <li>
                    
                    <a href="tel:0123456789">(+1) 96 716 6879</a>
                  </li>
                  <li>
                   
                    <a href="mailto: contact@site.com">contact@site.com </a>
                  </li>
                </ul>
                
                
                
                
              </div>
            </div>
            <div class="widget-footer widget-link col-second col-medium">
              <div class="list-link">
                <h4 class="h4 heading">关于我们</h4>
                <ul>
                  <li>
                   <a href="${ pageContext.request.contextPath}/index">首页</a>
                   &nbsp;
                    <a class="active" href="cai.jsp">菜谱</a>
                  </li>
                  <li>
                    <a href="archive.jsp">甄选</a>
                   &nbsp;
                    <a href="${ pageContext.request.contextPath}/myHealth">健康</a>
                  </li>
                  <li>
                   <a href="reservation.jsp">专题</a>
                   &nbsp;
                    <a href="${ pageContext.request.contextPath}/topicshow">社区</a>
                  </li>
                  
                  <li>
                   <a href="gallery.jsp">话题</a>
                   &nbsp;
                  </li>
                 
                </ul>
              </div>
              <div class="list-link">
                <h4 class="h4 heading">联系我们</h4>
                <ul>
                  
                  <li>
                    <a href="#">FAQ</a>
                  </li>
                  <li>
                    <a href="#">Privacy Policy</a>
                  </li>
                  <li>
                    <a href="#">Blog</a>
                  </li>
                </ul>
              </div>
              <div class="list-link">
                <h4 class="h4 heading">我的账户</h4>
                <ul>
                  <li>
                    <a href="${ pageContext.request.contextPath }/userLogin">登录</a>
                  </li>
                  <li>
                    <a href="${ pageContext.request.contextPath }/userRegister">注册</a>
                  </li>
                 
                  <c:if test="${sessionScope.user != null}">
				<li class="nav navbar-nav">
					<a href="${ pageContext.request.contextPath }/center/get"><c:out value="${user.username }"/></a>
					
				</li>
				<li class="nav navbar-nav">
				<a>|</a>
				</li>
				<li class="nav navbar-nav"><a
					href="${ pageContext.request.contextPath }/quit">退出</a>
				</li>
			</c:if>
                </ul>
              </div>
            </div>
            <div class="widget-footer widget-newsletter-footer col-last col-small">
              <h4 class="h4 heading">邮箱</h4>
              <p>现在就来联系我们</p>
              <form class="organic-form form-inline btn-add-on circle border">
                <div class="form-group">
                  <input class="form-control pill transparent" placeholder="Your Email..." type="email" />
                  <button class="btn btn-brand circle" type="submit">
                    <i class="fa fa-envelope-o"></i>
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="copy-right style-1">
        <div class="container">
          <div class="row">
            <div class="copy-right-inner">
              <p>Copyright © 2017 Designed by AuThemes. All rights reserved.</p>
              <div class="widget widget-footer widget-footer-creadit-card">
                <ul class="list-unstyle">
                  <li>
                    <a href="#">
                      <img width:40 src="${pageContext.request.contextPath}/images/creadit-card-01.png" alt="creadit card" />
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="${pageContext.request.contextPath}/images/creadit-card-02.png" alt="creadit card" />
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="${pageContext.request.contextPath}/images/creadit-card-03.png" alt="creadit card" />
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="${pageContext.request.contextPath}/images/creadit-card-04.png" alt="creadit card" />
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>