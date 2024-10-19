<%-- 
    Document   : login
    Created on : 17 de out. de 2024, 16:50:09
    Author     : anaxi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="container">
            <h2>Login</h2>
            <form action="LoginServlet" method="post">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>
                <button type="submit">Login</button>
                 <button onclick="window.location.href='cadastro.jsp'">Criar conta</button>
            </form>
           
        </div>  
    </body>
</html>
