package controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoLogicController {
    
    private static final Log logger = LogFactory
            .getLog(NoLogicController.class);
    
    @RequestMapping(value="/dashboard")
    public String goDashboard() {
        logger.info("goDashboard called");
        return "dashboard";
    }
    
    @RequestMapping(value="/dimension")
    public String goDimension() {
        logger.info("goDimension called");
        return "dimension";
    }
    
    @RequestMapping(value="/dimension-2")
    public String goDimension2() {
        logger.info("goDimension2 called");
        return "dimension-2";
    }
    
    @RequestMapping(value="/time-align")
    public String goTimeAlign() {
        logger.info("goTimeAlign called");
        return "time-align";
    }
    
    @RequestMapping(value="/time-align-equip")
    public String goTimeAlignByEquip() {
        logger.info("goTimeAlignByEquip called");
        return "time-align-result-equip";
    }
    
    @RequestMapping(value="/distribution")
    public String goDistribution() {
        logger.info("goDistribution called");
        return "distribution";
    }
}
