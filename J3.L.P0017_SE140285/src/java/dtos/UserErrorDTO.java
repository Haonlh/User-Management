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
public class UserErrorDTO implements Serializable{
    private String userIDError;
    private String passwordError;
    private String confirmError;
    private String userNameError;
    private String emailError;
    private String phoneError;
    private String photoError;

    public UserErrorDTO() {
    }

    
    
    public UserErrorDTO(String userIDError, String passwordError, String confirmError, String userNameError, String emailError, String phoneError, String photoError) {
        this.userIDError = userIDError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.userNameError = userNameError;
        this.emailError = emailError;
        this.phoneError = phoneError;
        this.photoError = photoError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getUserNameError() {
        return userNameError;
    }

    public void setUserNameError(String userNameError) {
        this.userNameError = userNameError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getPhotoError() {
        return photoError;
    }

    public void setPhotoError(String photoError) {
        this.photoError = photoError;
    }
    
    
    
    
}
