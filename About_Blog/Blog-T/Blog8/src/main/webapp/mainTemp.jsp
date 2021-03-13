<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blog.css">
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<title>${pageTitle }--Powered by rui1024</title>
<style type="text/css">
	body{
		padding-top:10px;
		padding-bottom:40px;
	}
</style>
</head>
<body>
<div class="container">
	
	<jsp:include page="/foreground/common/head.jsp"></jsp:include>
	
	<jsp:include page="/foreground/common/menu.jsp"></jsp:include>

	<div class="row">
		<div class="col-md-9">
			<jsp:include page="${mainPage }"></jsp:include>
		</div>
		
		<div class="col-md-3">
			<div class="data_list">
				<div class="data_list_title">
		  			<img src="${pageContext.request.contextPath}/static/images/user_icon.png">博主信息
		  		</div>
		  		<div class="user_image">
					<img src="${pageContext.request.contextPath}/static/userImages/${blogger.imageName }"/>
				</div>
				<div class="nickName">${blogger.nickName }</div>
				<div class="userSign">(${blogger.sign })</div>
			</div>
			
			<div class="data_list">
				<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/static/images/byType_icon.png"/>
					按日志类别
				</div>
				<div class="datas">
					<ul>
							<c:forEach var="blogType" items="${blogTypeCountList }">
								<li><span><a href="${pageContext.request.contextPath}/index.html?typeId=${blogType.id}">${blogType.typeName }(${blogType.blogCount })</a></span></li>
							</c:forEach>
					</ul>
				</div>
			</div>
			<div class="data_list">
				<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/static/images/byDate_icon.png"/>
					按日志日期
				</div>
				<div class="datas">
					<ul>
						<c:forEach var="blog" items="${blogCountList }">
							<li><span><a href="${pageContext.request.contextPath}/index.html?releaseDateStr=${blog.releaseDateStr }">${blog.releaseDateStr }(${blog.blogCount })</a></span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<div class="data_list">
				<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/static/images/link_icon.png"/>
					友情链接
				</div>
				<div class="datas">
					<ul>
						<c:forEach var="link" items="${linkList }">
							<li><span><a href="${link.linkUrl }" target="_blank">${link.linkName }</a></span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/foreground/common/foot.jsp"></jsp:include>
	
</div>
</body>
</html>