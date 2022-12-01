package com.lding.resume.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lding.resume.domain.Skill;
import com.lding.resume.service.SkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class SkillController extends BaseController {
    @Autowired
    private SkillService skillService;

    @GetMapping("/skill")
    public ModelAndView skill() {
        // 设置数据
        ModelAndView view = new ModelAndView();
        view.addObject("skills", this.skillService.getAll());
        view.setViewName("skill");
        return view;
    }

    @PostMapping("/skill/save")
    public String saveSkill(@RequestBody Skill skill) throws JsonProcessingException {
        Map<String, Object> result = new HashMap<>();
        try {
            this.skillService.save(skill);
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "技能信息保存失败: " + e.getMessage());
        }
        return new ObjectMapper().writeValueAsString(result);
    }

    @PostMapping("/skill/remove")
    public String removeSkill(@RequestBody Skill skill) throws JsonProcessingException {
        // 设置数据
        Map<String, Object> result = new HashMap<>();
        try {
            this.skillService.remove(skill.getId());
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "技能信息删除失败: " + e.getMessage());
        }
        return new ObjectMapper().writeValueAsString(result);
    }
}
