

package controller;


public class Cliente extends Pessoa{
    
    int idCliente;
    String rg;
    String cpfCnpj;
    String celular1;
    String celular2;
    String dataNasc;
    String estadoCivil;
    String profissao;
    String empresaTrabalho;

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getCpfCnpj() {
        return cpfCnpj;
    }

    public void setCpfCnpj(String cpfCnpj) {
        this.cpfCnpj = cpfCnpj;
    }

    public String getCelular1() {
        return celular1;
    }

    public void setCelular1(String celular1) {
        this.celular1 = celular1;
    }

    public String getCelular2() {
        return celular2;
    }

    public void setCelular2(String celular2) {
        this.celular2 = celular2;
    }
    

    public String getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(String dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getProfissao() {
        return profissao;
    }

    public void setProfissao(String profissao) {
        this.profissao = profissao;
    }

    public String getEmpresaTrabalho() {
        return empresaTrabalho;
    }

    public void setEmpresaTrabalho(String empresaTrabalho) {
        this.empresaTrabalho = empresaTrabalho;
    }

    public Cliente(int idCliente, String rg, String cpfCnpj, String celular1, String celular2, String dataNasc, String estadoCivil, String profissao, String empresaTrabalho, String nome, String telefone, String email, Endereco endereco) {
        super(nome, telefone, email, endereco);
        this.idCliente = idCliente;
        this.rg = rg;
        this.cpfCnpj = cpfCnpj;
        this.celular1 = celular1;
        this.celular2 = celular2;
        this.dataNasc = dataNasc;
        this.estadoCivil = estadoCivil;
        this.profissao = profissao;
        this.empresaTrabalho = empresaTrabalho;
    }

    public Cliente() {
    }
    
    
}
