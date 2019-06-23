

package controller;


public class Imovel {
    
    int idImovel;
    Double areaUtil;
    int numQuartos;
    int numBanheiros;
    int vagasGaragem;
    int numSuites;
    Double areaTerreno;
    Double areaPrivativa;
    String tipoImovel;
    String mais;
    Cliente cliente;
    Localizacao localizacao;

    public int getIdImovel() {
        return idImovel;
    }

    public void setIdImovel(int idImovel) {
        this.idImovel = idImovel;
    }

    public Double getAreaUtil() {
        return areaUtil;
    }

    public void setAreaUtil(Double areaUtil) {
        this.areaUtil = areaUtil;
    }

    public int getNumQuartos() {
        return numQuartos;
    }

    public void setNumQuartos(int numQuartos) {
        this.numQuartos = numQuartos;
    }

    public int getNumBanheiros() {
        return numBanheiros;
    }

    public void setNumBanheiros(int numBanheiros) {
        this.numBanheiros = numBanheiros;
    }

    public int getVagasGaragem() {
        return vagasGaragem;
    }

    public void setVagasGaragem(int vagasGaragem) {
        this.vagasGaragem = vagasGaragem;
    }

    public int getNumSuites() {
        return numSuites;
    }

    public void setNumSuites(int numSuites) {
        this.numSuites = numSuites;
    }

    public Double getAreaTerreno() {
        return areaTerreno;
    }

    public void setAreaTerreno(Double areaTerreno) {
        this.areaTerreno = areaTerreno;
    }

    public Double getAreaPrivativa() {
        return areaPrivativa;
    }

    public void setAreaPrivativa(Double areaPrivativa) {
        this.areaPrivativa = areaPrivativa;
    }

    public String getTipoImovel() {
        return tipoImovel;
    }

    public void setTipoImovel(String tipoImovel) {
        this.tipoImovel = tipoImovel;
    }

    public String getMais() {
        return mais;
    }

    public void setMais(String mais) {
        this.mais = mais;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Localizacao getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(Localizacao localizacao) {
        this.localizacao = localizacao;
    }

    public Imovel(int idImovel, Double areaUtil, int numQuartos, int numBanheiros, int vagasGaragem, int numSuites, Double areaTerreno, Double areaPrivativa, String tipoImovel, String mais, Cliente cliente, Localizacao localizacao) {
        this.idImovel = idImovel;
        this.areaUtil = areaUtil;
        this.numQuartos = numQuartos;
        this.numBanheiros = numBanheiros;
        this.vagasGaragem = vagasGaragem;
        this.numSuites = numSuites;
        this.areaTerreno = areaTerreno;
        this.areaPrivativa = areaPrivativa;
        this.tipoImovel = tipoImovel;
        this.mais = mais;
        this.cliente = cliente;
        this.localizacao = localizacao;
    }

  
    public Imovel() {
    }
    
    
}
