<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="irisdosreis.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Benutzerverwaltung</title>
</head>
<body>
    <h1>Benutzerliste</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Benutzername</th>
            <th>Aktionen</th>
        </tr>
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            for (User user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getUsername() %></td>
            <td>

                <form action="edit_user.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <input type="submit" value="Bearbeiten">
                </form>

                <form action="users" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <input type="submit" value="Löschen" onclick="return confirm('Sind Sie sicher, dass Sie diesen Benutzer löschen möchten?');">
                </form>

            </td>
        </tr>
        <% } %>
    </table>

    <h2>Neuen Benutzer hinzufügen</h2>
    <form action="users" method="post">
        <input type="hidden" name="action" value="add">
        <label>Benutzername: <input type="text" name="username"></label><br>
        <label>Passwort: <input type="password" name="password"></label><br>
        <input type="submit" value="Hinzufügen">
    </form>
</body>
</html>
