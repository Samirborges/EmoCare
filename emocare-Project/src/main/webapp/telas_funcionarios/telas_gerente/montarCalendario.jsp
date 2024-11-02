<%-- 
    Document   : diasDisponiveis
    Created on : 20 de out. de 2024, 09:19:46
    Author     : Samir & Guylherme Lyra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calenário do terapeuta</title>
        <link rel="stylesheet" href="../../styles/style_c.css">
    </head>
    <body>
        <div class="exterior">
            <a href="../home_gerente.jsp"><button class="voltar">←</button></a>
            <h1>Montar Calendário</h1>
        </div>
        <div class="container">
            <form action="CalendarioServlet" method="post">
                
                <div class="grupo-botoes">
                    <div class="icone-botao">
                        <span>📅</span>
                        <input type="date" id="data" name="data" placeholder="dd/mm/aaaa" required>
                    </div>
                    <div class="icone-botao">
                        <span>🕒</span>
                        <input type="time" id="horario" name="horario" placeholder="--:--" required>
                    </div>
                    <div class="icone-botao">
                        <span>🌞/🌜</span>
                        <select class="turno" name="turno" required>
                            <option value="manhã">Manhã</option>
                            <option value="tarde">Tarde</option>
                            <option value="noite">Noite</option>
                        </select>
                    </div>
                    <button type="submit" class="botao-adicionar">Adicionar</button>
                </div>
                <!--
                <label for="data">Data:</label> 
                <input type="date" id="data" name="data" required>
                
                <label for="horario">Selecione o Horário:</label>
                <input type="time" id="horario" name="horario" required>
                
                <label for="turno">Turno:</label>
                <select id="turno" name="turno" required>
                    <option value="manhã">Manhã</option>
                    <option value="tarde">Tarde</option>
                    <option value="noite">Noite</option>
                </select>
                
                <button type="submit">Adicionar Consulta</button>
                -->
            </form>
        </div>
    </body>
</html>
