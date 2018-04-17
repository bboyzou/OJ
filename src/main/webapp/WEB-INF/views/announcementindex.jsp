<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html ng-app="onlineJudgeApp">

<head>
<meta charset="UTF-8">
<title>在线评测系统</title>
<link rel="stylesheet" href="static/css/templatemo_misc.css">
<link type="text/css" rel="stylesheet"
	href="static/css/easy-responsive-tabs.css" />
<link href="static/css/templatemo_style.css" rel="stylesheet">
<style>
.templatemo_link {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

p {
	color: white;
}

div {
	word-break: break-all;
}

#announcementTitle {
	color: white;
}

.hand {
	cursor: pointer;
}
</style>
</head>
<body>
<div ng-controller="announcementCtr">
	<!-- logo start -->
	<div class="logocontainer">
		<div class="row">
			<h1>公告主页</h1>
			<div class="clear"></div>
			<br />
		</div>
	</div>
	<!-- logo end -->
	<div id="menu-container" class="main_menu">
		<!-- homepage start -->
		<div class="content homepage" id="menu-1">
			<div class="container">
				<div ng-repeat="announcement in page.datas"
					class="col-md-3 col-sm-6 templatemo_leftgap">
					<div class="templatemo_mainservice templatemo_botgap"
						ng-if="$index % 2 == 0">
						<div class="templatemo_link hand" ng-click="showDetail($index)">
							{{announcement.announcementTitle}}</div>
						<p>发布时间：{{announcement.announcementPublishTime |
							stringDateFormat:'yyyy-MM-dd HH:mm:ss'}}</p>
					</div>
					<div class="templatemo_mainimg" ng-if="$index % 2 == 0">
						<img
							src="{{announcement.announcementPublishTime| imageRandom:250:300:$index}}"
							alt="home img 01">
					</div>
					<div ng-if="$index % 2 != 0"
						class="templatemo_mainimg templatemo_botgap templatemo_portfotopgap">
						<img
							src="{{announcement.announcementPublishTime| imageRandom:250:300:$index}}"
							alt="home img 02">
					</div>
					<div class="templatemo_mainportfolio" ng-if="$index % 2 != 0">
						<div class="templatemo_link hand" ng-click="showDetail($index)">
							{{announcement.announcementTitle}}</div>
						<p>发布时间：{{announcement.announcementPublishTime |
							stringDateFormat:'yyyy-MM-dd HH:mm:ss'}}</p>
					</div>
				</div>
			</div>
			<ul class="pager">
				<li><a href="javascript:;" ng-if="isCanPre"
					ng-click="changePage(false)">&laquo;上一页</a></li>
				<li class="active"><span>页码：{{page.currentPage}}/{{page.totalPage}}
						&nbsp; &nbsp;总条数：<span class="badge">{{page.totalCount}}</span>
				</span></li>
				<li><a href="javascript:;" ng-if="isCanNext"
					ng-click="changePage(true)">下一页&raquo;</a></li>
			</ul>
		</div>
		<!-- homepage end -->
		<!--detail start -->
		<div class="content detail" id="menu-2">
			<div class="container">
				<div class="row templatemo_bordergapborder">
					<div class="col-md-3 col-sm-12 templatemo_leftgap">
						<div class="templatemo_frame" style="height: 320px; margin: 0;">
							<h2 style="color: white;">简介</h2>
							<div class="clear"></div>
							<p style="color: white;">
								{{currentDetailObj.announcementIntroduction}}</p>
						</div>
						<div class="templatemo_mainservice templatemo_botgap"
							ng-click="goBack()">
							<div class="templatemo_linkservice hand">返回</div>
						</div>
					</div>

					<div class="col-md-9 col-sm-12 templatemo_leftgap">
						<div>
							<div>
								<h2 id="announcementTitle">标题：{{currentDetailObj.announcementTitle}}</h2>
								<div class="clear"></div>
								内容：<br />
								<p id="announcementContent">
									{{currentDetailObj.announcementContent| formatToHtml :
									"announcementContent"}}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- logo end -->
<div load-Script ng-src="static/js/jquery.lightbox.js"></div>
<div load-Script ng-src="static/js/easyResponsiveTabs.js"></div>
</body>

</html>
