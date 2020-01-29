<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<%@include file="/design/indexhead.jsp" %>
<body>
<form action="/member/regproc.do" method="post">
id<input type="text" name="id" id="nid" required="required" readonly="readonly" onclick="javascript:idcheck()"><input type="button" value="중복확인" onclick="javascript:idcheck()"><br/>
password<input type="password" name="password" required="required"><br/>
이름<input type="text" name="name" required="required"><br/>
email <input type="email" name="email" required="required"><br/>
phone<input type="text" name="phone" required="required"><br/>
생일<input type="date" name="birthday" required="required"><br/>
나이 <input type="text" name="age" required="required"><br/>
<input type="submit" class="btn btn-success btn-lg" value="전송" />

<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
</form>
 <!-- jQuery -->
    <script src="/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="/js/jqBootstrapValidation.js"></script>
    <script src="/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="/js/freelancer.min.js"></script>
</body>
<%@ include file="/design/footer.jsp" %>
</html>
