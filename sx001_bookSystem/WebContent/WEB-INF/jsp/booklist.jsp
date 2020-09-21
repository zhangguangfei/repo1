<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书列表页面</title>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
</head>
<body>
<div align="center">
<h2><a href="toUserUpdatePage.do?id=${sessionScope.user.id}">${sessionScope.user.name}</a>欢迎您!</h2>
<h3><a href="downLoad.do?filename=${sessionScope.user.picture}"><img src="${ctx}/imgs/${sessionScope.user.picture}" title="点击下载" width="100px" height="100px"/>点击下载</a></h3>
<form action="booklist.do" method="post">
	书名:<input type="text" name="name" value="${name==null?'':name}"/>&nbsp;
	作者:<input type="text" name="author" value="${author==null?'':author}"/>
	<input type="submit" value="搜索"/> &nbsp;<input type="button" id="delMany" value="批量删除"/>
</form><br>
<table border="1" cellpadding="0" cellspacing="0" width="60%">
<tr>
	<th colspan="9" style="background-color:orange"><h2>图书列表页面</h2></th>
</tr>
<tr>
	<th><input type="checkbox" id="all"/></th>
	<th>书名</th>
	<th>作者</th>
	<th>出版社</th>
	<th>出版日期</th>
	<th>页数</th>
	<th>价格</th>
	<th>摘要</th>
	<th>操作</th>
</tr>
<c:forEach items="${bklist}" var="bk">
	<tr class="base">
		<th><input type="checkbox" name="ids" value="${bk.id}"/></th>
		<th>${bk.name}</th>
		<th>${bk.author}</th>
		<th>${bk.publish}</th>
		<th><fmt:formatDate value="${bk.publishdate}" pattern="yyyy-MM-dd"/></th>
		<th>${bk.page}</th>
		<th>${bk.price}</th>
		<th>${bk.content}</th>
		<th><a href="toUpdate.do?id=${bk.id}">修改</a> <a href="deleteBook.do?id=${bk.id}">删去</a></th>
   </tr>
</c:forEach>
<tr>
	<th colspan="9"><input type="button" id="bt" value="新增图书"/></th>
</tr>
</table>
<p>
	<a href="booklist.do?pno=${page.navigateFirstPage}&name=${name}&author=${author}">首页</a>&nbsp;
	<a href="booklist.do?pno=${page.hasPreviousPage==true?page.prePage:page.navigateFirstPage}&name=${name}&author=${author}">上页</a>&nbsp;
	<a href="booklist.do?pno=${page.hasNextPage==true?page.nextPage:page.navigateLastPage}&name=${name}&author=${author}">下页</a>&nbsp;
	<a href="booklist.do?pno=${page.navigateLastPage}&name=${name}&author=${author}">尾页</a>&nbsp;
	当前页${page.size}条数据   第${page.pageNum}/${page.pages}页,共${page. total}条数据
</p>
</div>
<script type="text/javascript">
$(function(){ //隔行变色 
	$(".base:even").css("background-color","purple");  //even-索引下标 偶数行 odd-基数行
	$("#bt").click(function(){
		//点击之后去新增页面-发送一个请求 toAdd.do是控制层的处理请求的url
		window.location.href="toAdd.do";
	});
	//全选全部取消-步骤（当选中书名前面的按钮、下面所有图书都被选中 反之，下面所有图书都被取消选中）
	$("#all").click(function(){
		if($(this).is(":checked")){ //如果被选中
			$("[name=ids]").prop("checked",true); //添加选中状态
		}else{
			$("[name=ids]").prop("checked",false);//取消选中状态
		}
	})
	
	//发送批量删去请求
	$("#delMany").click(function(){
		var ch=$("[name=ids]:checked"); //所有被选中状态的元素
		if(ch.length==0){
			//没有被选中的元素-提示并且代码不往下执行
			alert("请至少选择要删去的一本书");
			return; //代码不往下执行
		}
		//有选中状态的元素-提交请求（url）并且需要携带要被删去元素的id
		url="delMany.do?ids=";
		//遍历被选中的元素，并且拿到相应的值
		for(var i=0;i<ch.length;i++){
			url+=$(ch[i]).val()+",";
		}
		window.location.href=url; //发送请求 url为 delMany.do?ids=1,2,3
	});
});
</script>
</body>
</html>