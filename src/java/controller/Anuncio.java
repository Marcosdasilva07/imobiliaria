
package controller;


public class Anuncio {
    
    int idAnuncio;
    Double valor;
    Double valorCondominio;
    String aceitaFinanciamento;
    String tipoAnuncio;    
    String imagem1;
    String imagem2;
    String imagem3;
    String imagem4;   
    Imovel imovel;
    Funcionario funcionario;

    public int getIdAnuncio() {
        return idAnuncio;
    }

    public void setIdAnuncio(int idAnuncio) {
        this.idAnuncio = idAnuncio;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Double getValorCondominio() {
        return valorCondominio;
    }

    public void setValorCondominio(Double valorCondominio) {
        this.valorCondominio = valorCondominio;
    }

    public String getAceitaFinanciamento() {
        return aceitaFinanciamento;
    }

    public void setAceitaFinanciamento(String aceitaFinanciamento) {
        this.aceitaFinanciamento = aceitaFinanciamento;
    }

    public String getTipoAnuncio() {
        return tipoAnuncio;
    }

    public void setTipoAnuncio(String tipoAnuncio) {
        this.tipoAnuncio = tipoAnuncio;
    }

   

    public String getImagem1() {
        return imagem1;
    }

    public void setImagem1(String imagem1) {
        this.imagem1 = imagem1;
    }

    public String getImagem2() {
        return imagem2;
    }

    public void setImagem2(String imagem2) {
        this.imagem2 = imagem2;
    }

    public String getImagem3() {
        return imagem3;
    }

    public void setImagem3(String imagem3) {
        this.imagem3 = imagem3;
    }

    public String getImagem4() {
        return imagem4;
    }

    public void setImagem4(String imagem4) {
        this.imagem4 = imagem4;
    }
    
    


    public Imovel getImovel() {
        return imovel;
    }

    public void setImovel(Imovel imovel) {
        this.imovel = imovel;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    public Anuncio(int idAnuncio, Double valor, Double valorCondominio, String aceitaFinanciamento, String tipoAnuncio,  String imagem1, String imagem2, String imagem3, String imagem4, Imovel imovel, Funcionario funcionario) {
        this.idAnuncio = idAnuncio;
        this.valor = valor;
        this.valorCondominio = valorCondominio;
        this.aceitaFinanciamento = aceitaFinanciamento;
        this.tipoAnuncio = tipoAnuncio;        
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.imagem3 = imagem3;
        this.imagem4 = imagem4;        
        this.imovel = imovel;
        this.funcionario = funcionario;
    }

   

    public Anuncio() {
    }
    
    
    
}
