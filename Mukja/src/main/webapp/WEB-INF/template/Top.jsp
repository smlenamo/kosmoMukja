<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script>
	function isLogin(){//top에있으니 로그인 여부 확인할때는 해당 스크립트함수를 호출하자
		//ajax요청
		$.ajax({
			url:"<c:url value='/OneMemo/Auth/IsLogin.bbs'/>",
			dataType:'json',
			success:function(data){
				//서버로 받은 데이터는 data에 있다				
				console.log("데이터"+data);
				console.log(JSON.stringify(data));
				if(data.IsLogin=="YES"){
					// 목록페이지로 이동
					location.replace("<c:url value='/OneMemo/BBS/List.bbs'/>");
					
				}else{
					// 비로그인 상태
					alert('로그인후 이용하시오.');
					location.replace("<c:url value='/OneMemo/Auth/Login.bbs'/>");
					
				}
					
			},
			error:function(e){
				//서버로 받은 에러는 e에 있다				
			
			}
			
		});
	}

</script>

<style>
	body{
		padding-top:50px;
	}
</style>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	<!-- 상단메뉴 시작 -->
	<div class="container-fluid">
		<!--화면 크기가 작을때 보여지는 네비게이션바(모바일용)  -->
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#collapse-menu">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>			
			<a class="navbar-brand" href='<c:url value="/"/>'>
				<span class="glyphicon glyphicon-education"></span>
				KOSMO
			</a>
		</div>
		<!-- navbar-header -->

		<!-- 화면 크기가 클때 상단에 보여지는 메뉴(데스크탑용) -->
		<div class="collapse navbar-collapse" id="collapse-menu">
			<!-- 네비게이션바에 폼 추가 -->
			<form class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색" />
				</div>
				<button class="btn btn-info">확인</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href='<c:url value="/"/>'>HOME</a></li>
				
				<c:if test="${empty sessionScope.id }" var="isNotLogin">				
				<li><a href="<c:url value="/OneMemo/Auth/Login.bbs"/>">로그인</a></li>
				</c:if>
				<c:if test="${not  isNotLogin}">
				<li><a href="<c:url value="/OneMemo/Auth/Logout.bbs"/>">로그아웃</a></li>
				</c:if>
				
				<%-- 시큐리티 사용시 
				<sec:authorize access="isAnonymous()">
					<li><a href="<c:url value="/OneMemo/Auth/Login.bbs"/>">로그인</a></li>					
				</sec:authorize>
					
					<!-- 로그아웃을 무조건 포스트 방식으로 해줘야한다 / scrf공격을 막기위해 설정파일영향을 줌 -->
				<sec:authorize access="isAuthenticated()">
			        <li><a href="javascript:logout()">로그아웃</a></li><!-- 자바스크립트로 포스트방식으로 전송 -->
				</sec:authorize>
				
				--%>
				<!-- 에이젝스를 위해서 주석 -->
				<li><a href='<c:url value="/OneMemo/BBS/List.bbs"/>'>한줄 댓글 게시판 게시판</a></li>
				 
				 <!-- Ajax로 로그인 여부 판단 
				 <li><a href="javascript:isLogin()">한줄 댓글 게시판</a></li>
				<li><a href="javascript:isLogin()">Q&A</a>
			</ul>
		</div>
		.-->
		<!-- /.navbar-collapse -->
		
		
	<!-- 스프링 시큐리티 때문에 post방식으로 보내기 위한 폼테그 -->
		<!-- 꼭 스프링시큐리티의 로그아웃지정한에 rul패턴으로 보내준다
	<form id="logoutFrom" action="<c:url value='/OneMemo/Auth/Logout.bbs'/> " method="post">
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>			
	</form>
	 -->
	<!-- 위 폼을 실행시킬 스크립트 -->
	
	<script>
		//function logout(){
			//$('#logoutFrom').submit();
		//}
	</script>
	
	
	</div>
	<!-- /.container-fluid -->
</nav>
<!--  상단 메뉴 끝 -->