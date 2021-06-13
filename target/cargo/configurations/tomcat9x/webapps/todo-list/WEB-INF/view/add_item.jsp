<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.annguyendl.util.Mapping" %>
<%@ page import="com.annguyendl.util.AttributeNames" %>
<html>
<head>
    <title>Add/Edit Item</title>
</head>
<body>
    <div align="center">
        <form:form method="POST" modelAttribute="${AttributeNames.TODO_ITEM}">
            <table border="0" cellpadding="5">
                <caption><h2>Add/Edit Item</h2></caption>
                <tr>
                    <td><label>ID</label></td>
                    <td><form:input path="id" disable="true" /></td>
                </tr>
                <tr>
                    <td><label>Title</label></td>
                    <td><form:input path="title"/></td>
                </tr>
                <tr>
                    <td><label>Deadline</label></td>
                    <td><form:input path="deadline"/></td>
                </tr>
                <tr>
                    <td><label>Details</label></td>
                    <td><form:textarea path="details"/></td>
                </tr>
                <tr>
                    <td><br/></td>
                    <td><c:url var="tableUrl" value="${Mapping.ITEMS}" />
                        <input type="submit" value="Submit" /> |
                        <a href="${tableUrl}">Back</a>
                    </td>
                </tr>
            </table>
        </form:form>
    </div>
</body>
</html>