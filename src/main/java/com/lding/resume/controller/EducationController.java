package com.lding.resume.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lding.resume.domain.Education;
import com.lding.resume.service.EducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class EducationController extends BaseController {
    @Autowired
    private EducationService educationService;

    @GetMapping("/education")
    public ModelAndView education() {
        // 设置数据
        ModelAndView view = new ModelAndView();
        view.addObject("educations", this.educationService.getAll());
        view.setViewName("education");
        return view;
    }

    @PostMapping("/education/save")
    public String saveEducation(@RequestBody Education education) throws JsonProcessingException {
        Map<String, Object> result = new HashMap<>();
        try {
            this.educationService.save(education);
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "教育经验保存失败: " + e.getMessage());
        }
        return new ObjectMapper().writeValueAsString(result);
    }

    @PostMapping("/education/remove")
    public String removeEducation(@RequestBody Education education) throws JsonProcessingException {
        // 设置数据
        Map<String, Object> result = new HashMap<>();
        try {
            this.educationService.remove(education.getId());
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "教育经验删除失败");
        }
        return new ObjectMapper().writeValueAsString(result);
    }
}
