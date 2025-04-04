/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;


/**
 *
 * @author sontu
 */
public class User {
    private int userID;
    private String userName;
    private String password;
    private String email;
    private String fullName;
    private String phone;
    private String img;
    private String userType;
    private String CCCDFront;
    private String CCCDBack;
    private int status;

    public User() {
    }

    public User(int userID, String userName, String password, String email, String fullName, String phone, String img, String userType, String CCCDFront, String CCCDBack, int status) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
        this.phone = phone;
        this.img = img;
        this.userType = userType;
        this.CCCDFront = CCCDFront;
        this.CCCDBack = CCCDBack;
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getCCCDFront() {
        return CCCDFront;
    }

    public void setCCCDFront(String CCCDFront) {
        this.CCCDFront = CCCDFront;
    }

    public String getCCCDBack() {
        return CCCDBack;
    }

    public void setCCCDBack(String CCCDBack) {
        this.CCCDBack = CCCDBack;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
}
