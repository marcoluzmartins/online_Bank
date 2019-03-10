package asw;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

//-------------------------------------------------------------------------------
//--------------------------- Verificar Descrição -------------------------------
public class Desc {

    private int id;
    private String desc;
    private int id_o;
    private int id_d;
    private int mont;
    private LocalDateTime dat;

    public Desc(int id, String desc, int id_o, int id_d, int mont, LocalDateTime dat) {
        this.id = id;
        this.desc = desc;
        this.id_o = id_o;
        this.id_d = id_d;
        this.mont = mont;
        this.dat = dat;
    }
    public Desc(){
        
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getId_o() {
        return id_o;
    }

    public void setId_o(int id_o) {
        this.id_o = id_o;
    }

    public int getId_d() {
        return id_d;
    }

    public void setId_d(int id_d) {
        this.id_d = id_d;
    }

    public int getMont() {
        return mont;
    }

    public void setMont(int mont) {
        this.mont = mont;
    }

    public LocalDateTime getDat() {
        return dat;
    }

    public void setDat(LocalDateTime dat) {
        this.dat = dat;
    }

}
