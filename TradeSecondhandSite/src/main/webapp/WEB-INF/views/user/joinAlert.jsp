<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
    var msg = "${msg}";
    alert(msg);
    location.href = "/login";
</script>

<%@ include file="../layout/footer.jsp" %>
