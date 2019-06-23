/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class Conexao {

    public static Connection con;
    public static  PreparedStatement stmt;
    public static ResultSet rs;

    public static void abrirBanco() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/eimobiliariocompleto";
        String usuario = "root";
        String senha = "toor";
        con = (Connection) DriverManager.getConnection(url,usuario,senha);
    }
    public static void fecharBanco() throws Exception{

        if (con != null){
            con.close();
        }
    }
}
