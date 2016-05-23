package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import business.DimBusiness;
import domain.ParaAttributes;

@Controller
public class DimensionController {
    
    private static final Log logger = LogFactory
            .getLog(DimensionController.class);
    
    @RequestMapping(value="/getParaAttributes")
    @ResponseBody
    public String getParaAttributes(HttpServletRequest request) {
        logger.info("getParaAttributes called");
        
        List<ParaAttributes> paraAttriList = new DimBusiness()
                .readParaAttributes();
        
        JSONArray jsonarray = JSONArray.fromObject(paraAttriList);
        return jsonarray.toString();
    }
    
}
