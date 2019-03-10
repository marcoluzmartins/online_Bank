package asw;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DAO {
    
    public DAO() {

    }

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    private String url = "jdbc:mysql://localhost/bancoasw";
    private String user = "admin";
    private String password = "123";
    private Connection connection = null;

    public boolean open() {
        try {
            connection = DriverManager.getConnection(url, user, password);
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }

    }

    public void close() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {

            }
        }
    }

    

//-------------------------------------------------------------------------------------------------------    
    public int validateUser(String name, String id, String password) {//Login

        open();
        String query = "SELECT * FROM databaseusers WHERE Id=? and Nome=? and Password=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(id));
            ps.setString(2, name);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next() == true) {
                int tipo = rs.getInt("Tipo");
                return tipo;
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            close();

        }
        return -1;
    }


//------------------------------------------------------------------  
//-----------------------Verificar Name -----------------------------
    public String getName(int id) { 
        String rn = null;
        if (open()) {
            String query = "SELECT * FROM databaseusers WHERE Id=? ";
            try {
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next() == true) {
                    rn = rs.getString("Nome");

                }
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                close();

            }

        }
        return rn;

    }


//------------------------------------------------------------------------  
//----------------------- GetBalance -----------------------------
    public int getBalance(int id) {
        int value = 0;
        if (open()) {
            String query = "SELECT * FROM databaseusers WHERE Id=? ";
            try {

                PreparedStatement ps = connection.prepareStatement(query);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                if (rs.next() == true) {
                    value = rs.getInt("Montante");

                }
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                close();

            }

        }
        return value;
    }

    //-------------------------------------------------------------------------------------------------------    
    //---------------------------Adicionar Cliente--------------------------------------------------    
    public int addUser(String name, String morada, String data, String mail, int valor, int tipo, String pass) {

        DateTimeFormatter formatter
                = DateTimeFormatter.ofPattern("yyyy-MM-d");
        LocalDate date = LocalDate.parse(data, formatter);

        Date d = new Date(date.toEpochDay());

        if (open()) {
            String query = "INSERT INTO databaseusers (Id, Nome, Morada, Data_Nascimento, Mail, Montante, Tipo, Password) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)";
            try {
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, morada);
                ps.setDate(3, d); //na base dados mudar o nulo e mudar os valores iniciais
                ps.setString(4, mail);//(4,mail);
                ps.setInt(5, valor);
                ps.setInt(6, tipo);
                ps.setString(7, pass);

                ps.execute();
                return 1;
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                close();
            }
        }
        return 0;
    }

//--------------------------------------------------------------
//----------------------- Lista de Users ------------------------
    public List<User> userList() {
        ArrayList<User> users = new ArrayList<>();
        String query = "select * from databaseusers";
        if (open()) {

            try {
                PreparedStatement ps = connection.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    User u = new User();
                    u.setName(rs.getString("Nome"));
                    u.setId(rs.getInt("Id"));
                    u.setData(rs.getDate("Data_Nascimento"));
                    u.setMail(rs.getString("Mail"));
                    u.setMorada(rs.getString("Morada"));
                    u.setPass(rs.getString("Password"));
                    u.setTip(rs.getInt("Tipo"));
                    u.setVal(rs.getInt("Montante"));
                    users.add(u);

                }
                return users;
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                close();
            }
        }
        return null;
    }

//------------------------------------------------------------------   
//--------------------------- User ---------------------------------

    public User user(int id) {

        if (open()) {
            String query = "select * from databaseusers where id=?";
            try {
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setInt(1, id);

                ResultSet rs = ps.executeQuery();

                if (rs.next() == true) {
                    User u = new User();
                    u.setName(rs.getString("Nome"));
                    u.setId(rs.getInt("Id"));
                    u.setMorada(rs.getString("Morada"));
                    u.setData(rs.getDate("Data_Nascimento"));
                    u.setMail(rs.getString("Mail"));
                    u.setVal(rs.getInt("Montante"));
                    u.setTip(rs.getInt("Tipo"));
                    u.setPass(rs.getString("Password"));

                    return u;
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                close();
            }
        }
        return null;
    }

//--------------------------------------------------------------------------------
//------------------------    Descriçao  ------------------------------------------
    public List<Desc> descL(int id) {
        ArrayList<Desc> desc = new ArrayList<>();

        if (open()) {
            String query = "SELECT id, descricao, id_user_or, id_user_dest, montante, data FROM movimentos WHERE id_user_dest=?";
            try {
                PreparedStatement ps = connection.prepareStatement(query);

                ps.setInt(1, id);

                ResultSet rs = ps.executeQuery();

                while (rs.next() == true) {
                    Desc des = new Desc();
                    des.setId(rs.getInt("id"));
                    des.setDesc(rs.getString("descricao"));
                    des.setId_o(rs.getInt("id_user_or"));
                    des.setId_d(rs.getInt("id_user_dest"));
                    des.setMont(rs.getInt("montante"));
                    Date d = rs.getDate("data");
                    LocalDateTime ld = LocalDateTime.ofEpochSecond(d.getTime() / 1000, 0, ZoneOffset.UTC);
                    des.setDat(ld);
                    desc.add(des);
                }
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                close();
            }
        }
        return desc;
    }

//-------------------------------------------------------------------------------------
//--------------------------------- MOSTRAR Update ------------------------------------------  
    public void updateUser(String name, String morada, String data, String mail, int id) {
        DateTimeFormatter formatter
                = DateTimeFormatter.ofPattern("yyyy-MM-d");
        LocalDate date = LocalDate.parse(data, formatter);

        Date d = new Date(date.toEpochDay());

        if (open()) {
            String query = "UPDATE databaseusers SET Nome= ?, Morada= ?, Mail= ?, Data_Nascimento= ? WHERE Id=?";

            try {
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, morada);
                ps.setString(3, mail);
                ps.setDate(4, d);
                ps.setInt(5, id);
                ps.execute();

            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                close();
            }

        }
    }

//--------------------------------------------------------------------------------
//---------------------------   procura  -----------------------------------------
    public List<User> searchUser(String name) {
        ArrayList<User> n = new ArrayList<>();
        if (open()) {
            String query = "SELECT * FROM databaseusers WHERE Nome=? ";

            try {
                PreparedStatement ps = connection.prepareStatement(query);

                for (int i = 0; i < userList().size(); i++) {
                    if (userList().get(i).getName().startsWith(name)) {
                        //System.out.println("Nome encontrado");
                        n.add(userList().get(i));
                    }

                }
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                close();
            }
        }
        return n;
    }

//------------------------------------------------------------------------------------------------------- 
    int transition(int value, int idO, int idD) {
        int t = getBalance(idO) - value;
        int d = getBalance(idD) + value;
        if (open()) {
            String queryT = "UPDATE databaseusers SET Montante=? WHERE Id=?";
            String queryTT = "INSERT movimentos (id, descricao, id_user_or, id_user_dest, montante) VALUES "
                    + "(NULL, 'TRANSFERENCIA', ?, ?, ? )";// '-'? )";
            String queryD = "UPDATE databaseusers SET Montante=? WHERE Id=?";
            String queryDD = "INSERT movimentos (id, descricao, id_user_or, id_user_dest, montante) VALUES "
                    + "(NULL, 'TRANSFERENCIA', ?, ?, ? )";
            try {
                PreparedStatement psT = connection.prepareStatement(queryT);
                PreparedStatement psTT = connection.prepareStatement(queryTT);
                PreparedStatement psD = connection.prepareStatement(queryD);
                PreparedStatement psDD = connection.prepareStatement(queryDD);

                psT.setInt(1, t);
                psT.setInt(2, idO);
                psT.execute();

                psTT.setInt(1, idD);
                psTT.setInt(2, idO);
                psTT.setInt(3, -1*value);
                psTT.execute();

                psD.setInt(1, d);
                psD.setInt(2, idD);
                psD.execute();

                psDD.setInt(1, idO);
                psDD.setInt(2, idD);
                psDD.setInt(3, value);
                psDD.execute();

            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {

                close();
            }

        }
        return value;
    }

//--------------------------------------------------------------------------------------    
//-------------------------------MOSTRAR DEPOSITO -------------------------------------- 
    int deposit(int value, int id) {

        int f = value + getBalance(id);
        if (open()) {
            String query = "UPDATE databaseusers SET Montante=? WHERE Id=?";
            String queryD = "INSERT movimentos (id, descricao, id_user_or, id_user_dest, montante) VALUES "
                    + "(NULL, 'DEPOSITO', 0, ?, ? )";
            try {
                PreparedStatement ps = connection.prepareStatement(query);
                PreparedStatement psD = connection.prepareStatement(queryD);

                ps.setInt(1, f);
                ps.setInt(2, id);
                ps.execute();
                psD.setInt(1, id);
                psD.setInt(2, value);
                psD.execute();
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {

                close();
            }

        }
        return f;
    }
    //------------------------------------------------------------------------
}
