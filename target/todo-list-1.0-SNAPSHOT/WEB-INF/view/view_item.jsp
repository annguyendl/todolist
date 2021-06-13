<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.annguyendl.util.Mapping" %>
<html>
<head>
    <title>View Item</title>
</head>
<body>
    <div align="center">
        <table border="0" cellpadding="5">
            <caption><h2>Todo Item Detail</h2></caption>
            <tr>
                <td><label>ID</label></td>
                <td><c:out value="${todoItem.id}"/></td>
            </tr>
            <tr>
                <td><label>Title</label></td>
                <td><c:out value="${todoItem.title}"/></td>
            </tr>
            <tr>
                <td><label>Deadline</label></td>
                <td><c:out value="${todoItem.deadline}" /></td>
            </tr>
            <tr>
                <td><label>Details</label></td>
                <td><c:out value="${todoItem.details}" /></td>
            </tr>
            <tr>
                <td><br/></td>
                <td><c:url var="deleteItemUrl" value="${Mapping.DELETE_ITEM}">
                        <c:param name="id" value="${todoItem.id}" />
                    </c:url>
                    <c:url var="editItemUrl" value="${Mapping.ADD_ITEM}">
                        <c:param name="id" value="${todoItem.id}" />
                    </c:url>
                    <c:url var="tableUrl" value="${Mapping.ITEMS}" />
                    <a href="${tableUrl}">Back</a> |
                    <a href="${editItemUrl}">Edit</a> |
                    <a href="${deleteItemUrl}">Delete</a>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>