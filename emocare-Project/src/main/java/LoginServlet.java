/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author anaxi
 */
@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        
            try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbemocare", "root", "senha"); // Mudar a senha para fazer conexão ao mysql
                    PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM tbl_usuarios WHERE email = ? AND senha = ?")){
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, senha);
                ResultSet resultSet = preparedStatement.executeQuery();

                /*if(resultSet.next()){
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", resultSet.getString("nome"));
                    System.out.println("Login feito com sucesso!");
                    response.sendRedirect("home.jsp");
                }else{
                    response.sendRedirect("login.jsp?error=true");
                }*/

                if(resultSet.next()){
                    int userId = resultSet.getInt("id_usuario");
                    String userName = resultSet.getString("nome");

                    // Verificar a especialidade do usuário na tbl_funcionarios
                    PreparedStatement funcStmt = connection.prepareStatement("SELECT especialidade FROM tbl_funcionarios WHERE id_funcionario = ?");
                    funcStmt.setInt(1, userId);
                    ResultSet funcResultSet = funcStmt.executeQuery();

                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", userName);

                    if(funcResultSet.next()){
                        String especialidade = funcResultSet.getString("especialidade");
                        if("gerente".equalsIgnoreCase(especialidade)){
                            response.sendRedirect("telas_funcionarios/home_gerente.jsp");
                        } else if ("terapeuta".equalsIgnoreCase(especialidade)){
                            response.sendRedirect("telas_funcionarios/home_terapeuta.jsp");
                        }
                    } else{
                        response.sendRedirect("home.jsp");
                    }
                } else{
                    response.sendRedirect("login.jsp?error=true");
                }
        }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true"); // Alteração de cadastro
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true"); // Alteração de cadastro
        }
        
    }
    
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
