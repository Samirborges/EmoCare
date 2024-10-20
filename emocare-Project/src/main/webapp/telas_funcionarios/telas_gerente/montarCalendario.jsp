<%-- 
    Document   : diasDisponiveis
    Created on : 20 de out. de 2024, 09:19:46
    Author     : anaxi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calenário do terapeuta</title>
    </head>
    <body>
        <h1>Faça o calendário do terapeuta</h1>
        <div class="container">
            <h2>Montar Calendário</h2>
            <form action="CalendarioServlet" method="post">
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
            </form>
        </div>
    </body>
</html>
