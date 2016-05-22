package controller;

import java.util.List;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import business.DistributionBusiness;
import domain.EquipAvgStd;

@Controller
public class DistributionController {
    
    private static final Log logger = LogFactory
            .getLog(DistributionController.class);
    
    @RequestMapping(value="/getAvgStd")
    @ResponseBody
    public String getAvgStd() {
        logger.info("getAvgStd called");
        
        List<EquipAvgStd>  avgStdList = new DistributionBusiness().readAvgStd();
        JSONArray jsonarray = JSONArray.fromObject(avgStdList);
        logger.info(jsonarray.toString());
        return jsonarray.toString();
    }
    
}
