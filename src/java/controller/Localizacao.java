

package controller;


public class Localizacao {
    int idLocalizacao;
    String endereco;
    String cep;
    String cidade;
    String bairro;
    String uf;
    int numero;

    public int getIdLocalizacao() {
        return idLocalizacao;
    }

    public void setIdLocalizacao(int idLocalizacao) {
        this.idLocalizacao = idLocalizacao;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Localizacao(int idLocalizacao, String endereco, String cep, String cidade, String bairro, String uf, int numero) {
        this.idLocalizacao = idLocalizacao;
        this.endereco = endereco;
        this.cep = cep;
        this.cidade = cidade;
        this.bairro = bairro;
        this.uf = uf;
        this.numero = numero;
    }

    public Localizacao() {
    }
    
    
}
