/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.WorkType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sontu
 */
public class DaoWorkType {

    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private Connection connection = null;
    public List<WorkType> getAllWorkType(){
        List<WorkType> l = new ArrayList<>();
        String sql = "SELECT WorkTypeID, TypeName FROM WorkType";
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int workTypeID = rs.getInt(1);
                String workName = rs.getString(2);
                WorkType w = new WorkType(workTypeID, workName);
                l.add(w);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }
    public int changeWorkNametoID(String WorkName){
        String sql ="SELECT WorkTypeID FROM WorkType WHERE TypeName = ?;";
        int workTypeID =0;
        try {
            connection = new DBContext().connection;
            ps = connection.prepareStatement(sql);
            ps.setString(1, WorkName);
            rs = ps.executeQuery();
            while (rs.next()) {
                workTypeID = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return workTypeID;
    }
    public static void main(String[] args) {
        DaoWorkType d = new DaoWorkType();
        System.out.println(d.changeWorkNametoID("Công việc toàn thời gian"));
    }
}
