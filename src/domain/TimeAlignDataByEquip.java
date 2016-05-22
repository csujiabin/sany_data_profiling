package domain;

import java.io.Serializable;

public class TimeAlignDataByEquip implements Serializable {
    private static final long serialVersionUID = -8765801159843889186L;
    
    private String equip;
    private int totalCount;
    private int alignedCount;
    private double alignedRate;
    
    public TimeAlignDataByEquip() {
    }
    
    public TimeAlignDataByEquip(String equip, int totalCount, int alignedCount,
            double alignedRate) {
        super();
        this.equip = equip;
        this.totalCount = totalCount;
        this.alignedCount = alignedCount;
        this.alignedRate = alignedRate;
    }

    public String getEquip() {
        return equip;
    }

    public void setEquip(String equip) {
        this.equip = equip;
    }

    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
    public int getAlignedCount() {
        return alignedCount;
    }
    public void setAlignedCount(int alignedCount) {
        this.alignedCount = alignedCount;
    }
    public double getAlignedRate() {
        return alignedRate;
    }
    public void setAlignedRate(double alignedRate) {
        this.alignedRate = alignedRate;
    }
}
