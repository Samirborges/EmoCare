<%-- 
    Document   : consultasTerapeuta
    Created on : 24 de out. de 2024, 10:35:15
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultas do terapeuta</title>
    </head>
    <body>
        <h1>Escolher Consulta</h1>
    <form action="ConsultasTerapeutaServlet" method="post">
        <table border="1">
            <tr>
                <th>Selecionar</th>
                <th>Nome do Cliente</th>
                <th>Dia da Consulta</th>
                <th>Horário da Consulta</th>
                <th>Tipo de Tratamento</th>
            </tr>
            <%
                Connection connection = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbemocare", "root", "@Sa111419");

                    // Buscar as consultas marcadas
                    String query = "SELECT tbl_consultas_marcadas.id_consultas_marcadas, tbl_usuarios.nome AS cliente, tbl_dias_consultas.data_dia, " +
                                   "tbl_horarios_disponiveis.horario, tbl_consultas_marcadas.tipo_tratamento " +
                                   "FROM tbl_consultas_marcadas " +
                                   "INNER JOIN tbl_dias_consultas ON tbl_consultas_marcadas.id_dia_consulta = tbl_dias_consultas.id_dia " +
                                   "INNER JOIN tbl_horarios_disponiveis ON tbl_consultas_marcadas.horario_agendado = tbl_horarios_disponiveis.id_horario " +
                                   "INNER JOIN tbl_usuarios ON tbl_consultas_marcadas.id_paciente = tbl_usuarios.id_usuario " +
                                   "WHERE tbl_consultas_marcadas.id_consultas_marcadas NOT IN (SELECT id_dia_consulta FROM tbl_consultas_terapeuta)"; // Apenas consultas ainda não atendidas

                    stmt = connection.prepareStatement(query);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        int idConsultaMarcada = rs.getInt("id_consultas_marcadas");
                        String cliente = rs.getString("cliente");
                        Date dataConsulta = rs.getDate("data_dia");
                        Time horario = rs.getTime("horario");
                        String tipoTratamento = rs.getString("tipo_tratamento");
            %>
            <tr>
                <td><input type="radio" name="consulta" value="<%=idConsultaMarcada%>" required></td>
                <td><%= cliente %></td>
                <td><%= dataConsulta %></td>
                <td><%= horario %></td>
                <td><%= tipoTratamento %></td>
            </tr>
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
        </table>
        <button type="submit">Escolher Consulta</button>
    </form>
    </body>
</html>
