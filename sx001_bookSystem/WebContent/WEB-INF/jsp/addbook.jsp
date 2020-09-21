<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增图书页面</title>
</head>
<body>
<form action="addBook.do" method="post">
<table border="1" cellpadding="0" cellspacing="0" width="60%">
	<tr style="background-color:orange">
		<th colspan="2"><h2>增加图书</h2></th>
	</tr>
	<tr>
		<td>书名<span style="color:red">(*)</span></td>
		<td><input type="text" name="name" id="name" value=""/><span style="color:red" id="nmsg"></span></td>
	</tr>
	<tr>
		<td>作者<span style="color:red">(*)</span></td>
		<td><input type="text" name="author" id="author" value=""/><span style="color:red" id="amsg"></span></td>
	</tr>
	<tr>
		<td>出版社<span style="color:red">(*)</span></td>
		<td><input type="text" name="publish" id="publish" value=""/><span style="color:red" id="pmsg"></span></td>
	</tr>
	<tr>
		<td>出版日期<span style="color:red">(*)</span></td>
		<td><input type="text" name="publishdate" id="publishdate" value=""/>(yyyy-MM-dd)<span style="color:red" id="pumsg"></span></td>
	</tr>
	<tr>
		<td>页数</td>
		<td><input type="text" name="page" value=""/></td>
	</tr>
	<tr>
		<td>价格</td>
		<td><input type="text" name="price" value=""/></td>
	</tr>
	<tr>
		<td>内容摘要</td>
		<td><textarea rows="15" cols="30" name="content"></textarea></td>
	</tr>
	<tr>
		<th colspan="2"><input type="submit" id="sub" value="提交"/>  <input type="button" id="but" value="返回"/></th>
	</tr>
</table>
</form>
<script type="text/javascript">
$(function(){
	$("#sub").click(function(){ //验证 
		return checkName() && checkAuthor() && checkPublish() && checkPublishdate();
	});
	
	$("#but").click(function(){ //返回 
		//history.go(-1);
		history.back();
	});
});

//验证图书名 
function checkName(){
	//1、获取文本框的值
	var name=$("#name").val();
	//2、根据值做判断
	if(name.length==0){ //长度为0表示为空
		//给其提示 
		$("#nmsg").html("*书名不能为空");
		return false;
	}
	//3、返回true或者false
	return true;
}

//验证作者  
function checkAuthor(){
	//1、获取文本框的值
	var author=$("#author").val();
	//2、根据值做判断
	if(author.length==0){ //长度为0表示为空
		//给其提示 
		$("#amsg").html("*作者不能为空");
		return false;
	}
	//3、返回true或者false
	return true;
}

//验证出版社 
function checkPublish(){
	//1、获取文本框的值
	var publish=$("#publish").val();
	//2、根据值做判断
	if(publish.length==0){ //长度为0表示为空
		//给其提示 
		$("#pmsg").html("*出版社不能为空");
		return false;
	}
	//3、返回true或者false
	return true;
}

//验证图书名 
function checkPublishdate(){
	//1、获取文本框的值
	var publishdate=$("#publishdate").val();
	//2、根据值做判断
	if(publishdate.length==0){ //长度为0表示为空
		//给其提示 
		$("#pumsg").html("*出版日期不能为空");
		return false;
	}
	//3、返回true或者false
	return true;
}
</script>
</body>
</html>