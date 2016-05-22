package domain;

import java.io.Serializable;

public class EquipAvgStd implements Serializable {
    private static final long serialVersionUID = -3796702248784782592L;
    
    private String equip;
    private double avg;
    private double std;
    private double max;
    private double min;
    
    public EquipAvgStd() {
    }

    public EquipAvgStd(String equip, double avg, double std) {
        super();
        this.equip = equip;
        this.avg = avg;
        this.std = std;
    }
    
    public EquipAvgStd(String equip, double avg, double std, double max,
            double min) {
        super();
        this.equip = equip;
        this.avg = avg;
        this.std = std;
        this.max = max;
        this.min = min;
    }

    public String getEquip() {
        return equip;
    }

    public void setEquip(String equip) {
        this.equip = equip;
    }

    public double getAvg() {
        return avg;
    }

    public void setAvg(double avg) {
        this.avg = avg;
    }

    public double getStd() {
        return std;
    }

    public void setStd(double std) {
        this.std = std;
    }
    
    public double getMax() {
        return max;
    }

    public void setMax(double max) {
        this.max = max;
    }

    public double getMin() {
        return min;
    }

    public void setMin(double min) {
        this.min = min;
    }
}
