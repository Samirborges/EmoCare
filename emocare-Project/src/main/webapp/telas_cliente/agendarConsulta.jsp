<%@page import="java.sql.SQLException"%>
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
    <title>Agendar Consulta</title>
</head>
<body>
    <h1>Agendar Consulta</h1>
    <div class="container">
        <form action="AgendarConsultaServlet" method="post">
            <label for="consulta">Escolha uma data e horário disponíveis:</label>
            <select id="consulta" name="consulta" required>
                <%
                    Connection connection = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbemocare", "root", "senha");

                        // Consulta para buscar dias e horários disponíveis
                        String query = "SELECT tbl_dias_consultas.id_dia, tbl_dias_consultas.data_dia, tbl_horarios_disponiveis.id_horario, tbl_horarios_disponiveis.horario, tbl_horarios_disponiveis.turno " +
                                       "FROM tbl_dias_consultas " +
                                       "INNER JOIN tbl_horarios_disponiveis ON tbl_dias_consultas.id_dia = tbl_horarios_disponiveis.id_dia " +
                                       "LEFT JOIN tbl_consultas_marcadas ON tbl_horarios_disponiveis.id_horario = tbl_consultas_marcadas.horario_agendado " +
                                       "WHERE tbl_consultas_marcadas.horario_agendado IS NULL";

                        stmt = connection.prepareStatement(query);
                        rs = stmt.executeQuery();

                        // Exibir as opções de dias e horários disponíveis
                        while (rs.next()) {
                            int idDia = rs.getInt("id_dia");
                            int idHorario = rs.getInt("id_horario");
                            String dataDia = rs.getString("data_dia");
                            String horario = rs.getString("horario");
                            String turno = rs.getString("turno");
                %>
                            <option value="<%=idDia%>-<%=idHorario%>">Dia: <%=dataDia%> | Horário: <%=horario%> | Turno: <%=turno%></option>
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
            </select>
            
            <button type="submit">Agendar</button>
        </form>
    </div>
</body>
</html>
