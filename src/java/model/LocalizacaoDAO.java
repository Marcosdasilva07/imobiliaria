package model;

import controller.Localizacao;
import com.mysql.jdbc.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import model.Conexao;

public class LocalizacaoDAO extends Conexao {

    public void cadastrar(Localizacao l) throws Exception {
        abrirBanco();
        String sql = "insert into localizacao values(null,?,?,?,?,?,?)";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, l.getEndereco());
        stmt.setString(2, l.getCep());
        stmt.setString(3, l.getCidade());
        stmt.setString(4, l.getBairro());
        stmt.setString(5, l.getUf());
        stmt.setInt(6, l.getNumero());
        stmt.execute();
        fecharBanco();
    }

    public List<Localizacao> listarLocalizacao() throws Exception {
        abrirBanco();
        String sql = "SELECT * FROM localizacao";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        rs = stmt.executeQuery();
        Localizacao l = null;
        List<Localizacao> listarLocalizacao = new ArrayList<Localizacao>();
        while (rs.next()) {
            l = new Localizacao();
            l.setIdLocalizacao(rs.getInt("idLocalizacao"));
            l.setEndereco(rs.getString("endereco"));
            l.setCep(rs.getString("cep"));
            l.setCidade(rs.getString("cidade"));
            l.setBairro(rs.getString("bairro"));
            l.setUf(rs.getString("uf"));
            l.setNumero(rs.getInt("numero"));

            listarLocalizacao.add(l);
        }
        return listarLocalizacao;
    }

     public  Localizacao LeTodosPorPesquisa(String cidade, String tipo, Double inicio, Double fim) throws Exception {       
       
        abrirBanco();
        String sql = "select l.idLocalizacao, a.idAnuncio, l.endereco, i.tipoImovel,"
                + " l.cidade, l.bairro,  i.idImovel, i.numQuartos, i.numSuites, i.vagasGaragem,"
                + " a.valor from localizacao l inner join imovel i on l.idLocalizacao = i.idLocalizacao "
                + "inner join anuncio a on i.idImovel = a.idImovel where "
                + "i.tipoImovel LIKE ? or l.cidade like ? or a.valor between ? and ?";        
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, cidade);
        stmt.setString(2, tipo);
        stmt.setDouble(3, inicio);
        stmt.setDouble(4, fim);
        rs = stmt.executeQuery();  
        Localizacao l = new Localizacao(); 
        if (rs.next()) {
            l.setIdLocalizacao(rs.getInt("idLocalizacao"));
            l.setEndereco(rs.getString("endereco")); 
            l.setCidade(rs.getString("cidade"));
            l.setBairro(rs.getString("bairro"));
        }

        return l;
        
    }
     


    public static Localizacao buscarIdLocalizacao() throws Exception {
        abrirBanco();
        String sql = "Select max(idLocalizacao) as idLocalizacao from Localizacao";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        rs = stmt.executeQuery();
        Localizacao l = new Localizacao();
        if (rs.next()) {
            l.setIdLocalizacao(rs.getInt("idLocalizacao"));

        }
        return l;

    }

    public static Localizacao buscarId(Integer id) throws Exception {
        abrirBanco();
        String sql = "Select * from localizacao where idLocalizacao=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        Localizacao l = new Localizacao();
        if (rs.next()) {
            l.setIdLocalizacao(rs.getInt("idLocalizacao"));
            l.setEndereco(rs.getString("endereco"));
            l.setCep(rs.getString("cep"));
            l.setCidade(rs.getString("cidade"));
            l.setBairro(rs.getString("bairro"));
            l.setUf(rs.getString("uf"));
            l.setNumero(rs.getInt("numero"));

        }
        return l;

    }

    public void excluir(Localizacao l) throws Exception {
        abrirBanco();
        String sql = "DELETE FROM localizacao where idLocalizacao=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, l.getIdLocalizacao());
        stmt.execute();
        fecharBanco();
    }

    public void editar(Localizacao l) throws Exception {
        abrirBanco();
        String sql = "update localizacao set endereco=?, cep=?, cidade=?, bairro=?, uf=?, numero=? where idLocalizacao=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, l.getEndereco());
        stmt.setString(2, l.getCep());
        stmt.setString(3, l.getCidade());
        stmt.setString(4, l.getBairro());
        stmt.setString(5, l.getUf());
        stmt.setInt(6, l.getNumero());
        stmt.setInt(7, l.getIdLocalizacao());
        stmt.execute();
        fecharBanco();
    }
}
