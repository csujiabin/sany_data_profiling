package util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import config.Resources;

public class EquipsLoader {
    
    private static final Log logger = LogFactory.getLog(EquipsLoader.class);

    /**
     * 从文件中读取设备列表
     * @return
     */
    public static List<String> loadEquips() {
        logger.info("loadEquips called");
        List<String> equipList = new ArrayList<String>();
        try {
            BufferedReader in = 
                    new BufferedReader(
                    new InputStreamReader(
                    new FileInputStream(Resources.EQUIP_FILE), "gbk"));
            String line = "";
            while ((line = in.readLine()) != null) {
                String equip = line.trim();
                if (!equip.isEmpty()) {
                    equipList.add(line.trim()); 
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
        return equipList;
    }
}
