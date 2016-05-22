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
import domain.ParaAttributes;

public class DimBusiness {
    
    private static final Log logger = LogFactory
            .getLog(DimBusiness.class);
    
    
    public List<ParaAttributes> readParaAttributes() {
        logger.info("readParaAttributes called");
        List<ParaAttributes> paraAttriList = new ArrayList<ParaAttributes>();
        try {
            BufferedReader in = 
                    new BufferedReader(
                    new InputStreamReader(
                    new FileInputStream(Resources.PARA_ATTRI_FILE), "gbk"));
            String line = in.readLine();
            while ((line = in.readLine()) != null) {
                logger.debug("LINE: " + line);
                String[] columns = line.trim().split(",");
                if (columns.length == 5) {
                    ParaAttributes paraAttri = new ParaAttributes(
                            columns[0],columns[1], columns[2], columns[3], 
                            Integer.parseInt(columns[4]));
                    paraAttriList.add(paraAttri);
                }
            }
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return paraAttriList;
    }
}
