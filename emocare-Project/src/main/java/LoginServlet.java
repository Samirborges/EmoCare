/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

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
    
    //Transforma a senha em seu hash
    public static String hashSenha(String input) {
        try {
            // Escolhendo o algoritmo SHA-256
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // Cria o hash em bytes e converte para hexadecimal
            byte[] hashBytes = digest.digest(input.getBytes());
            StringBuilder hexString = new StringBuilder();

            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Algoritmo de hash não encontrado.", e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String email = request.getParameter("email");
        String senha = hashSenha(request.getParameter("senha"));
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbemocare", "root", "senha"); // Mudar senha para conectar no banco de dados
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM tbl_usuarios WHERE email = ? AND senha = ?")){
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, senha);
                ResultSet resultSet = preparedStatement.executeQuery();

                if(resultSet.next()){
                    int userId = resultSet.getInt("id_usuario");
                    String userName = resultSet.getString("nome");
                    String userEmail = resultSet.getString("email"); // Recupera o email do usuário
                    
                    // Inicia a sessão e definir atributos
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", userName);
                    session.setAttribute("email", userEmail); // Armazena o email do usuário na sessão
                    session.setAttribute("id_paciente", userId);
                    
                    // Verificar a especialidade do usuário na tbl_funcionarios
                    PreparedStatement funcStmt = connection.prepareStatement("SELECT especialidade FROM tbl_funcionarios WHERE id_funcionario = ?");
                    funcStmt.setInt(1, userId);
                    ResultSet funcResultSet = funcStmt.executeQuery();

                    if(funcResultSet.next()){
                        String especialidade = funcResultSet.getString("especialidade");
                        if("gerente".equalsIgnoreCase(especialidade)){
                            session.setAttribute("id_gerente", userId); // Definir atributo de gerente
                            response.sendRedirect("telas_funcionarios/home_gerente.jsp");
                        } else if ("terapeuta".equalsIgnoreCase(especialidade)){
                            session.setAttribute("id_terapeuta", userId); // Definir atributos de terapeuta
                            response.sendRedirect("telas_funcionarios/home_terapeuta.jsp");
                        }
                    } else{
                        session.setAttribute("id_usuario", userId);
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
