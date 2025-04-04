/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sontu
 */
public class DaoUser extends DBContext {

    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private Connection connection = null;

    public User getUserName(String userName) {
        String sql = "SELECT * FROM User\n"
                + "where Username = ?";
        User u = new User();
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userID = rs.getInt(1);
                String userNAme = rs.getString(2);
                String password = rs.getString(3);
                String email = rs.getString(4);
                String fullName = rs.getString(5);
                String img = rs.getString(6);
                String phone = rs.getString(7);
                String userType = rs.getString(8);
                String CCCDFront = rs.getString(9);
                String CCCDBack = rs.getString(10);
                int status = rs.getInt(11);
                u = new User(userID, userNAme, password, email, fullName, img, phone, userType, CCCDFront, CCCDBack, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public User getUserbyID(int userID) {
        User u = new User();
        String sql = "SELECT * FROM User\n"
                + "where UserID = ?";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int useriD = rs.getInt(1);
                String userNAme = rs.getString(2);
                String password = rs.getString(3);
                String email = rs.getString(4);
                String fullName = rs.getString(5);
                String img = rs.getString(6);
                String phone = rs.getString(7);
                String userType = rs.getString(8);
                String CCCDFront = rs.getString(9);
                String CCCDBack = rs.getString(10);
                int status = rs.getInt(11);
                u = new User(userID, userNAme, password, email, fullName, img, phone, userType, CCCDFront, CCCDBack, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public void changeAvatarForUser(int userID, String img, String fullName) {
        String sql = "UPDATE User\n"
                + "SET Img = ?,\n"
                + "FullName = ?\n"
                + "WHERE UserID = ?;";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setString(1, img);
            ps.setString(2, fullName);
            ps.setInt(3, userID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean checkUserVip(int userID) {
        String sql = "SELECT User.UserType \n"
                + "FROM User \n"
                + "WHERE UserID = ?;";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userType = rs.getInt(1);
                if (userType == 1) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void identifyAccount(int userID, String cccdFront, String cccdBack) {
        String sql = "UPDATE User \n"
                + "SET CCCD_Front = ?, CCCD_Back = ?, CCCD_Status = 'Approved'\n"
                + "WHERE userID = ?;";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setString(1, cccdFront);
            ps.setString(2, cccdBack);
            ps.setInt(3, userID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String sql2 = "UPDATE User \n"
                + "SET UserType = 1\n"
                + "WHERE userID = ?;";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql2);
            ps.setInt(1, userID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean checkUserName(String userName) {
        String sql = "Select *from User where Username = ?";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            if (rs.next() == true) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkEmail(String email) {
        String sql = "Select *from User where Email = ?";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next() == true) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void register(String userName, String password, String email, String fullName, String phone) {
        String sql = "INSERT INTO User (Username, Password, Email, FullName, Phone, Usertype) \n"
                + "VALUES (?,?,?,?,?,?);";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, fullName);
            ps.setString(5, phone);
            ps.setInt(6, 2);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUser() {
        String sql = "Select *from User";
        List<User> l = new ArrayList<>();
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userID = rs.getInt(1);
                String userName = rs.getString(2);
                String password = rs.getString(3);
                String email = rs.getString(4);
                String fullName = rs.getString(5);
                String phone = rs.getString(6);
                String img = rs.getString(7);
                String userType = rs.getString(8);
                String CCCDFront = rs.getString(9);
                String CCCDBack = rs.getString(10);
                int status = rs.getInt(11);
                User u = new User(userID, userName, password, email, fullName, phone, img, userType, CCCDFront, CCCDBack, status);
                l.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public void cancelUser(int userID) {
        String sql = "UPDATE User\n"
                + "SET userType = 2\n"
                + "WHERE userID = ?;";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void acceptUser(int userID) {
        String sql = "UPDATE User\n"
                + "SET userType = 1\n"
                + "WHERE userID = ?;";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DaoUser d = new DaoUser();
        User u = d.getUserbyID(1);
        System.out.println(u.getFullName());
    }
}
