

package controller;

import java.util.ArrayList;
import java.util.logging.Logger;


public class Funcionario extends Pessoa{
    
    int idFuncionario;
    String rg;
    String cpf;
    String login;
    String senha;
    String estadoCivil;
    String dataNasc;
    Perfil perfil;

    public int getIdFuncionario() {
        return idFuncionario;
    }

    public void setIdFuncionario(int idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(String dataNasc) {
        this.dataNasc = dataNasc;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public Funcionario(int idFuncionario, String rg, String cpf, String login, String senha, String estadoCivil, String dataNasc, Perfil perfil, String nome, String telefone, String email, Endereco endereco) {
        super(nome, telefone, email, endereco);
        this.idFuncionario = idFuncionario;
        this.rg = rg;
        this.cpf = cpf;
        this.login = login;
        this.senha = senha;
        this.estadoCivil = estadoCivil;
        this.dataNasc = dataNasc;
        this.perfil = perfil;
    }

    public Funcionario() {
    }
    
    
}
