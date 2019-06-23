

package model;
import controller.Imovel;
import controller.Localizacao;
import com.mysql.jdbc.PreparedStatement;
import controller.Cliente;
import java.util.ArrayList;
import java.util.List;
import model.Conexao;

public class ImovelDAO extends Conexao{
    
      
     public void cadastrar(Imovel i) throws Exception {
        abrirBanco();
        String sql = "insert into imovel values(null,?,?,?,?,?,?,?,?,?,?,?)";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setDouble(1, i.getAreaUtil());
        stmt.setInt(2, i.getNumQuartos());
        stmt.setInt(3, i.getNumBanheiros());               
        stmt.setInt(4, i.getVagasGaragem());
        stmt.setInt(5, i.getNumSuites());
        stmt.setDouble(6, i.getAreaTerreno());        
        stmt.setDouble(7, i.getAreaPrivativa());
        stmt.setString(8, i.getTipoImovel());
        stmt.setString(9, i.getMais());
        stmt.setInt(10, i.getCliente().getIdCliente());
        stmt.setInt(11, i.getLocalizacao().getIdLocalizacao());
        stmt.execute();
        fecharBanco();
    }

    public List<Imovel> listarImovel() throws Exception{
        abrirBanco();
        String sql = "SELECT * FROM imovel";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        rs = stmt.executeQuery();
        Imovel i = null;
        List<Imovel> listarImovel = new ArrayList<Imovel>();
        while(rs.next()){
        i = new Imovel();
        i.setIdImovel(rs.getInt("idImovel"));
        i.setAreaUtil(rs.getDouble("areaUtil"));
        i.setNumQuartos(rs.getInt("numQuartos"));
        i.setNumBanheiros(rs.getInt("numBanheiros"));
        i.setVagasGaragem(rs.getInt("vagasGaragem"));
        i.setNumSuites(rs.getInt("numSuites"));
        i.setAreaTerreno(rs.getDouble("areaTerreno"));
        i.setAreaPrivativa(rs.getDouble("areaPrivativa"));
        i.setTipoImovel(rs.getString("tipoImovel"));
        i.setMais(rs.getString("mais"));
        Cliente c = new Cliente();
        Localizacao l = new Localizacao();
        c.setIdCliente(rs.getInt("idCliente"));
        i.setCliente(c);
        l.setIdLocalizacao(rs.getInt("idLocalizacao"));
       i.setLocalizacao(l);

        listarImovel.add(i);
      }
        return listarImovel;
    }

    
     public  Imovel LeTodosPorPesquisa(String cidade, String tipo, Double inicio, Double fim) throws Exception {       
       
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
        Imovel i = new Imovel(); 
        if (rs.next()) {
            i.setIdImovel(rs.getInt("idImovel"));
            i.setTipoImovel(rs.getString("tipoImovel"));
            i.setNumQuartos(rs.getInt("numQuartos"));
            i.setNumSuites(rs.getInt("numSuites"));
            i.setVagasGaragem(rs.getInt("vagasGaragem"));
            i.setNumSuites(rs.getInt("numSuites"));
        }
        return i;
    }
     
    


     public List<Imovel> listarIdCidade() throws Exception{
        abrirBanco();
        String sql = "SELECT l.endereco, l.cidade, i.idImovel FROM imovel i inner join localizacao l on i.idLocalizacao = i.idLocalizacao";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        rs = stmt.executeQuery();
        Imovel i = null; 
       
        List<Imovel> listarIdCidade = new ArrayList<Imovel>();
        while(rs.next()){
        i = new Imovel();
        Localizacao l = new Localizacao();
        i.setIdImovel(rs.getInt("idImovel"));
      
      //  l.setIdLocalizacao(rs.getInt("idLocalizacao"));
       l.setEndereco(rs.getString("endereco"));
             
        l.setCidade(rs.getString("cidade"));
        
        i.setLocalizacao(l);
       
        listarIdCidade.add(i);
      }
        return listarIdCidade;
    }



    public static Imovel buscarId(Integer id) throws Exception{
        abrirBanco();
        String sql = "Select * from imovel where idImovel=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        Imovel i = new Imovel();
        if(rs.next()){
        i.setIdImovel(rs.getInt("idImovel"));
        i.setAreaUtil(rs.getDouble("areaUtil"));
        i.setNumQuartos(rs.getInt("numQuartos"));
        i.setNumBanheiros(rs.getInt("numBanheiros"));
        i.setVagasGaragem(rs.getInt("vagasGaragem"));
        i.setNumSuites(rs.getInt("numSuites"));
        i.setAreaTerreno(rs.getDouble("areaTerreno"));
        i.setAreaPrivativa(rs.getDouble("areaPrivativa"));
        i.setTipoImovel(rs.getString("tipoImovel"));
        i.setMais(rs.getString("mais"));
        Cliente c = new Cliente();
        Localizacao l = new Localizacao();
       c.setIdCliente(rs.getInt("idCliente"));
        i.setCliente(c);
        l.setIdLocalizacao(rs.getInt("idLocalizacao"));
       i.setLocalizacao(l);

        }
        return i;

    }

    public void excluir(Imovel i) throws Exception{
        abrirBanco();
        String sql = "DELETE FROM imovel where idImovel=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setInt(1, i.getIdImovel());
        stmt.execute();
        fecharBanco();
    }

    public void editar(Imovel i) throws Exception{
        abrirBanco();
        String sql = "update imovel set areaUtil=?, numQuartos=?, numBanheiros=?, vagasGaragem=?, numSuites=?, areaTerreno=?, areaPrivativa=?, tipoImovel=?, mais=?, idCliente=?, idLocalizacao=?  where idImovel=?";
        stmt = (PreparedStatement) con.prepareStatement(sql);
        stmt.setDouble(1, i.getAreaUtil());
        stmt.setInt(2, i.getNumQuartos());
        stmt.setInt(3, i.getNumBanheiros());
        stmt.setInt(4, i.getVagasGaragem());
        stmt.setInt(5, i.getNumSuites());
        stmt.setDouble(6, i.getAreaTerreno());
        stmt.setDouble(7, i.getAreaPrivativa());
        stmt.setString(8, i.getTipoImovel());
        stmt.setString(9, i.getMais());
        stmt.setInt(10, i.getCliente().getIdCliente());
        stmt.setInt(11, i.getLocalizacao().getIdLocalizacao());
        stmt.setInt(12, i.getIdImovel());
        stmt.execute();
        fecharBanco();
    }
    
}
