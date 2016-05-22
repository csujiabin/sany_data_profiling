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
import domain.EquipAvgStd;

public class DistributionBusiness {
    
    private static final Log logger = LogFactory
            .getLog(DistributionBusiness.class);
    
    
    public List<EquipAvgStd> readAvgStd() {
        logger.info("readAvgStd called");
        
        List<EquipAvgStd> avgStdList = new ArrayList<EquipAvgStd>();
        try {
            BufferedReader in = 
                    new BufferedReader(
                    new InputStreamReader(
                    new FileInputStream(Resources.EQUIP_AVG_STD_FILE), "gbk"));
            String line = in.readLine();
            while ((line = in.readLine()) != null) {
                logger.debug("LINE: " + line);
                String[] columns = line.trim().split(",");
                if (columns.length == 5) {
                    if ("NAN".equals(columns[1]) || "NaN".equals(columns[2])) {
                        continue;
                    }
                    double avg = Double.parseDouble(columns[1]);
                    double std = Double.parseDouble(columns[2]);
                    double max = Double.parseDouble(columns[3]);
                    double min = Double.parseDouble(columns[4]);
                    logger.info(columns[0] + ", " + columns[1] + ", " + columns[2]);
                    EquipAvgStd alignData = new EquipAvgStd(
                            columns[0],  
                            Math.round(avg * 100) / 100.0,
                            Math.round(std * 100) / 100.0,
                            Math.round(max * 100) / 100.0,
                            Math.round(min * 100) / 100.0); //保留两位小数
                    avgStdList.add(alignData);
                }
            }
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return avgStdList;
    }
    
}
