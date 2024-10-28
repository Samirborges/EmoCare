import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/telas_funcionarios/telas_gerente/CalendarioServlet") 
public class CalendarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dataDia = request.getParameter("data");
        String horario = request.getParameter("horario");
        String turno = request.getParameter("turno");
        System.out.println("Data: " + dataDia + ", Horário: " + horario + ", Turno: " + turno);

        Connection connection = null;
        PreparedStatement diaStmt = null;
        PreparedStatement horarioStmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbemocare", "root", "senha"); // Mudar senha para conectar no banco de dados

            // Inserir na tabela tbl_dias_consultas
            String insertDiaQuery = "INSERT INTO tbl_dias_consultas (data_dia) VALUES (?)";
            diaStmt = connection.prepareStatement(insertDiaQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            diaStmt.setString(1, dataDia);
            diaStmt.executeUpdate();
            ResultSet generatedKeys = diaStmt.getGeneratedKeys();

            if (generatedKeys.next()) {
                int diaId = generatedKeys.getInt(1);

                // Inserir na tabela tbl_horarios_disponiveis
                String insertHorarioQuery = "INSERT INTO tbl_horarios_disponiveis (id_dia, horario, turno) VALUES (?, ?, ?)";
                horarioStmt = connection.prepareStatement(insertHorarioQuery);
                horarioStmt.setInt(1, diaId);
                horarioStmt.setString(2, horario);
                horarioStmt.setString(3, turno);
                horarioStmt.executeUpdate();
            }
            response.sendRedirect("montarCalendario.jsp?success=true");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("montarCalendario.jsp?error=true");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("montarCalendario.jsp?error=true");
        } finally {
            try {
                if (horarioStmt != null) {
                    horarioStmt.close();
                }
                if (diaStmt != null) {
                    diaStmt.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CalendarioServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CalendarioServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
