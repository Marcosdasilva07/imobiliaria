

package model;

import com.mysql.jdbc.PreparedStatement;
import controller.Perfil;
import java.util.ArrayList;
import java.util.List;


public class PerfilDAO extends Conexao{
    
    public void cadastrar(Perfil p) throws Exception {
        abrirBanco();
        String sql = "insert into perfil values(null,?)";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, p.getPerfil());        
        stmt.execute();
        fecharBanco();
    }
    
    public List<Perfil> listarPerfil() throws Exception {
        abrirBanco();
        String sql = "SELECT * FROM perfil";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        rs = stmt.executeQuery();
        Perfil p = null;
        List<Perfil> listarLocalizacao = new ArrayList<Perfil>();
        while (rs.next()) {
            p = new Perfil();
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setPerfil(rs.getString("perfil"));
            listarLocalizacao.add(p);
        }
        return listarLocalizacao;
    }
    
     public static Perfil buscarId(Integer id) throws Exception {
        abrirBanco();
        String sql = "Select * from perfil where idPerfil=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        Perfil p = new Perfil();
        if (rs.next()) {
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setPerfil(rs.getString("perfil"));
           
        }
        return p;

    }
     
     
      public void excluir(Perfil p) throws Exception {
        abrirBanco();
        String sql = "DELETE FROM perfil where idPerfil=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, p.getIdPerfil());
        stmt.execute();
        fecharBanco();
    }

    public void editar(Perfil p) throws Exception {
        abrirBanco();
        String sql = "update perfil set perfil=? where idPerfil=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, p.getPerfil());
        stmt.setInt(2, p.getIdPerfil());        
        stmt.execute();
        fecharBanco();
    }

    
}
