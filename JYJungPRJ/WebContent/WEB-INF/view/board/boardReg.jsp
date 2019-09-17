<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="/board/boardRegProc.do">
		<table border="1">
			<col width="100px">
			<col width="500px">
			<tr>
				<td align="center">제목</td>
				<td><input type="text" name="title" maxlength="100"
					style="width: 450px" /></td>
			</tr>

			<tr>
				<td colspan="2"><textarea name="contents"
						style="width: 550px; height: 400px"></textarea></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="submit" value="등록" />
				</td>
			</tr>

		</table>
	</form>
</body>
</html>