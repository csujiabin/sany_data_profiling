package business;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import config.Resources;
import domain.TimeAlignData;
import domain.TimeAlignDataByEquip;

public class TimeAlignBusiness {
    
    private static final Log logger = LogFactory
            .getLog(TimeAlignBusiness.class);
    
    
    public List<TimeAlignData> readAlignData() {
        logger.info("readAlignData called");
        List<TimeAlignData> alignDataList = new ArrayList<TimeAlignData>();
        try {
            BufferedReader in = 
                    new BufferedReader(
                    new InputStreamReader(
                    new FileInputStream(Resources.TIME_ALIGN_FILE), "gbk"));
            String line = in.readLine();
            while ((line = in.readLine()) != null) {
                logger.debug("LINE: " + line);
                String[] columns = line.trim().split(",");
                if (columns.length == 5) {
                    double alignRate = Double.parseDouble(columns[4]);
                    TimeAlignData alignData = new TimeAlignData(
                            columns[0],columns[1], 
                            Integer.parseInt(columns[2]), 
                            Integer.parseInt(columns[3]), 
                            Math.round(alignRate * 10000) / 10000.0); //保留四位小数
                    alignDataList.add(alignData);
                }
            }
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return alignDataList;
    }
    
    
    public List<TimeAlignDataByEquip> readAlignDataByEquip() {
        logger.info("readAlignData called");
        List<TimeAlignDataByEquip> alignDataList = new ArrayList<TimeAlignDataByEquip>();
        try {
            BufferedReader in = 
                    new BufferedReader(
                    new InputStreamReader(
                    new FileInputStream(Resources.EQUIP_TIME_ALIGN_FILE), "gbk"));
            String line = in.readLine();
            while ((line = in.readLine()) != null) {
                logger.debug("LINE: " + line);
                String[] columns = line.trim().split(",");
                if (columns.length == 4) {
                    double alignRate = Double.parseDouble(columns[3]);
                    TimeAlignDataByEquip alignData = new TimeAlignDataByEquip(
                            columns[0], 
                            Integer.parseInt(columns[1]), 
                            Integer.parseInt(columns[2]), 
                            Math.round(alignRate * 10000) / 10000.0); //保留四位小数
                    alignDataList.add(alignData);
                }
            }
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return alignDataList;
    }
}
