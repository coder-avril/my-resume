package com.lding.resume.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lding.resume.domain.Experience;
import com.lding.resume.service.CompanyService;
import com.lding.resume.service.ExperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class ExperienceController extends BaseController {
    @Autowired
    private ExperienceService experienceService;

    @Autowired
    private CompanyService companyService;

    @GetMapping("/experience")
    public ModelAndView experience() {
        // 设置数据
        ModelAndView view = new ModelAndView();
        view.addObject("experiences", this.experienceService.getAll());
        view.addObject("companies", this.companyService.getAll());
        view.setViewName("experience");
        return view;
    }

    @PostMapping("/experience/save")
    public String saveExperience(@RequestBody Experience experience) throws JsonProcessingException {
        Map<String, Object> result = new HashMap<>();
        try {
            this.experienceService.save(experience);
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "工作经验保存失败: " + e.getMessage());
        }
        return new ObjectMapper().writeValueAsString(result);
    }

    @PostMapping("/experience/remove")
    public String removeExperience(@RequestBody Experience experience) throws JsonProcessingException {
        // 设置数据
        Map<String, Object> result = new HashMap<>();
        try {
            this.experienceService.remove(experience.getId());
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "工作经验删除失败");
        }
        return new ObjectMapper().writeValueAsString(result);
    }
}
