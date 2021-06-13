<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.annguyendl.util.Mapping" %>
<html>
<head>
    <title>Todo Item Application</title>
</head>
<body>
    <div align="center">
        <h1>Todo Application</h1>
        <c:url var="itemsLink" value="${Mapping.ITEMS}" />
        <a href="${itemsLink}">Show Todo Items List</a>
    </div>
</body>
</html>