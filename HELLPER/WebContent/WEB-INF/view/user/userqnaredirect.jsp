<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<%
	String qnaup = (String)request.getAttribute("qnaup");
	String qnadelete = (String)request.getAttribute("qnadelete");	
	String qnaupdate = (String) request.getAttribute("qnaupdate");
	
	if(qnaup != null && qnaup.equals("success")){
%>
		<script type="text/javascript">
			alert("글이 등록 되었습니다.");
			location.href="/userqna/userqnalist.do";
		</script>
<%
	}else if(qnaup != null && qnaup.equals("fail")){
%>
				<script type="text/javascript">
			alert("글이 등록이 실패 했습니다.");
			history.back(-1);
		</script>
<%
	}
	
	if(qnadelete != null && qnadelete.equals("success")){
%>
		<script type="text/javascript">
			alert("글이 삭제 되었습니다.");
			location.href="/userqna/userqnalist.do";
		</script>
<%
	}else if(qnadelete != null && qnadelete.equals("fail")){
%>
		<script type="text/javascript">
			alert("글삭제를 실패 했습니다.");
			history.back(-1);
		</script>
<%
	}
	
	if(qnaupdate != null && qnaupdate.equals("success")){
%>
		<script type="text/javascript">
			alert("글이 수정에 성공했습니다.");
			location.href="/userqna/userqnalist.do";
		</script>

<%
	}else if(qnaupdate != null && qnaupdate.equals("fail")){
%>

		<script type="text/javascript">
			alert("글수정에 실패했습니다.");
			history.back(-1);
		</script>
<%
	}
%>
</html>