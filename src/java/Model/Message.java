/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author sontu
 */
public class Message {
    private int messID;
    private int senderID;
    private int receiverID;
    private int postID;
    private String content;

    public Message() {
    }

    public Message(int messID, int senderID, int receiverID, int postID, String content) {
        this.messID = messID;
        this.senderID = senderID;
        this.receiverID = receiverID;
        this.postID = postID;
        this.content = content;
    }

    public int getMessID() {
        return messID;
    }

    public void setMessID(int messID) {
        this.messID = messID;
    }

    public int getSenderID() {
        return senderID;
    }

    public void setSenderID(int senderID) {
        this.senderID = senderID;
    }

    public int getReceiverID() {
        return receiverID;
    }

    public void setReceiverID(int receiverID) {
        this.receiverID = receiverID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
}
