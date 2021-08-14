/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;

/**
 *
 * @author HoaiHao
 */
public class PromotionDTO implements Serializable{
    private int promotionID;
    private String userID;
    private String photo;
    private String userName;
    private float userRank;
    private String createDate;

    public PromotionDTO() {
    }

    public PromotionDTO(int promotionID, String userID, String photo, String userName, float userRank, String createDate) {
        this.promotionID = promotionID;
        this.userID = userID;
        this.photo = photo;
        this.userName = userName;
        this.userRank = userRank;
        this.createDate = createDate;
    }

    public int getPromotionID() {
        return promotionID;
    }

    public void setPromotionID(int promotionID) {
        this.promotionID = promotionID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public float getUserRank() {
        return userRank;
    }

    public void setUserRank(float userRank) {
        this.userRank = userRank;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    
    
    
}
