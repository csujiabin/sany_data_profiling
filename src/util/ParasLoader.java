package util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import config.Resources;

public class ParasLoader {
    
    private static final Log logger = LogFactory.getLog(ParasLoader.class);

    /**
     * 从文件中读取参数ID和名称
     * @return
     */
    public static Map<String, String> loadParas() {
        logger.info("loadParas called");
        Map<String, String> paraMap = new HashMap<String, String>();
        try {
            BufferedReader in = 
                    new BufferedReader(
                    new InputStreamReader(
                    new FileInputStream(Resources.PARA_FILE), "gbk"));
            String line = in.readLine();
            while ((line = in.readLine()) != null) {
                String[] tokens = line.trim().split(",");
                if (tokens.length > 2){
                    String paraID = tokens[0];
                    String paraName = tokens[2];
                    if (!paraID.isEmpty() && !paraName.isEmpty()) {
                        paraMap.put(paraID, paraName);
                    }
                }
            }
            in.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return paraMap;
    }
}
