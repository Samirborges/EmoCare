<%-- 
    Document   : login
    Created on : 17 de out. de 2024, 16:50:09
    Author     : Samir & Guylherme Lyra
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
        <div class="login-container">
            <div class="login-box">
                <div class="logo">
                    <img src="imagens/Logo.png" alt="Logo EmoCare"/>
                    <h1><strong>EmoCare</strong></h1>
                    <h2>Login</h2>
                    <hr>
                </div>
                <form action="LoginServlet" method="post" style="margin-top: 20px;">
                    <div class="login-email">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="login-senha">
                        <label for="senha">Senha:</label>
                        <input type="password" id="senha" name="senha" required>
                    </div>
                    <a href="#" class="login-esqueci"><strong><u>Esqueci a senha</u></strong></a>
                    <div class="button-nova">
                        <button type="submit" class="login-btn">Login</button>
                        <button onclick="window.location.href='cadastro.jsp'" class="registre-btn">Criar conta</button>        
                    </div>
                </form>
            </div>
        </div>  
        <div class="imagem-container"></div>
    </body>
</html>
