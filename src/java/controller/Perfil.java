

package controller;


public class Perfil {
    
    private int idPerfil;
    private String perfil;

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public Perfil() {
    }

    public Perfil(int idPerfil, String perfil) {
        this.idPerfil = idPerfil;
        this.perfil = perfil;
    }

   
    
}
