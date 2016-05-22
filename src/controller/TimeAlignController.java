package controller;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import config.Resources;
import business.TimeAlignBusiness;
import util.EquipsLoader;
import util.ParasLoader;
import domain.TimeAlignData;
import domain.TimeAlignDataByEquip;
import form.TimeAlignForm;

@Controller
public class TimeAlignController {
    
    private static final Log logger = LogFactory.getLog(TimeAlignController.class);
    
    
    @RequestMapping(value="/getParas")
    @ResponseBody
    public String getParas() {
        logger.info("getParas called");
        
        Map<String, String> paraMap = ParasLoader.loadParas();
        
        JSONArray jsonarray = JSONArray.fromObject(paraMap);
        return jsonarray.toString();
    }
    
    
    @RequestMapping(value="/getEquips")
    @ResponseBody
    public String getEquips() {
        logger.info("getEquips called");
        
        List<String> equipList = EquipsLoader.loadEquips();
        
        JSONArray jsonarray = JSONArray.fromObject(equipList);
        return jsonarray.toString();
    }
    
    
    @RequestMapping(value="/goEquipSelection")
    public String goEquipSelection(TimeAlignForm timeAlignForm, Model model) {
        logger.info("goEquipSelection called");
        
        List<String> selectedParaList = timeAlignForm.getParaList();
        if (selectedParaList != null) {
            for (String para : selectedParaList) {
                System.out.println("select para: " + para);
            }
        }
        
        return "time-align-2";
    }
    
    
    @RequestMapping(value="/goAlignResult")
    public String goAlignResult(TimeAlignForm timeAlignForm, Model model) {
        logger.info("goAlignResult called");
        
        List<String> selectedEquipList = timeAlignForm.getEquipList();
        if (selectedEquipList != null) {
            for (String equip : selectedEquipList) {
                System.out.println("select para: " + equip);
            }
        }
        
        return "time-align-result";
    }
    
    
    @RequestMapping(value="/getAlignData")
    @ResponseBody
    public String getAlignData() {
        logger.info("getAlignData called");
        
        List<TimeAlignData> alignDataList = new TimeAlignBusiness()
                .readAlignData();
        
        JSONArray jsonarray = JSONArray.fromObject(alignDataList);
        return jsonarray.toString();
    }
    
    
    @RequestMapping(value="/getAlignDataByEquip")
    @ResponseBody
    public String getAlignDataByEquip() {
        logger.info("getAlignDataByEquip called");
        
        List<TimeAlignDataByEquip> alignDataList = new TimeAlignBusiness()
                .readAlignDataByEquip();
        
        JSONArray jsonarray = JSONArray.fromObject(alignDataList);
        return jsonarray.toString();
    }
}
