package model;

import controller.Anuncio;
import com.mysql.jdbc.PreparedStatement;
import controller.Funcionario;
import controller.Imovel;
import controller.Localizacao;
import java.util.ArrayList;
import java.util.List;
import model.Conexao;
import static model.Conexao.abrirBanco;
import static model.Conexao.con;
import static model.Conexao.rs;
import static model.Conexao.stmt;

public class AnuncioDAO extends Conexao {

    public void cadastrar(Anuncio a) throws Exception {
        abrirBanco();
        String sql = "insert into anuncio values(null,?,?,?,?,?,?,?,?,?,?)";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setDouble(1, a.getValor());
        stmt.setDouble(2, a.getValorCondominio());
        stmt.setString(3, a.getAceitaFinanciamento());
        stmt.setString(4, a.getTipoAnuncio());       
        stmt.setInt(5, a.getImovel().getIdImovel());
        stmt.setInt(6, a.getFuncionario().getIdFuncionario());       
        stmt.setString(7, a.getImagem1());
        stmt.setString(8, a.getImagem2());
        stmt.setString(9, a.getImagem3());
        stmt.setString(10, a.getImagem4());
        stmt.execute();
        fecharBanco();
    }

    public List<Anuncio> listarAnuncio() throws Exception {
        abrirBanco();
        String sql = "SELECT * FROM anuncio";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        rs = stmt.executeQuery();
        Anuncio a = null;
        List<Anuncio> listarAnuncio = new ArrayList<Anuncio>();
        while (rs.next()) {
            a = new Anuncio();
            a.setIdAnuncio(rs.getInt("idAnuncio"));
            a.setValor(rs.getDouble("valor"));
            a.setValorCondominio(rs.getDouble("valorCondominio"));
            a.setAceitaFinanciamento(rs.getString("aceitaFinanciamento"));
            a.setTipoAnuncio(rs.getString("tipoAnuncio"));
          
            Imovel i = new Imovel();
            Funcionario f = new Funcionario();
            
            i.setIdImovel(rs.getInt("idImovel"));
            a.setImovel(i);
            f.setIdFuncionario(rs.getInt("funcionario_id"));
            a.setFuncionario(f);            
            a.setImagem1(rs.getString("imagem1"));
            a.setImagem2(rs.getString("imagem2"));
            a.setImagem3(rs.getString("imagem3"));
            a.setImagem4(rs.getString("imagem4"));

            listarAnuncio.add(a);
        }
        return listarAnuncio;
    }

    



    public List<Anuncio> LeTodosPorPesquisa(String tipo, String cidade, Double inicio, Double fim) throws Exception {
        List<Anuncio> a = new ArrayList<Anuncio>();
        abrirBanco();
        String sql = "select l.idLocalizacao, a.idAnuncio, a.idImovel, l.endereco, i.tipoImovel,"
                + " l.cidade, l.bairro, i.idImovel, i.numQuartos, i.numSuites, i.vagasGaragem,"
                + " a.valor, a.imagem1 from localizacao l inner join imovel i on l.idLocalizacao = i.idLocalizacao "
                + "inner join anuncio a on i.idImovel = a.idImovel where "
                + "i.tipoImovel like ? or l.cidade like ? and a.valor between ? and ?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, tipo);
        stmt.setString(2, cidade);
        stmt.setDouble(3, inicio);
        stmt.setDouble(4, fim);

        rs = stmt.executeQuery();
        a = new ArrayList<Anuncio>();

        while (rs.next()) {
            Anuncio an = new Anuncio();
            an.setIdAnuncio(rs.getInt("idAnuncio"));
            an.setValor(rs.getDouble("valor"));            
            an.setImagem1(rs.getString("imagem1"));
            Imovel i = new Imovel();
            i.setIdImovel(rs.getInt("idImovel"));
            i.setTipoImovel(rs.getString("tipoImovel"));
            Localizacao l = new Localizacao();
            l.setCidade(rs.getString("cidade"));
            l.setIdLocalizacao(rs.getInt("idLocalizacao"));

            an.setImovel(i);
            a.add(an);
        }

        return a;

    }

    public List<Anuncio> PesquisaIndex(String tipo, String cidade, Double inicio, Double fim) throws Exception {
        List<Anuncio> a = new ArrayList<Anuncio>();
        abrirBanco();
        String sql = "select l.idLocalizacao, a.idAnuncio, a.idImovel, l.endereco, i.tipoImovel,"
                + " l.cidade, l.bairro, i.idImovel, i.numQuartos, i.numSuites, i.vagasGaragem,"
                + " a.valor, a.imagem1 from localizacao l inner join imovel i on l.idLocalizacao = i.idLocalizacao "
                + "inner join anuncio a on i.idImovel = a.idImovel where "
                + "i.tipoImovel like ? or l.cidade like ? and a.valor between ? and ? order by idAnuncio desc limit 3";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setString(1, tipo);
        stmt.setString(2, cidade);
        stmt.setDouble(3, inicio);
        stmt.setDouble(4, fim);

        rs = stmt.executeQuery();
        a = new ArrayList<Anuncio>();

        while (rs.next()) {
            Anuncio an = new Anuncio();
            an.setIdAnuncio(rs.getInt("idAnuncio"));
            an.setValor(rs.getDouble("valor"));            
            an.setImagem1(rs.getString("imagem1"));
            Imovel i = new Imovel();
            i.setIdImovel(rs.getInt("idImovel"));
            i.setTipoImovel(rs.getString("tipoImovel"));
            Localizacao l = new Localizacao();
            l.setCidade(rs.getString("cidade"));
            l.setIdLocalizacao(rs.getInt("idLocalizacao"));

            an.setImovel(i);
            a.add(an);
        }

        return a;

    }

    public static Anuncio buscarId(Integer id) throws Exception {
        abrirBanco();
        String sql = "Select * from anuncio where idAnuncio=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        Anuncio a = new Anuncio();
        if (rs.next()) {
            a.setIdAnuncio(rs.getInt("idAnuncio"));
            a.setValor(rs.getDouble("valor"));
            a.setValorCondominio(rs.getDouble("valorCondominio"));
            a.setAceitaFinanciamento(rs.getString("aceitaFinanciamento"));
            a.setTipoAnuncio(rs.getString("tipoAnuncio"));
           
            Imovel i = new Imovel();
            Funcionario f = new Funcionario();
            
            i.setIdImovel(rs.getInt("idImovel"));
            a.setImovel(i);
            f.setIdFuncionario(rs.getInt("funcionario_id"));            
            a.setImagem1(rs.getString("imagem1"));
            a.setImagem2(rs.getString("imagem2"));
            a.setImagem3(rs.getString("imagem3"));
            a.setImagem4(rs.getString("imagem4"));
            a.setFuncionario(f);

        }
        return a;

    }

    public void excluir(Anuncio a) throws Exception {
        abrirBanco();
        String sql = "DELETE FROM anuncio where idAnuncio=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, a.getIdAnuncio());
        stmt.execute();
        fecharBanco();
    }

    public void editar(Anuncio a) throws Exception {
        abrirBanco();
        String sql = "update anuncio set valor=?, valorCondominio=?, aceitaFinanciamento=?, tipoAnuncio=?,  imagem1=?, imagem2=?, imagem3=?, imagem4=?,  idImovel=?, funcionario_id=?  where idAnuncio=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setDouble(1, a.getValor());
        stmt.setDouble(2, a.getValorCondominio());
        stmt.setString(3, a.getAceitaFinanciamento());
        stmt.setString(4, a.getTipoAnuncio());       
        stmt.setString(5, a.getImagem1());
        stmt.setString(6, a.getImagem2());
        stmt.setString(7, a.getImagem3());
        stmt.setString(8, a.getImagem4());       
        stmt.setInt(9, a.getImovel().getIdImovel());
        stmt.setInt(10, a.getFuncionario().getIdFuncionario());
        stmt.setInt(11, a.getIdAnuncio());
        stmt.execute();
        fecharBanco();
    }

}
