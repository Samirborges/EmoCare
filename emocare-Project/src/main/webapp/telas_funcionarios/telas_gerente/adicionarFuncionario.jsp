<%-- 
    Document   : adicionarFuncionario
    Created on : 24 de out. de 2024, 08:06:36
    Author     : anaxi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar Funcionário</title>
    </head>
    <body>
        <h1>Adiciona funcionário</h1>
        <div class="container">
            <form action="AdicionarFuncionarioServlet" method="post">
                <label for="email">E-mail do Funcionario:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="especialidade">Escolha a Especialidade</label>
                <select id="especialidade" name="especialidade" required>
                    <option value="gerente">Gerente</option>
                    <option value="terapeuta">Teraputa</option>
                </select>
                
                <button type="submit">Adicionar Funcionário</button>
            </form>
        </div>
    </body>
</html>
