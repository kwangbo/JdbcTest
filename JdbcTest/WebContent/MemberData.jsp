<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<%!

	Connection conn;
	Statement stat;
	ResultSet res;

	String driver = "oracle.jdbc.driver.OracleDriver";
	
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	
	String uid= "scott";
	String upw = "1234";
	String query = "select * from member";
	

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
github 시험중 

<%

    
	try {

		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);
		stat = conn.createStatement();
		res = stat.executeQuery(query);

		while (res.next()) {
			String id = res.getString("ID");
			String pw = res.getString("PW");
			String name = res.getString("NAME");
			String phone = res.getString("PHONE");

			out.println("아이디: " + id + "비번: " + pw + "이름: " + name
					+ "전화번호: " + phone + "<br />");
		}

	} catch (Exception e) {
		out.println(e.getMessage());

	} finally {
		try {
			if (res != null)
				res.close();
			if (stat != null)
				stat.close();
			if (conn != null)
				conn.close();
		} catch (Exception e2) {
			out.println(e2.getMessage());
		}
	}
%>
</body>
</html>