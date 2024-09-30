<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="irisdosreis.model.User" %>
<%@ page import="irisdosreis.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Benutzer bearbeiten</title>
</head>
<body>
    <%
        Long userId = Long.parseLong(request.getParameter("id"));
        Session hibernateSession = HibernateUtil.getSessionFactory().openSession();
        User user = hibernateSession.get(User.class, userId);
        hibernateSession.close();
    %>
    <h1>Benutzer bearbeiten</h1>
    <form action="users" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= user.getId() %>">
        <label>Benutzername: <input type="text" name="username" value="<%= user.getUsername() %>"></label><br>
        <label>Passwort: <input type="password" name="password"></label><br>
        <small>Leer lassen, um das Passwort nicht zu ändern.</small><br>
        <input type="submit" value="Aktualisieren">
    </form>
    <a href="users">Zurück zur Benutzerliste</a>
</body>
</html>
