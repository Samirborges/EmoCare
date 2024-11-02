<%-- 
    Document   : adicionarFuncionario
    Created on : 24 de out. de 2024, 08:06:36
    Author     : Samir & Guylherme Lyra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar Funcionário</title>
        <link rel="stylesheet" href="../../styles/style_f.css">
    </head>
    <body>
        
        <div class="exterior">
            <a href="../home_gerente.jsp"><button class="voltar">←</button></a>
            <h1>Adicionar Funcionário</h1>
        </div>
        
        <div class="container">
            <form action="AdicionarFuncionarioServlet" method="post">
                <div class="grupo-botoes">
                    <div class="icone-botao">
                        <span>📧</span>
                        <input type="email" id="email" name="email" placeholder="email" required>
                    </div>
                    <div class="icone-botao">
                        <span>👨‍💼/👨‍💻</span>
                        <select id="especialidade" name="especialidade" class="espe-botao" required>
                            <option value="" disabled selected>Escolha a Especialidade:</option>
                            <option value="gerente">Gerente</option>
                            <option value="terapeuta">Terapeuta</option>
                        </select>
                    </div>
                    <button type="submit" class="botao-adicionar">Adicionar Funcionário</button>
                </div>
            </form>
        </div>
    </body>
</html>
