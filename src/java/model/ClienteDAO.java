

package model;
import controller.Cliente;
import com.mysql.jdbc.PreparedStatement;
import controller.Endereco;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Conexao;

public class ClienteDAO extends Conexao{

    
    
     public void cadastrar(Cliente cl) throws Exception {
        abrirBanco();
        String sql = "insert into cliente values(null,?,?,?,?,?,?,?,?,?,?,?,?)";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, cl.getNome());
        stmt.setString(2, cl.getRg());
        stmt.setString(3, cl.getCpfCnpj());               
        stmt.setString(4, cl.getTelefone());
        stmt.setString(5, cl.getCelular1());
        stmt.setString(6, cl.getCelular2());
        stmt.setString(7, cl.getDataNasc());
        stmt.setString(8, cl.getEmail());        
        stmt.setString(9, cl.getEstadoCivil());
        stmt.setString(10, cl.getProfissao());
        stmt.setString(11, cl.getEmpresaTrabalho());
        stmt.setInt(12, cl.getEndereco().getIdEndereco());
        stmt.execute();
        fecharBanco();
    }

    public List<Cliente> listarCliente() throws Exception {
        List<Cliente> listarCliente = new ArrayList<Cliente>();
       
          abrirBanco();
        String sql = "SELECT * FROM cliente";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        rs = stmt.executeQuery();
        Cliente cl = null;
        while(rs.next()){
        cl = new Cliente();
        cl.setIdCliente(rs.getInt("idCliente"));
        cl.setNome(rs.getString("nome"));
        cl.setRg(rs.getString("rg"));
        cl.setCpfCnpj(rs.getString("cpf"));
        cl.setTelefone(rs.getString("telefone"));
        cl.setCelular1(rs.getString("celular1"));
        cl.setCelular2(rs.getString("celular2"));
        cl.setDataNasc(rs.getString("dataNasc"));
        cl.setEmail(rs.getString("email"));
        cl.setEstadoCivil(rs.getString("estadoCivil"));
        cl.setProfissao(rs.getString("profissao"));
        cl.setEmpresaTrabalho(rs.getString("empresaTrabalho"));               
     Endereco end = new Endereco();
        end.setIdEndereco(rs.getInt("idEndereco"));
        cl.setEndereco(end);
        

        listarCliente.add(cl);
      }
        
        
        return listarCliente;
    }

    public static Cliente buscarId(Integer id) throws Exception{
        abrirBanco();
        String sql = "Select * from cliente where idCliente = ?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        Cliente cl = new Cliente();
        if(rs.next()){
        cl.setIdCliente(rs.getInt("idCliente"));
        cl.setNome(rs.getString("nome"));
        cl.setRg(rs.getString("rg"));
        cl.setCpfCnpj(rs.getString("cpf"));
        cl.setTelefone(rs.getString("telefone"));
        cl.setCelular1(rs.getString("celular1"));
        cl.setCelular2(rs.getString("celular2"));
        cl.setDataNasc(rs.getString("dataNasc"));
        cl.setEmail(rs.getString("email"));
        cl.setEstadoCivil(rs.getString("estadoCivil"));
        cl.setProfissao(rs.getString("profissao"));
        cl.setEmpresaTrabalho(rs.getString("empresaTrabalho"));
        Endereco end = new Endereco();
        end.setIdEndereco(rs.getInt("idEndereco"));
        cl.setEndereco(end);
        
        cl.getEndereco().setIdEndereco(rs.getInt("idEndereco"));

        }
        return cl;

    }

    public void excluir(Cliente cl) throws Exception{
        abrirBanco();
        String sql = "DELETE FROM cliente where idCliente=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, cl.getIdCliente());
        stmt.execute();
        fecharBanco();
    }

    public void editar(Cliente cl) throws Exception{
        abrirBanco();
        String sql = "update cliente set nome=?, rg=?, cpf=?, telefone=?, celular1=?, celular2=?, dataNasc=?, email=?, estadoCivil=?, profissao=?, empresaTrabalho=?, idEndereco=?  where idCliente=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, cl.getNome());
        stmt.setString(2, cl.getRg());
        stmt.setString(3, cl.getCpfCnpj());
        stmt.setString(4, cl.getTelefone());
        stmt.setString(5, cl.getCelular1());
        stmt.setString(6, cl.getCelular2());
        stmt.setString(7, cl.getDataNasc());
        stmt.setString(8, cl.getEmail());        
        stmt.setString(9, cl.getEstadoCivil());
        stmt.setString(10, cl.getProfissao());
        stmt.setString(11, cl.getEmpresaTrabalho());
        stmt.setInt(12, cl.getEndereco().getIdEndereco());
        stmt.setInt(13, cl.getIdCliente());
        stmt.execute();
        fecharBanco();
    }
    
}
