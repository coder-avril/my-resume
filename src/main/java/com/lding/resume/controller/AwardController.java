package com.lding.resume.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lding.resume.domain.Award;
import com.lding.resume.service.AwardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class AwardController extends BaseController {
    @Autowired
    private AwardService awardService;

    @GetMapping("/award")
    public ModelAndView award() {
        // 设置数据
        ModelAndView view = new ModelAndView();
        view.addObject("awards", this.awardService.getAll());
        view.setViewName("award");
        return view;
    }

    @PostMapping("/award/save")
    public String saveAward(Award award, MultipartFile imageFile) throws IOException {
        Map<String, Object> result = new HashMap<>();
        award.setImage(uploadImage(imageFile, award.getImage()));
        // 更新新密码
        try {
            this.awardService.save(award);
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "获奖成就更新失败: " + e.getMessage());
        }
        return new ObjectMapper().writeValueAsString(result);
    }

    @PostMapping("/award/remove")
    public String removeAward(@RequestBody Award award) throws IOException {
        // 设置数据
        Map<String, Object> result = new HashMap<>();
        try {
            this.awardService.remove(award.getId());
            deleteOldFile(award.getImage());
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "获奖成就删除失败");
        }
        return new ObjectMapper().writeValueAsString(result);
    }
}
