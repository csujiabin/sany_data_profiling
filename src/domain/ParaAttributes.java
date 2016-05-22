package domain;

import java.io.Serializable;

public class ParaAttributes implements Serializable {
    private static final long serialVersionUID = 5616455631345772754L;
    
    private String paraID;
    private String paraName;
    private String valueType;
    private String paraType;
    private int equipCount;
    
    public ParaAttributes() {
    }
    
    public ParaAttributes(String paraID, String paraName, String valueType,
            String paraType, int equipCount) {
        super();
        this.paraID = paraID;
        this.paraName = paraName;
        this.valueType = valueType;
        this.paraType = paraType;
        this.equipCount = equipCount;
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
    public String getValueType() {
        return valueType;
    }
    public void setValueType(String valueType) {
        this.valueType = valueType;
    }
    public String getParaType() {
        return paraType;
    }
    public void setParaType(String paraType) {
        this.paraType = paraType;
    }
    public int getEquipCount() {
        return equipCount;
    }
    public void setEquipCount(int equipCount) {
        this.equipCount = equipCount;
    }
}
