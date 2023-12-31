
<!-- jsp 시작시 필요한 부분 -->
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
Context ctx = new InitialContext();
DataSource dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");/*jdbc/mysql Server 프로젝트 내의 context.xml에 있는 resourse내용  */
Connection con = dataFactory.getConnection();

String sql = "SELECT * FROM TRAVEL LIMIT ?, ?";

PreparedStatement stmt = con.prepareStatement(sql);
stmt.setInt(1, 0);
stmt.setInt(2, 10);

// SELECT QUERY 실행

ResultSet rs = stmt.executeQuery();
%>


<body>
	<div class="container">
		<body>
			<div class="container">
				<h1>100대 관광지 목록 보기</h1>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>No</th>
							<th>권역</th>
							<th>title</th>
						</tr>
					</thead>
					<tbody>

						<%
						while (rs.next()) {
							int no = rs.getInt("no");
							String region = rs.getString("region");
							String title = rs.getString("title");
						%>
						<tr>
							<td><%=no%></td>
							<td><%=region%></td>
							<td><%=title%></td>
						</tr>

						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</body>
</body>
<%@ include file="footer.jsp"%>
<%
	rs.close();
	stmt.close();
	con.close();
%>