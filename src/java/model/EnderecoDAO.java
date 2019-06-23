
package model;

import com.mysql.jdbc.PreparedStatement;
import controller.Endereco;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import model.Conexao;

public class EnderecoDAO extends Conexao {

    public void cadastrar(Endereco e) throws Exception {
        abrirBanco();
        String sql = "insert into endereco values(null,?,?,?,?,?,?)";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, e.getEndereco());
        stmt.setString(2, e.getCep());
        stmt.setString(3, e.getCidade());
        stmt.setString(4, e.getBairro());
        stmt.setString(5, e.getUf());
        stmt.setInt(6, e.getNumero());       
        stmt.execute();
        fecharBanco();
    }
    
 
    

 
    
    
     public List<Endereco> listarEndereco() throws Exception{
        abrirBanco();
        String sql = "SELECT * FROM endereco";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        rs = stmt.executeQuery();
        Endereco e = null;
        List<Endereco> listarEndereco = new ArrayList<Endereco>();
        while(rs.next()){
        e = new Endereco();
        e.setIdEndereco(rs.getInt("idEndereco"));
        e.setEndereco(rs.getString("endereco"));
        e.setCep(rs.getString("cep"));
        e.setCidade(rs.getString("cidade"));
        e.setBairro(rs.getString("bairro"));
        e.setUf(rs.getString("uf"));
        e.setNumero(rs.getInt("numero"));       
        
        listarEndereco.add(e);
      }
        return listarEndereco;
    }
    
    public static Endereco buscarId(Integer id) throws Exception{
        abrirBanco();
        String sql = "Select * from endereco where idEndereco=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        Endereco e = new Endereco();
        if(rs.next()){
            e.setIdEndereco(rs.getInt("idEndereco"));
            e.setEndereco(rs.getString("endereco"));
            e.setCep(rs.getString("cep"));
            e.setCidade(rs.getString("cidade"));
            e.setBairro(rs.getString("bairro"));
            e.setUf(rs.getString("uf"));
            e.setNumero(rs.getInt("numero")); 
            
        }
        return e;

    }




     public static Endereco buscarIdEndereco() throws Exception{
        abrirBanco();
        String sql = "Select max(idEndereco) as idEndereco from endereco";
        stmt = (PreparedStatement) con.prepareStatement(sql);
       // stmt.setInt(1, id);
        rs = stmt.executeQuery();
        Endereco e = new Endereco();
        if(rs.next()){
         e.setIdEndereco(rs.getInt("idEndereco"));
            

        }
        return e;

    }


   
    
    public void excluir(Endereco e) throws Exception{
        abrirBanco();
        String sql = "DELETE FROM endereco where idEndereco=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, e.getIdEndereco());
        stmt.execute();
        fecharBanco();
    }
    
    public void editar(Endereco e) throws Exception{
        abrirBanco();
        String sql = "update endereco set endereco=?, cep=?, cidade=?, bairro=?, uf=?, numero=? where idEndereco=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, e.getEndereco());
        stmt.setString(2, e.getCep());
        stmt.setString(3, e.getCidade());
        stmt.setString(4, e.getBairro());
        stmt.setString(5, e.getUf());
        stmt.setInt(6, e.getNumero());  
        stmt.setInt(7, e.getIdEndereco());
        stmt.execute();
        fecharBanco();
    }
}
