<%-- 
    Document   : cadastro
    Created on : 17 de out. de 2024, 16:39:24
    Author     : anaxi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Emocare</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #9BDD9A;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            display: flex;
            width: 90%;
            height: 80%;
            background-color: #f9f4ee;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .left-side {
            flex: 1 1 60%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #d1e7dd;
            margin-right: 40px;
        }

        .left-side img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .right-side {
            flex: 1 1 40%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .form-box {
            background-color: #f9f4ee;
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        .logo {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .logo img {
            height: 30px;
            margin-left: 10px;
        }

        .logo h1 {
            font-size: 24px;
            color: #7f3d3d;
            font-weight: bold;
        }

        h2 {
            color: #7f3d3d;
            margin-bottom: 10px;
        }

        hr {
            border: none;
            border-top: 1px solid #7f3d3d;
            margin-bottom: 20px;
            width: 90%;
            margin-left: auto;
            margin-right: auto;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            text-align: left;
            font-size: 14px;
            margin-bottom: 5px;
            color: #7f3d3d;
        }

        input {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            outline: none;
        }

        input:focus {
            border-color: #a569bd;
        }

        .btn {
            background-color: #7f3d3d;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 15px;
        }

        .btn:hover {
            background-color: #a569bd;
        }

        .login-link {
            color: #7f3d3d;
            font-size: 14px;
        }

        .login-link a {
            color: #a569bd;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-side">
            <img src="https://sciath.com.br/wp-content/uploads/2021/03/conversando.jpg" alt="Imagem Grande">
        </div>

        <div class="right-side">
            <div class="form-box">
                <div class="logo">
                    <h1>EMOCARE</h1>
                    <img src="imagens/Logo.png" alt="Emocare Logo">
                </div>
                <h2>Cadastro</h2>
                <hr>
                
                <!-- Exibe a mensagem de erro caso as senhas não coincidam -->
                <%
                    String erroSenha = (String) request.getAttribute("erroSenha");
                    if (erroSenha != null) {
                %>
                    <p style="color: red;"><%= erroSenha %></p>
                <% } %>
                
                <form action="${pageContext.request.contextPath}/CadastroServlet" method="post">
                    <label for="nome">Nome</label>
                    <input type="text" id="nome" name="nome" placeholder="Digite seu nome" required>

                    <label for="email">E-mail</label>
                    <input type="email" id="email" name="email" placeholder="Digite seu e-mail" required>

                    <label for="senha">Senha</label>
                    <input type="password" id="senha" name="senha" placeholder="Digite sua senha" required>

                    <label for="confirma-senha">Confirmar Senha</label>
                    <input type="password" id="confirma-senha" name="confirma-senha" placeholder="Confirme sua senha" required>

                    <button type="submit" class="btn">Criar conta</button>
                </form>
                <p class="login-link">Já tem uma conta? <a href="${pageContext.request.contextPath}/login.jsp">Login</a></p>
            </div>
        </div>
    </div>
</body>
</html>
