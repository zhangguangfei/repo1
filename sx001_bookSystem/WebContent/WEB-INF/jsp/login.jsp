<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
</head>
<body>
<div align="center">
<form action="doLogin.do" method="post">
<table border="1" cellpadding="0" cellspacing="0" width="60%">
	<tr>
	 <th colspan="2"><h2>图书管理系统</h2></th>
	 </tr>
	 <tr>
	   <th style="background-color:orange">用户名:</th>
	   <td ><input type="text" name="name" value=""/></td>
	 </tr>
	 <tr>
	   <th style="background-color:orange">密码:</th>
	   <td ><input type="password" name="password" value=""/></td>
	 </tr>
	 <tr>
	 	<th colspan="2"><input type="submit" value="登录"/></th>
	 </tr>
	 <tr>
	 	<th colspan="2"><span style="color:red">${msg==null?'':msg}</span></th>
	 </tr>
</table>
</form>
</div>
</body>
</html>