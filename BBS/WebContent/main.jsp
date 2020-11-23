<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li class="nav-item">
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
			<div class="jumbotron">
				<div class="container">
					<h1>웹 사이트 소개</h1>
					<p>
						부트스트랩과 JSP기능을 이용한 웹 사이트 입니다.
					</p>
					<p><a class="btn btn-primary btn-pull" href='#' role="button">자세히 알아보기</a></p>
				</div>
			</div>
		</div>
		<div class="container">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="images/img1.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="images/img2.png" class="d-block w-100" alt="...">
			    </div>
   			    <div class="carousel-item">
			      <img src="images/img3.png" class="d-block w-100" alt="...">
			    </div>
   			    <div class="carousel-item">
			      <img src="images/img4.jpg" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>


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