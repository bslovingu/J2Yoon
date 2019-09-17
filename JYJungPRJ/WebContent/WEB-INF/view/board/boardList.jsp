<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script src="//code.jqeury.com/jquery-3.2.1.min.js"></script>
<script src="/js.bootstrap.js"></script>
</head>
<body>
	<div style="width: 800px; margin-left: 5%; margin-top: 5%">
		<div style="text-align: center; font-size: 2em">게시판</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th width="100px">글번호</th>
					<th width="500px">글제목</th>
					<th width="200px">날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>asad</td>
					<td>today</td>
				</tr>
				<tr>
					<td>1</td>
					<td>asad</td>
					<td>today</td>
				</tr>
				<tr>
					<td>1</td>
					<td>asad</td>
					<td>today</td>
				</tr>
			</tbody>
		</table>
		<hr/>
		<a class="btn btn-primary" href="/board/boardReg.do" role="button">글작성</a>
	</div>
</body>
</html>