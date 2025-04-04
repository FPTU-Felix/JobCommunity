/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Post;
import Model.PostDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author sontu
 */
public class DaoPost extends DBContext {

    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private Connection connection = null;

    public List<Post> getPostInHomePage() {
        String sql = "SELECT p.PostID, p.UserID, p.Title, p.Description, p.Img, "
                + "p.DateStarted, p.TimeDuration, p.Place, p.Salary, "
                + "p.PaymentTime, p.Requirements, w.TypeName, p.Status "
                + "FROM Post p "
                + "JOIN WorkType w ON p.WorkTypeID = w.WorkTypeID "
                + "LIMIT 9;";

        List<Post> l = new ArrayList<>();
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int postID = rs.getInt(1);
                int userID = rs.getInt(2);
                String title = rs.getString(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                String dateStarted = rs.getString(6);
                String timeDuration = rs.getString(7);
                String place = rs.getString(8);
                int salary = rs.getInt(9);
                String paymentTime = rs.getString(10);
                String requirements = rs.getString(11);
                String workType = rs.getString(12);
                int status = rs.getInt(13);

                Post p = new Post(postID, userID, title, description, img, dateStarted,
                        timeDuration, place, salary, paymentTime,
                        requirements, workType, status);
                l.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public List<Post> getAllPostActive(String typeName, String dateStarted, String timeDurations, String salaryPara) {
        // Nếu salaryPara không rỗng, thêm điều kiện lọc Salary
        String salaryCondition = (salaryPara == null || salaryPara.isEmpty()) ? "" : " AND p.Salary = ? ";

        String sql = "SELECT "
                + "     p.PostID, "
                + "     p.UserID, "
                + "     p.Title, "
                + "     p.Description, "
                + "     p.Img, "
                + "     p.DateStarted, "
                + "     p.TimeDuration, "
                + "     p.Place, "
                + "     p.Salary, "
                + "     p.PaymentTime, "
                + "     p.Requirements, "
                + "     w.TypeName AS WorkType, "
                + "     p.Status "
                + " FROM Post p "
                + " JOIN WorkType w ON p.WorkTypeID = w.WorkTypeID "
                + " WHERE "
                + "     (? IS NULL OR w.TypeName = ?) "
                + "     AND (? IS NULL OR p.DateStarted = ?) "
                + "     AND (? IS NULL OR p.TimeDuration = ?) "
                + salaryCondition
                + "     AND p.Status = 1;";

        List<Post> l = new ArrayList<>();
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);

            int paramIndex = 1;
            ps.setString(paramIndex++, typeName.isEmpty() ? null : typeName);
            ps.setString(paramIndex++, typeName.isEmpty() ? null : typeName);
            ps.setString(paramIndex++, dateStarted.isEmpty() ? null : dateStarted);
            ps.setString(paramIndex++, dateStarted.isEmpty() ? null : dateStarted);
            ps.setString(paramIndex++, timeDurations.isEmpty() ? null : timeDurations);
            ps.setString(paramIndex++, timeDurations.isEmpty() ? null : timeDurations);

            // Nếu salaryPara có giá trị, thêm vào câu truy vấn
            if (salaryPara != null && !salaryPara.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(salaryPara));
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                int postID = rs.getInt(1);
                int userID = rs.getInt(2);
                String title = rs.getString(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                String dateStartedDB = rs.getString(6);
                String timeDuration = rs.getString(7);
                String place = rs.getString(8);
                int salary = rs.getInt(9);
                String paymentTime = rs.getString(10);
                String requirements = rs.getString(11);
                String workType = rs.getString(12);
                int status = rs.getInt(13);

                Post p = new Post(postID, userID, title, description, img, dateStartedDB,
                        timeDuration, place, salary, paymentTime,
                        requirements, workType, status);
                l.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public PostDetail getPostbyID(int postID) {
        PostDetail p = new PostDetail();
        String sql = "SELECT p.PostID, p.UserID, u.Username, p.Title, p.Description, p.Img, "
                + "p.DateStarted, p.TimeDuration, p.Place, p.Salary, p.PaymentTime, "
                + "p.Requirements, w.TypeName, p.Status "
                + "FROM Post p "
                + "JOIN User u ON p.UserID = u.UserID "
                + "JOIN WorkType w ON p.WorkTypeID = w.WorkTypeID "
                + "WHERE p.PostID = ?;";

        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, postID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int postiD = rs.getInt(1);
                int userID = rs.getInt(2);
                String userName = rs.getString(3);
                String title = rs.getString(4);
                String description = rs.getString(5);
                String img = rs.getString(6);
                String dateStarted = rs.getString(7);
                String timeDuration = rs.getString(8);
                String place = rs.getString(9);
                int salary = rs.getInt(10);
                String paymentTime = rs.getString(11);
                String requiremnts = rs.getString(12);
                String workType = rs.getString(13);
                int status = rs.getInt(14);
                p = new PostDetail(postiD, userID, userName, title, description, img, dateStarted, timeDuration, place, salary, paymentTime, requiremnts, workType, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public boolean checkAvaliblePost(int userID) {
        String sql = "SELECT COUNT(*) AS PostCount \n"
                + "FROM Post \n"
                + "WHERE userID = ?;";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int postCount = rs.getInt(1);
                if (postCount < 2) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void createNewPost(int userID, int workTypeID, String title, String description, String img, String dateStarted, String timeDuration, String place, int salary, String paymentTime, String requirements, int status) {
        String sql = "INSERT INTO Post (UserID, WorkTypeID, Title, Description, Img, DateStarted, TimeDuration, Place, Salary, PaymentTime, Requirements, Status)  \n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, workTypeID);
            ps.setString(3, title);
            ps.setString(4, description);
            ps.setString(5, img);
            ps.setString(6, dateStarted);
            ps.setString(7, timeDuration);
            ps.setString(8, place);
            ps.setInt(9, salary);
            ps.setString(10, paymentTime);
            ps.setString(11, requirements);
            ps.setInt(12, status);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Post> getPostByUserID(int useriD) {
        String sql = "SELECT p.PostID, p.UserID, p.Title, p.Description, p.Img, \n"
                + "       p.DateStarted, p.TimeDuration, p.Place, p.Salary, \n"
                + "       p.PaymentTime, p.Requirements, w.TypeName, p.Status\n"
                + "FROM Post p\n"
                + "JOIN WorkType w ON p.WorkTypeID = w.WorkTypeID\n"
                + "WHERE p.UserID = ?;";
        List<Post> l = new ArrayList<>();
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, useriD);
            rs = ps.executeQuery();
            while (rs.next()) {
                int postID = rs.getInt(1);
                int userID = rs.getInt(2);
                String title = rs.getString(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                String dateStarted = rs.getString(6);
                String timeDuration = rs.getString(7);
                String place = rs.getString(8);
                int salary = rs.getInt(9);
                String paymentTime = rs.getString(10);
                String requirements = rs.getString(11);
                String workType = rs.getString(12);
                int status = rs.getInt(13);

                Post p = new Post(postID, userID, title, description, img, dateStarted,
                        timeDuration, place, salary, paymentTime,
                        requirements, workType, status);
                l.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public void inactivePost(int postID) {
        String sql = "UPDATE Post SET Status=0 WHERE PostID=?";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, postID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DaoPost d = new DaoPost();
        List<Post> l = d.getAllPostActive("", "", "", "800000");
        System.out.println(l.isEmpty());
    }
}
