/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author sontu
 */
public class WorkType {
    private int workTypeID;
    private String typeName;

    public WorkType() {
    }

    public WorkType(int workTypeID, String typeName) {
        this.workTypeID = workTypeID;
        this.typeName = typeName;
    }

    public int getWorkTypeID() {
        return workTypeID;
    }

    public void setWorkTypeID(int workTypeID) {
        this.workTypeID = workTypeID;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    
}
