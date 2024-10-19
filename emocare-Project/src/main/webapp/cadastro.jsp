<%-- 
    Document   : cadastro
    Created on : 17 de out. de 2024, 16:39:24
    Author     : anaxi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html land="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Cadastro</title>
        <link rel="stylesheet" href="styles.css"/>
    </head>
    <body>
        <div class="container">
            <h2>Cadastro</h2>
            <form action="CadastroServlet" method="post">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" required>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>
                <button type="submit">Cadastrar</button>
                <button onclick="window.location.href='login.jsp'">Fazer login</button>
            </form>
        </div>  
    </body>
</html>
