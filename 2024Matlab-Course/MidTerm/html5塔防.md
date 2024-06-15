---
title: html5塔防
categories: 其他
tags: 游戏
abbrlink: eeb9
date: 2024-06-10 22:21:46
---
<html>
	<body id="tower-defense">
	<div id="wrapper">
		<div id="td-wrapper">
			<h1>HTML5 塔防游戏</h1>
			<div id="td-loading">加载中...</div>
			<div id="td-board">
				<canvas id="td-canvas">抱歉，您的浏览器不支持 HTML 5 Canvas 标签，请使用 IE9 / Chrome / Opera 等浏览器浏览本页以获得最佳效果。</canvas>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="td-pkg-zh-min.js?_t=1293962401.7"></script>
	<script type="text/javascript">
		window.onload = function () {
			_TD.init("td-board", true);
			document.getElementById("td-loading").style.display = "none";
			document.getElementById("td-board").style.display = "block";
		};
	</script>
	</body>
</html>