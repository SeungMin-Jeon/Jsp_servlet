 <!-- jsp 시작시 필요한 부분 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
  <body>
  <div class="container">
  		<form action="loginInfo.jsp" method="post">
  		<fieldset>
  			<legend>로그인 폼</legend>
  			<ul>
  				<li>
  					<label for="userid">아이디</label>
  					<input type="text" name="userid">
  				</li>
  				<li>
  					<label for="Password">비밀번호</label>
  					<input type="password" name="Password">
  				</li>
  				<li><input type="submit" value="전송"></li>
  			</ul>
  		</fieldset>
  	</form>
  	</div>
  </body>
  <%@ include file="footer.jsp" %>