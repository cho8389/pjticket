<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Ticket82</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath() %>/resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath() %>/resources/main/css/modern-business.css" rel="stylesheet">
	
	<style>
		.nav-item{
			border-left:1px solid #dc6565;
		}
		
		.card-img-top{
			width:228px;
			height:340px;
			display: block;
			margin-left: auto;
			margin-right: auto;
		}
		
		/* 드롭다운 호버 */
		
		.dropdown:hover .dropdown-menu-right {
    		display: block;
		}
		
		/* 티켓인기작 전체 */
		.ticketFamous{
			overflow: hidden;
			width: 960px;
			margin-bottom: 45px;
			margin-right: auto;
			margin-left:auto;
		}
		
		.ticketFamous h2{
			text-align: center;
			color: #dc3545;
		}
		
		/* 티켓인기작배너 */
		.ticketFamous .ticketFamousBanner{
			width: 976px;
			height: 340px;
		}
		
		/* 티켓인기작 사진 */
		.ticketFamous .ticketFamousCube{
			float: left;
			width: 228px;
			height: 340px;
			margin-right: 16px;
		}
		
		.ticketFamous .ticketFamousCube.hasRoll{
			position: relative;
		}
		
		.ticketFamous .ticketFamousCube.hasRoll .item.selected{
			display:block;
		}
		
		.ticketFamous .ticketFamousCube.hasRoll .item.tempTop{
			z-index: 2;
		}
		
		.ticketFamous .ticketFamousCube .item{
			position: relative;	
		}
		
		.ticketFamous .ticketFamousCube .item .contents{
			position: absolute;
			top: 43px;
			width: 228px;
		}
		
		.ticketFamous .ticketFamousCube .item .contents .label{
			height: 27px;
			background: url("//ticketimage.interpark.com/TicketImage/2015/20150429_main/img/cubeLabels.png") center 100px no-repeat;
			background-position: center -41px;
		}
		
		.ticketFamous .ticketFamousCube .item .contents .contentTxt{
			display: block;
  			padding-top: 12px;
  			background: url("//ticketimage.interpark.com/TicketImage/2015/20150429_main/img/cubeLabels.png") center -429px no-repeat;
  			text-decoration: none;
  			font-family: "malgun gothic";
  			letter-spacing: -1px;
		}
		
		.ticketFamous .ticketFamousCube .item .contents .contentTxt b{
			overflow: hidden;
  			display: block;
  			width: 174px;
  			height: 18px;
  			margin: 0 auto;
  			font-size: 14px;
  			text-overflow: ellipsis;
  			white-space: nowrap;
  			color: #333;
		}
		
		/* 최근 본 상품 */
		#rightSide{
			position: absolute;
			top: 547px;
			left: 50%;
			margin: 0 0 0 510px;
		}

		#rightSide #right_zzim {
			position: fixed;
			top: 126px;
			left: 50%;
			margin-left: 510px;
			border:1px solid #B0B5BD;
			width:114px;
			height:543px;
		}

		#rightSide #right_zzim  div {text-align:center;}

		#rightSide #right_zzim  div.recTit{line-height:1.5em;padding:5px;color:white;background-color:#505A69;}

		#right_zzim #recentCnt {color:yellow;}

		#rightSide #right_zzim ul {min-height:495px;}

		#rightSide #right_zzim  li{text-align:center;padding:5px;position:relative;} 

		#rightSide #right_zzim ul li img {border:1px solid #ccc}

		#right_zzim .detail {
			display: none;
			position: absolute;
			top: 3px;
			right: 20px;
			xheight: 40px;
			xpadding: 15px 11px 0;
			xbackground: #404a59;
			color: #fff;
			xtext-align: left;
			white-space: nowrap;
		}



		#right_zzim li:hover .detail {display:block}

		#right_zzim li .btn_delete {
			position: absolute;
			top: 3px;
			right: -1px;
			width: 11px;
			height: 11px;
			background: url(/img/sp.png) no-repeat -193px -111px;
			text-indent: -9000px;
		}

		#right_zzim  #currentPage {color:#505A69;font-weight:bold}

		#right_zzim  #totalPageCount {color:#CBC8D2;font-weight:bold}

		.noData {color:#ccc;text-align:center;margin-top:223px;}
		}

		#paging {display:;position:relative;line-height:1em;}

		#paging .btn_prev {
			position: absolute;
			top: 526px;
			left: 4px;
			width: 13px;
			height: 11px;
			text-indent: -9000px;
			border:1px solid #CCC;
			display:inline-block;
		}

		#paging .btn_next {
			position: absolute;
			top: 526px;
			right: 4px;
			width: 13px;
			height: 11px;
			text-indent: -9000px;
			border:1px solid #CCC;
			display:inline-block;
		}

	</style>
  </head>

  <body>

    <!-- Navigation -->
    <!-- 메뉴바 -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index">Ticket82</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="mclistA">뮤지컬</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html">콘서트</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="services.html">연극</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.html">연주회</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html">전시회</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="board/etc">기타</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html">이벤트</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                고객센터
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="faq.html">공지사항</a>
                <a class="dropdown-item" href="faq.html">Q&A</a>
                <a class="dropdown-item" href="faq.html">FAQ</a>
              </div>
            </li>
            
            <sec:authorize access="! isAuthenticated()">
            <li class="nav-item">
              <a class="nav-link" href="/admin/login">로그인</a>
            </li>
            </sec:authorize>
            <sec:authorize access="hasAuthority('ROLE_ADMIN')">
            	<li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               	마이페이지
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="#">회원정보</a>
                <a class="dropdown-item" href="#">예약확인</a>
				<a class="dropdown-item" href="#">게시글확인</a>
              </div>
            </li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            		<li class="nav-item">
              			<a class="nav-link" href="#" onclick="javascript:location.href=
							'<%=request.getContextPath() %>/admin/logout'">로그아웃</a>
            		</li>
            </sec:authorize>
          </ul>
        </div>
      </div>
    </nav>

    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0"  class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('http://ticketimage.interpark.com/TCMS4/Main/201711/MainVisual_1c401414-3954-43b2-ba2c-ac03d9689870.png')">
            <div class="carousel-caption d-none d-md-block">
              <h3>First Slide</h3>
              <p>This is a description for the first slide.</p>
              <button class="btn btn-danger">상세보기</button>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('http://ticketimage.interpark.com/TCMS4/Main/201711/MainVisual_b0550fca-e259-45d8-85c9-44e87068c780.png')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Second Slide</h3>
              <p>This is a description for the second slide.</p>
              <button class="btn btn-danger">상세보기</button>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('http://ticketimage.interpark.com/TCMS4/Main/201712/MainVisual_48de0005-e8cc-4b0f-a728-fc7be310f73b.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Third Slide</h3>
              <p>This is a description for the third slide.</p>
              <button class="btn btn-danger">상세보기</button>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>
    
    <!-- 사이드바 -->
    <div id="rightSide">
		<div id="right_zzim">
			<div  class="recTit">최근본상품 <span id=recentCnt></span></div>
			<ul></ul>    <!-- 본 상품이 뿌려질 부분  -->
			<div id="paging"><a class="btn_prev" style="cursor:pointer" >이전</a><span  id="currentPage"></span><span id="totalPageCount"></span><a class="btn_next" style="cursor:pointer" >다음</a></div>
		</div>
	</div> 



    
   	<!-- 인기작 -->
   	<div class="ticketFamous">
   		<!-- 뮤지컬 인기작 -->
   		<div class="ticketFamousBanner">
   			<h2>Musical</h2>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201801/TicketTodayNew_TicketTodayMusical_eb869746-8d0c-41c2-8616-be46e4f3a117.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/Play/image/large/17/17011875_p.gif">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/Play/image/large/17/17017348_p.gif">
   					</a>
   				</div>
   			</div>
   		</div>
   		<!-- 콘서트 -->
   		<div class="ticketFamousBanner">
   			<h2>Concert</h2>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   		</div>
   		<!-- 연극 -->
   		<div class="ticketFamousBanner">
   			<h2>Play</h2>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   		</div>
   		<!-- Classic -->
   		<div class="ticketFamousBanner">
   			<h2>Classic</h2>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   		</div>
   		<!-- 전시회 -->
   		<div class="ticketFamousBanner">
   			<h2>Exhibition</h2>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   		</div>
   		<!-- 기타 -->
   		<div class="ticketFamousBanner">
   			<h2>The Others</h2>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   			<div class="ticketFamousCube">
   				<div class="item">
   					<div class="contents">
   						<div class="label"></div>
   						<a class="contentTxt" href="#">
   						</a>
   					</div>
   					<a href="#">
   						<img src="http://ticketimage.interpark.com/TCMS4/Main/201711/TicketTodayNew_TicketTodayMusical_79ab4aa1-1d7a-48c2-aef9-05a6db645923.jpg">
   					</a>
   				</div>
   			</div>
   		</div>

   	</div>
   	<!-- 인기작 끝 -->

    <!-- Page Content -->
    <div class="container">

      <h1 class="my-4">공지사항</h1>

      <!-- Marketing Icons Section -->
      <div class="row">
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-danger">상세보기</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-danger">상세보기</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-danger">상세보기</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Portfolio Section -->
      <h2>이벤트</h2>

      <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://ticketimage.interpark.com/TCMS4/Main/201801/TicketTodayNew_TicketTodayMusical_eb869746-8d0c-41c2-8616-be46e4f3a117.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">뮤지컬</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" style="width:228px, height:340px;" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Two</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Three</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Four</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Five</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Six</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Features Section -->
      <div class="row">
        <div class="col-lg-6">
          <h2>Modern Business Features</h2>
          <p>The Modern Business template by Start Bootstrap includes:</p>
          <ul>
            <li>
              <strong>Bootstrap v4</strong>
            </li>
            <li>jQuery</li>
            <li>Font Awesome</li>
            <li>Working contact form with validation</li>
            <li>Unstyled page elements for easy customization</li>
          </ul>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
        </div>
        <div class="col-lg-6">
          <img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Call to Action Section -->
      <div class="row mb-4">
        <div class="col-md-8">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-danger btn-block" href="#">Call to Action</a>
        </div>
      </div>

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath() %>/resources/main/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script>
	//
	// recent item    
	var Cpage;   // 현재 페이지 
	var pagingSize = 4;   // 원하는 페이지 사이즈로 조정
	function chkRecent(a){
		var itemID = getCookie("itemID");
		$("#right_zzim ul").html('');    // 일단 Ul 내용 지우기... 
		if(itemID){
			var totcount = itemID.split('&').length-1;   //
			var totpage = Math.ceil(totcount / pagingSize) *1;
			Cpage = (totpage >= a )? a:1;
			Cpage = (Cpage <1)? totpage:Cpage;
			var start = (Cpage-1) * pagingSize;    
			for (i = start ; i <= start+(pagingSize-1) ;i++){
				var  thisItem = itemID.split('&')[i];
				if(thisItem){
					var itemId = thisItem.split(':')[0];
					var itemImg = thisItem.split(':')[1];
					$("#right_zzim ul").append('<li><a href="/member/?id='+itemId+'" target="_top"><img src="http://www.xxx.com/images/s'+itemImg+'"  width="75" border=1></a><div class="detail"><a href="javascript:removeRecentItem(\''+thisItem+'\')" class="btn_delete">삭제</a></div></li>')
				}
			}
			$("#paging").show();
		}else{
			$("#right_zzim ul").append('<p class="noData">최근 본 상품이<br> 없습니다.</p>');
			$("#paging").hide();$("#recentCnt").text('');
		}
		updateRecentPage(totcount, Cpage);
	}
	chkRecent(1);
	function removeRecentItem(itemname){
		var itemID = getCookie("itemID");
		itemID = itemID.replace(itemname+"&","");			
		setCookie("itemID",itemID,1);
		chkRecent(Cpage);
	}
	function updateRecentPage(totcount,Cpage){  //  
		$("#recentCnt").text(totcount);  //
		$("#totalPageCount").text("/"+Math.ceil((totcount / pagingSize) *1)); 
		if(Math.ceil((totcount / pagingSize) *1) < Cpage){
			$("#currentPage").text(Math.ceil((totcount / pagingSize) *1));
		}else{
			$("#currentPage").text(Cpage);  //
		}
	}
	$(".btn_next").on('click',function(){
		chkRecent(Cpage + 1);
	});
	$(".btn_prev").on('click',function(){
		chkRecent(Cpage - 1);
	});
	//쿠키를 저장하는 페이지는...    아래 코드만 삽입 
	function checkCookie() {
	    var itemID = getCookie("itemID");
		var thisItem='<?=$bookID?>:<?=$itemImage ?>';   // 제품 아이디와 이미지 이름을 저장  2차원 배열처럼 쓸려고 짱구를 굴림...  json 형태로 저장도 가능할텐데.... 그건 취향대로 
		if (thisItem){
			if (itemID != "" && itemID != null) {
				if (itemID.indexOf(thisItem) ==-1 ){ //값이 없으면 
					setCookie("itemID",thisItem+"&"+itemID,1);
				 }
			}else {
				if (itemID == "" || itemID == null) {
					setCookie("itemID",thisItem+"&",1);
				}
			}
		}
	}
	checkCookie();
	</script>

  </body>

</html>
