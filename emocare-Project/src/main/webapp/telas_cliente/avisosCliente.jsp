<%-- 
    Document   : avisosCliente
    Created on : 26 de out. de 2024, 11:10:48
    Author     : anaxi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avisos</title>
        <link rel="stylesheet" href="stylesAvisos.css">
    </head>
    <body>
        <div class="container">
        <a href="${pageContext.request.contextPath}/home.jsp"><button class="voltar">←</button></a>
        <h1>Avisos</h1>
        <button class="duvidas">
            <img src="../imagens/img_w1.png" alt="WhatsApp" class="whatsapp-icon"/>
        </button>
        <div class="aviso">
            <div class="texto">
                <p class="remetente">EmoCare</p>
                <p class="previa">Parabéns, sua consulta foi agendada com sucesso!</p>
            </div>
            <button class="botao">Ver mais</button>
        </div>
        <div class="aviso">
            <div class="texto">
                <p class="remetente">EmoCare</p>
                <p class="previa">Parabéns, sua consulta foi agendada com sucesso!</p>
            </div>
            <button class="botao">Ver mais</button>
        </div>
        <div class="aviso">
            <div class="texto">
                <p class="remetente">EmoCare</p>
                <p class="previa">Parabéns, sua consulta foi agendada com sucesso!</p>
            </div>
            <button class="botao">Ver mais</button>
        </div>
    </div>
    </body>
</html>
