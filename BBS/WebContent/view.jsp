<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID=0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");	
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	 %>

<style type="text/css">
        .title{
            color:#007bff;
        }

        .mgTp{
            margin-top:10%;
        }

        .topBtn{
            margin-top:15px;
        }

        ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
            color: #007bff !important;
            opacity: 1; /* Firefox */
        }

        :-ms-input-placeholder { /* Internet Explorer 10-11 */
            color: #007bff !important;
        }

        ::-ms-input-placeholder { /* Microsoft Edge */
            color: #007bff !important;
        }
        </style>
        
        <!--Navigation Var-->
        <nav class="navbar navbar-expand-md bg-dark navbar-dark">
            <a class="navbar-brand" href="index.jsp">NOOSE</a>
            <button class="navbar-toggler" type="button"
                    data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">소개</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="instructor.html">강사진</a>
                    </li>
                    <!--Dropdown-->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            프로그래밍
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="lecture.html?lectureName=C">C/C++</a>
                            <a class="dropdown-item" href="lecture.html?lectureName=Java">Java</a>
                            <a class="dropdown-item" href="lecture.html?lectureName=Python">Python</a>

                        </div>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="bbs.jsp">게시판</a>
                    </li>
                </ul>
                <!--Search form-->
                <!---->
                <form class="form-inline" action="#">
                    <input class="form-control" type="text" placeholder="검색어">
                    <button class="btn btn-success" type="submit">찾기</button>
                </form>
                <!--Login/Register-->
                <%
                	if(userID == null) {
                		 
                %>
                 <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            접속하기
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="login.jsp">로그인</a>
                            <a class="dropdown-item" href="join.jsp">회원가입</a>
                        </div>
                    </li>
                </ul>
                <%
                	} else {
                %>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            회원관리
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
                        </div>
                    </li>
                </ul>
				<%
                	}
				%>
            </div>
        </nav>
        
        <br>
        <div class="container">
        	<div class="row">
        		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd"">
        			<thead>
        				<tr>
        					<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th> 
        				</tr>
        			</thead>
        			<tbody>
        				<tr>
        					<td style="width: 20%;">글 제목</td>
        					<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbps;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
        				</tr>
	        			<tr>
        					<td>작성자</td>
        					<td colspan="2"><%=bbs.getBbsTitle() %></td>
        				</tr>	
	        			<tr>
        					<td>작성일자</td>
        					<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" +  bbs.getBbsDate().substring(14, 16) + "분"%></td>
        				</tr>	
        	        	<tr>
        					<td>내용</td>
        					<td colspan="2" style="min-height: 200px; text-align: Left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbps;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
        				</tr>	        						
        			</tbody>
        		</table>	
        		<a href="bbs.jsp" class="btn btn-primary">목록</a>
        		
				<%
					if(userID != null && userID.equals(bbs.getUserID())) {
				%>
						&nbsp;
						<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
						&nbsp;
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
	
				<%
					}
				%>		
				
				
        	</div>
        </div>
        
        
        
        
		<br>


        <!--footer-->
        <style type="text/css">
            .jumbotron {
                background-image: url('images/jumbotronbackground.jpg');
                background-size: cover;
                text-shadow: black 0.2em 0.2em 0.2em;
                color: white;
            }
        </style>
        <div class="jumbotron text-center mt-5 mb-0">
            <h3 class="text-primary">NOOSE</h3>
            <p>Copyright &copy; 2020<br>성준혁(Junhyuk Sung)</p>
        </div>

        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
    
</body>
</html>