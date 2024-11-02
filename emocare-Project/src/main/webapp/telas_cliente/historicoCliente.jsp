<%-- 
    Document   : historicoCliente
    Created on : 24 de out. de 2024, 15:06:20
    Author     : anaxi
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Histórico de Consultas</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <a href="${pageContext.request.contextPath}/home.jsp"><button class="voltar">←</button></a>
        <h1>Consultas</h1>
        <h2>Marcadas</h2>
        <button class="duvidas">?</button>

        <%
            int idPaciente = (int) session.getAttribute("id_paciente"); // Obtém o ID do cliente logado
            Connection connection = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbemocare", "root", "@Sa111419"); // Colocar senha do mysql

                // Consulta para buscar o histórico de consultas do cliente
                String query = "SELECT tbl_dias_consultas.data_dia, tbl_horarios_disponiveis.horario, tbl_consultas_marcadas.tipo_tratamento, " +
                               "tbl_funcionarios.nome AS terapeuta " +
                               "FROM tbl_consultas_marcadas " +
                               "INNER JOIN tbl_dias_consultas ON tbl_consultas_marcadas.id_dia_consulta = tbl_dias_consultas.id_dia " +
                               "INNER JOIN tbl_horarios_disponiveis ON tbl_consultas_marcadas.horario_agendado = tbl_horarios_disponiveis.id_horario " +
                               "LEFT JOIN tbl_consultas_terapeuta ON tbl_consultas_marcadas.id_consultas_marcadas = tbl_consultas_terapeuta.id_dia_consulta " +
                               "LEFT JOIN tbl_funcionarios ON tbl_consultas_terapeuta.id_terapeuta = tbl_funcionarios.id_funcionario " +
                               "WHERE tbl_consultas_marcadas.id_paciente = ?";

                stmt = connection.prepareStatement(query);
                stmt.setInt(1, idPaciente);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    Date dataConsulta = rs.getDate("data_dia");
                    Time horario = rs.getTime("horario");
                    String tipoTratamento = rs.getString("tipo_tratamento");
                    String terapeuta = rs.getString("terapeuta");

                    if (terapeuta == null) terapeuta = "Não atribuído";
        %>
        
        <div class="aviso">
            <div class="texto">
                <p class="horario">Dia <%= dataConsulta %> horário <%= horario %></p>
                <p class="tratamento">Tipo de tratamento: <%= tipoTratamento %></p> <br> 
                <p class="terapeuta">Terapeuta: <%= terapeuta %></p>
            </div>
            <button class="botao">Ver mais</button>
        </div>

        <%
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
            }
        %>
    </div>
</body>
</html>
