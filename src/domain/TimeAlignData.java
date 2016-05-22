package domain;

import java.io.Serializable;

public class TimeAlignData implements Serializable {
    private static final long serialVersionUID = -8765801159843889186L;
    
    private String paraID;
    private String paraName;
    private int totalCount;
    private int alignedCount;
    private double alignedRate;
    
    public TimeAlignData() {
    }
    
    public TimeAlignData(String paraID, String paraName, int totalCount,
            int alignedCount, double alignedRate) {
        super();
        this.paraID = paraID;
        this.paraName = paraName;
        this.totalCount = totalCount;
        this.alignedCount = alignedCount;
        this.alignedRate = alignedRate;
    }
    
    public String getParaID() {
        return paraID;
    }
    public void setParaID(String paraID) {
        this.paraID = paraID;
    }
    public String getParaName() {
        return paraName;
    }
    public void setParaName(String paraName) {
        this.paraName = paraName;
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
