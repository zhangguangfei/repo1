<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑用户信息页面</title>
<script type="text/javascript">
$(function(){
	$("#but").click(function(){
		//history.go(-1);
		history.back();
	});
	
	//1、获取性别的值
	var sex='${u1.sex}';
	//2、根据值做判断且添加被选择项 
	if(sex=='0'){//男 
		$("#man").prop("checked","checked");	
	}else{//女 
		$("#girl").prop("checked","checked");	
	}
});
</script>
</head>
<body>
<form action="updateUser.do" method="post">
<!--隐藏域 一般用于修改 -->
<input type="hidden" name="id" value="${u1.id}"/>
<table border="1" cellpadding="0" cellspacing="0" width="60%">
	<tr style="background-color:orange">
		<th colspan="2"><h2>编辑用户</h2></th>
	</tr>
	<tr>
		<td>用户名</td>
		<td><input type="text" name="name" value="${u1.name}"/></td>
	</tr>
	<tr>
		<td>密码</td>
		<td><input type="password" name="password" value="${u1.password}"/></td>
	</tr>
	<tr>
		<td>年龄</td>
		<td><input type="text" name="age" value="${u1.age}"/></td>
	</tr>
	<tr>
		<td>性别</td>
		<td>
			<input type="radio" name="sex" value="0" id="man"/>男
			<input type="radio" name="sex" value="1" id="girl"/>女
		</td>
	</tr>
	<tr>
		<th colspan="2"><input type="submit" id="sub" value="修改"/>  <input type="button" id="but" value="返回"/></th>
	</tr>
</table>
</form>
</body>
</html>