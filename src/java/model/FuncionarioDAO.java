
package model;
import com.mysql.jdbc.PreparedStatement;
import controller.Endereco;
import controller.Funcionario;
import controller.Perfil;
import java.util.ArrayList;
import java.util.List;
import model.Conexao;

public class FuncionarioDAO extends Conexao{
    
      public void cadastrar(Funcionario f) throws Exception {
        abrirBanco();
        String sql = "insert into funcionario values(null,?,?,?,?,?,?,?,?,?,?,?)";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, f.getRg());
        stmt.setString(2, f.getCpf());
        stmt.setString(3, f.getNome());
        stmt.setString(4, f.getLogin());
        stmt.setString(5, f.getSenha());        
        stmt.setString(6, f.getTelefone());
        stmt.setString(7, f.getEmail());
        stmt.setString(8, f.getDataNasc());
        stmt.setString(9, f.getEstadoCivil());
        stmt.setInt(10, f.getEndereco().getIdEndereco());
        stmt.setInt(11, f.getPerfil().getIdPerfil());
        stmt.execute();
        fecharBanco();
    }

    public List<Funcionario> listarFuncionario() throws Exception{
        abrirBanco();
        String sql = "SELECT * FROM funcionario";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        rs = stmt.executeQuery();
        Funcionario f = null;
        List<Funcionario> listarFuncionario = new ArrayList<Funcionario>();
        while(rs.next()){
        f = new Funcionario();
        f.setIdFuncionario(rs.getInt("idFuncionario"));
        f.setRg(rs.getString("rg"));
        f.setCpf(rs.getString("cpf"));
        f.setNome(rs.getString("nome"));
        f.setLogin(rs.getString("login"));
        f.setSenha(rs.getString("senha"));
        f.setTelefone(rs.getString("telefone"));
        f.setDataNasc(rs.getString("dataNasc"));
        f.setEmail(rs.getString("email"));
        f.setDataNasc(rs.getString("dataNasc"));
        f.setEstadoCivil(rs.getString("estadoCivil"));
        Endereco end = new Endereco();
        end.setIdEndereco(rs.getInt("idEndereco"));
        f.setEndereco(end);
        Perfil perf = new Perfil();
        perf.setIdPerfil(rs.getInt("idPerfil"));
        f.setPerfil(perf);
        

        listarFuncionario.add(f);
      }
        return listarFuncionario;
    }

    public static Funcionario buscarId(Integer id) throws Exception{
        abrirBanco();
        String sql = "Select * from funcionario where idFuncionario=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        Funcionario f = new Funcionario();
        if(rs.next()){
        f.setIdFuncionario(rs.getInt("idFuncionario"));
        f.setRg(rs.getString("rg"));
        f.setCpf(rs.getString("cpf"));
        f.setNome(rs.getString("nome"));
        f.setLogin(rs.getString("login"));
        f.setSenha(rs.getString("senha"));
        f.setTelefone(rs.getString("telefone"));
        f.setEmail(rs.getString("email"));
        f.setDataNasc(rs.getString("dataNasc"));
        f.setEstadoCivil(rs.getString("estadoCivil"));
        Endereco end = new Endereco();
        end.setIdEndereco(rs.getInt("idEndereco"));
        f.setEndereco(end);
        Perfil perf = new Perfil();
        perf.setIdPerfil(rs.getInt("idPerfil"));
        f.setPerfil(perf);
        

        }
        return f;

    }

    public void excluir(Funcionario f) throws Exception{
        abrirBanco();
        String sql = "DELETE FROM funcionario where idFuncionario=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, f.getIdFuncionario());
        stmt.execute();
        fecharBanco();
    }

    public void editar(Funcionario f) throws Exception{
        abrirBanco();
        String sql = "update funcionario set rg=?, cpf=?, nome=?, login=?, senha=?, telefone=?, email=?, dataNasc=?, estadoCivil=?, idEndereco=?, idPerfil=?  where idFuncionario=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, f.getRg());
        stmt.setString(2, f.getCpf());
        stmt.setString(3, f.getNome());
        stmt.setString(4, f.getLogin());
        stmt.setString(5, f.getSenha());
        stmt.setString(6, f.getTelefone());
        stmt.setString(7, f.getEmail());
        stmt.setString(8, f.getDataNasc());
        stmt.setString(9, f.getEstadoCivil());
        stmt.setInt(10, f.getEndereco().getIdEndereco());
        stmt.setInt(11, f.getPerfil().getIdPerfil());
        stmt.setInt(12, f.getIdFuncionario());
        stmt.execute();
        fecharBanco();
    }
    
    public static Funcionario validaLogin(String login, String senha) throws Exception{
        abrirBanco();
        String sql = "Select p.idPerfil, p.perfil, f.idFuncionario, "
                + "f.rg, f.cpf, f.nome, f.login, f.senha, f.telefone, "
                + "f.email, f.dataNasc, f.estadoCivil, f.idEndereco from "
                + "funcionario f inner join "
                + "perfil p on f.idPerfil = p.idPerfil "
                + "where login = ? and senha= ?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.setString(2, senha);
        rs = stmt.executeQuery();
        Funcionario f = new Funcionario();
        if(rs.next()){
        f.setIdFuncionario(rs.getInt("idFuncionario"));
        f.setRg(rs.getString("rg"));
        f.setCpf(rs.getString("cpf"));
        f.setNome(rs.getString("nome"));
        f.setLogin(rs.getString("login"));
        f.setSenha(rs.getString("senha"));
        f.setTelefone(rs.getString("telefone"));
        f.setEmail(rs.getString("email"));
        f.setDataNasc(rs.getString("dataNasc"));
        f.setEstadoCivil(rs.getString("estadoCivil"));
        Endereco end = new Endereco();
        end.setIdEndereco(rs.getInt("idEndereco"));
        f.setEndereco(end);
        Perfil perf = new Perfil();
        perf.setIdPerfil(rs.getInt("idPerfil"));
        f.setPerfil(perf);

        PerfilDAO pd= new PerfilDAO();
        perf = pd.buscarId(f.getPerfil().getIdPerfil());
        perf.setPerfil(perf.getPerfil());
         f.setPerfil(perf);
        }
        return f;

    }
    
     public static Funcionario pesquisarporlogin(String login) throws Exception{
        abrirBanco();
        String sql = "Select * from funcionario where login=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, login);
        rs = stmt.executeQuery();
        Funcionario f = new Funcionario();
        if(rs.next()){
        f.setIdFuncionario(rs.getInt("idFuncionario"));
        f.setRg(rs.getString("rg"));
        f.setCpf(rs.getString("cpf"));
        f.setNome(rs.getString("nome"));
        f.setLogin(rs.getString("login"));
        f.setSenha(rs.getString("senha"));
        f.setTelefone(rs.getString("telefone"));
        f.setEmail(rs.getString("email"));
        f.setDataNasc(rs.getString("dataNasc"));
        f.setEstadoCivil(rs.getString("estadoCivil"));
        Endereco end = new Endereco();
        end.setIdEndereco(rs.getInt("idEndereco"));
        f.setEndereco(end);
        Perfil perf = new Perfil();
        perf.setIdPerfil(rs.getInt("idPerfil"));
        f.setPerfil(perf);
        

        }
        return f;

    }
       
    
}
