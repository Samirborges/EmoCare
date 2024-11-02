<%-- 
    Document   : home_gerente
    Created on : 19 de out. de 2024, 09:18:33
    Author     : anaxi & Guylherme Lyra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="../styles/style_g.css">
    </head>
    <body>
        <div class="exterior">
            <a href="../login.jsp" aria-label="Voltar para a página anterior">
              <button class="voltar">←</button>
            </a>
        </div>
        
        <div class="container">
            <header class="header">
              <h1>Bem-vindo(a), Gerente!</h1>
              <p>Data atual: <span id="data-atual"></span></p>
            </header>

            <main class="main-content">
              <h2>Escolha uma Opção</h2>
              <div class="container-botoes">
                <a onclick="window.location.href='telas_gerente/montarCalendario.jsp'" class="botao">Montar Calendário</a>
                <a onclick="window.location.href='telas_gerente/adicionarFuncionario.jsp'" class="botao">Adicionar Funcionário</a>
              </div>
            </main>
        </div>
        
        <!--
        <button onclick="window.location.href='telas_gerente/montarCalendario.jsp'">Montar calendário</button> <br>
        <button onclick="window.location.href='telas_gerente/adicionarFuncionario.jsp'">Adicionar funcionário</button>
        -->
        
        <script>
            document.getElementById("data-atual").textContent = new Date().toLocaleDateString('pt-BR');
        </script>
    </body>
</html>
