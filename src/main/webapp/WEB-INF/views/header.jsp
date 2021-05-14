<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>

.div {
	box-sizing: border-box;
}

.main_gnb .sub{
	height: 129px;
}

.main_gnb{
	position: relative;
	z-index: 103;
}

.main_gnb #gnbMain {
	position: static;
	width: 100%;
	margin: 0;
}

#gnbMain {
	display: flex;
	align-items: center;
	justify-content: center;
}


.main_gnb .top_menu{
	position:relative;
	height: 105px;
	box-shadow: 0px 0px 6pxp 0px rgb(41 42 42 / 15%);
	}
	
	
.main_gnb .search{
	position: relative;
	float: left;
	margin: 22px 0 0 33px;
	width: 420px;
}


..main_gnb .search input{

	
}

.input {
	font: 13px/1.4 NotoSansKR, NotoSansJP, "돋움", Dotum, AppleGothic, sans-serif;
	color: #666;
	-webkit-text-size-adjust:none;
	-webkit-writing-mode: horizontal-tb !important;
	text-rendering: auto;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
/* 	display: inline-block; */
	text-align: start;
	appearance: auto;
	
	-webkit-rtl-ordering: logical;
	cursor: text;

}



.span{
	maring: 0;
	padding: 0;
}

</style> 




<body>


	<header id="common_header" class="main_gnb sub">
	
		<div id="gnbMain">	
			<img src="../resources/imges/common/logo_spring.png">
			<div class = "search">
				<span>
					<form accept-charset="UTF-8" action="tourView" method="POST">
						<input type="text" placeholder="지금은 잠시 멈춰야 할 때! 랜선으로 즐겨봐요" title="검색" id="inp_search" name="word" 
						style="
						height:45px;
						padding: 0 50px 0 20px;
						line-height: 45px;
						border: 0;
						width: 100%;
						font-size:16px;
						box-sizing:border-box;
						background: #eef0f2;
						outline: none;
						border-radius: 10px;"><input type="submit" value="검색">
						
					</form>
				</span>
			</div>
		</div>
	</header>
</body>