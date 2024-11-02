<%-- 
    Document   : home_terapeuta
    Created on : 19 de out. de 2024, 09:19:22
    Author     : Samir & Guylherme Lyra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Terapeura</title>
        <link rel="stylesheet" href="../styles/style_t.css">
    </head>
    <body>
        
        <div class="exterior">
            <a href="../login.jsp" aria-label="Voltar para a página anterior">
              <button class="voltar">←</button>
            </a>
        </div>

        <div class="container">
            <header class="header">
              <h1>Bem-vindo(a), Terapeuta!</h1>
              <p>Data atual: <span id="data-atual"></span></p>
            </header>

            <main class="main-content">
              <h2>Escolha uma Opção</h2>
              <div class="container-botoes">
                <a onclick="window.location.href='tela_terapeuta/consultasParaTerapeuta.jsp'" class="botao">Histôrico de Consulta</a>
                <a onclick="window.location.href='tela_terapeuta/consultasTerapeuta.jsp'" class="botao">Escolha de Consulta</a>
              </div>
            </main>
        </div>
  <script>
    document.getElementById("data-atual").textContent = new Date().toLocaleDateString('pt-BR');
  </script>
        
        <!--
        <button onclick="window.location.href='tela_terapeuta/consultasTerapeuta.jsp'">Alocar consulta</button> <br>
        <button onclick="window.location.href='tela_terapeuta/consultasParaTerapeuta.jsp'">Suas consultas</button> 
        -->
    </body>
</html>
