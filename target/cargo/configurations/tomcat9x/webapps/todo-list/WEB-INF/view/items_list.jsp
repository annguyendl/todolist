<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.annguyendl.util.Mapping" %>

<html>
<head>
    <title>Todo Items List</title>
</head>
<body>
    <div align="center">
        <c:url var="addItemUrl" value="${Mapping.ADD_ITEM}" />
        <a href="${addItemUrl}">New Item</a> | <a href="/">Home</a>
        <table border="1" cellpadding="5">
            <caption><h2>Todo Items List</h2></caption>
            <tr>
                <th>Action</th>
                <th>Title</th>
                <th>Deadline</th>
            </tr>
            <c:forEach var="item" items="${todoData.items}">
                <c:url var="deleteItemUrl" value="${Mapping.DELETE_ITEM}">
                    <c:param name="id" value="${item.id}" />
                </c:url>
                <c:url var="editItemUrl" value="${Mapping.ADD_ITEM}">
                    <c:param name="id" value="${item.id}" />
                </c:url>
                <c:url var="viewItemUrl" value="${Mapping.VIEW_ITEM}">
                    <c:param name="id" value="${item.id}" />
                </c:url>
                <tr>
                    <td>
                        <a href="${viewItemUrl}">View</a> |
                        <a href="${editItemUrl}">Edit</a> |
                        <a href="${deleteItemUrl}">Delete</a>
                    </td>
                    <td><c:out value="${item.title}" /></td>
                    <td><c:out value="${item.deadline}" /></td>
                </tr>
            </c:forEach>
        </table>
        <c:url var="homeUrl" value="/" />
        <a href="${addItemUrl}">New Item</a> | <a href="${homeUrl}">Home</a>
    </div>
</body>
</html>