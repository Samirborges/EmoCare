<%-- 
    Document   : home
    Created on : 18 de out. de 2024, 10:45:22
    Author     : Samir & Davi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EmoCare - Menu</title>
    <style>
        @font-face {
            font-family: 'Canvas';
            src: url('Canvas.otf') format('truetype');
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #F7F3EA;
            text-align: center;
        }
        .menu-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 40px;
            margin-top: 50px;
        }
        .card {
            width: 300px;
            height: 350px;
            padding: 20px;
            border-radius: 15px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            text-decoration: none;
        }
        .card:hover {
            transform: scale(1.05);
            transition: transform 0.2s ease;
        }
        .card h2 {
            font-size: 1.7em;
            margin-bottom: 15px;
            color: #5E2C1C;
        }
        .card img {
            width: 80px;
            height: 80px;
            margin-bottom: 15px;
        }
        .consultas-marcadas img {
            width: 120px;
            height: 120px;
        }
        .duvidas img {
            width: 150px;
            height: 120px;
        }
        .avisos img {
            width: 100px;
            height: 100px;
        }
        .card p {
            font-size: 1.1em;
            color: #333;
        }
        .realizar-agendamento {
            background-color: #CDE6E8;
        }
        .duvidas {
            background-color: #9BDD9A;
        }
        .consultas-marcadas {
            background-color: #E9D1F1;
        }
        .avisos {
            background-color: #6A3A29;
            color: #ffffff;
        }
        .avisos h2, .avisos p {
            color: #ffffff;
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
            position: absolute;
            top: 10px;
            left: 10px;
        }
        .user-info div {
            text-align: left;
        }
        .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }
        .user-info p {
            margin: 0;
            color: #333;
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-bottom: 60px;
        }
        .header img {
            width: 100px;
        }
        .header h2 {
            font-size: 1.5em;
            margin: 0;
            color: #5E2C1C;
        }
       
        .menu-title {
            font-family: 'Canvas', sans-serif;
            font-size: 4em;
            color: #5E2C1C;
            margin-top: 50px;
        }
        .header {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .header img {
            margin-right: 10px;
        }
    </style>
</head>
<body>

    <% 
        String nomeUsuario = (String) session.getAttribute("usuario"); //chamando o nome do usuario
        String emailUsuario = (String) session.getAttribute("email"); //chamando o email do usuario
    %>
    
    <div class="user-info">
        <a href="${pageContext.request.contextPath}/perfil.jsp">
            <img src="imagens/IconeUsuario.webp" alt="Avatar do usuário">
        </a>
        <div>
            <p><strong><%= nomeUsuario %></strong></p>
            <p><%= emailUsuario %></p>
        </div>
    </div>

    <div class="header">
        <img src="imagens/Logo.png" alt="Logo EmoCare">
        <h2>EmoCare</h2>
    </div>

    <h1 class="menu-title">Menu</h1>

    <div class="menu-container">
        <!-- Link para a página de agendamento -->
        <a href="${pageContext.request.contextPath}/telas_cliente/agendarConsulta.jsp" class="card realizar-agendamento">
            <img src="imagens/Calendario.webp" alt="Ícone de Calendário">
            <h2>Realizar Agendamento</h2>
            <p>Agende suas sessões. Aqui você poderá escolher o dia de sua consulta e o que deseja tratar.</p>
        </a>

        <!-- Link para a página de dúvidas -->
        <a href="${pageContext.request.contextPath}/telas_cliente/duvidasCliente.jsp" class="card duvidas">
            <img src="imagens/Duvida.png" alt="Ícone de Dúvidas">
            <h2>Dúvidas</h2>
            <p>Venha tirar suas dúvidas sobre a terapia, sua mensagem será atendida por um profissional.</p>
        </a>

        <!-- Link para a página de consultas marcadas -->
        <a href="${pageContext.request.contextPath}/telas_cliente/historicoCliente.jsp" class="card consultas-marcadas">
            <img src="imagens/CRelogio.png" alt="Ícone de Consultas">
            <h2>Consultas Marcadas</h2>
            <p>Visualize suas consultas marcadas.</p>
        </a>

        <!-- Link para a página de avisos -->
        <a href="${pageContext.request.contextPath}/telas_cliente/avisosCliente.jsp" class="card avisos">
            <img src="imagens/Autofalante.png" alt="Ícone de Avisos">
            <h2>Avisos</h2>
            <p>Esteja atento(a) a todas as novidades do EmoCare. Todas as notificações da terapia e novidades estão aqui.</p>
        </a>
    </div>

</body>
</html>
