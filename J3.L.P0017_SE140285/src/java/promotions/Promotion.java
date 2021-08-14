/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package promotions;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author HoaiHao
 */
public class Promotion implements Serializable{
    private Map<String, Float> items;

    public Promotion() {
    }

    public Promotion(Map<String, Float> items) {
        this.items = items;
    }
    
    public boolean addUserToPromotionList(String userID, float userRank) {
        
        if (this.getItems() == null) {
            this.setItems(new HashMap<>());
        }
        
        if (!(this.items.containsKey(userID))) {
            this.getItems().put(userID, userRank);
            return true;
        }
        
        return false;
        
    }
    
    public void updateUserRank(String userID, float userRank) {
        
        if (this.getItems() == null) {
            return;
        }
        
        this.getItems().replace(userID, userRank);
        
    }
    
    public void removeUserToPromotionList(String userID) {
        if (this.getItems() == null) {
            return;
        }
        
        if (this.getItems().containsKey(userID)) {
            this.getItems().remove(userID);
            if (this.getItems().isEmpty()) {
                this.setItems(null);
            }
        }
    }

    /**
     * @return the items
     */
    public Map<String, Float> getItems() {
        return items;
    }

    /**
     * @param items the items to set
     */
    public void setItems(Map<String, Float> items) {
        this.items = items;
    }
    
}
