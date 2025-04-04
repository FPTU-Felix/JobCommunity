/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Comment;
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
public class DaoComment extends DBContext {

    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private Connection connection = null;

    public List<Comment> getCommentbyPostID(int postID) {
        List<Comment> l = new ArrayList<>();
        String sql = "SELECT \n"
                + "    c.CommentID, \n"
                + "    c.PostID, \n"
                + "    c.UserID, \n"
                + "    u.Username, \n"
                + "    u.Img, \n"
                + "    c.Content, \n"
                + "    c.CreatedAt\n"
                + "FROM Comment c\n"
                + "JOIN User u ON c.UserID = u.UserID\n"
                + "where PostID =?;";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, postID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int commentID = rs.getInt(1);
                int postiD = rs.getInt(2);
                int userID = rs.getInt(3);
                String userName = rs.getString(4);
                String img = rs.getString(5);
                String content = rs.getString(6);
                Date createdAt = rs.getDate(7);
                Comment c = new Comment(commentID, postiD, userID, userName, img, content, createdAt);
                l.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public void commentInPost(int postID, int userID, String comment) {
        String sql = "INSERT INTO Comment (PostID, UserID, Content, CreatedAt) \n"
                + "VALUES (?, ?, ?, NOW());";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, postID);
            ps.setInt(2, userID);
            ps.setString(3, comment);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DaoComment d = new DaoComment();
        d.commentInPost(1, 1, "a");
    }
}
