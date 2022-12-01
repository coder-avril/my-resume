package com.lding.resume.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lding.resume.domain.Website;
import com.lding.resume.service.WebsiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.Map;

/**
 * '@RestController
 * 将 Controller 的方法返回的对象，通过适当的转换器转换为指定的格式之后，写入到HTTP 响应(Response)对象的 body 中，
 * 通常用来返回 JSON 或者 XML 数据，返回 JSON 数据的情况比较多
 */
@RestController
@RequestMapping("/admin")
public class WebsiteController {
    @Autowired
    private WebsiteService websiteService;

    @GetMapping("/website")
    public ModelAndView website() {
        // 设置数据
        ModelAndView view = new ModelAndView();
        view.addObject("website", this.websiteService.get());
        view.setViewName("website");
        return view;
    }

    @PostMapping("/website/save")
    public String save(@RequestBody Website website) throws JsonProcessingException {
        // 设置数据
        Map<String, Object> result = new HashMap<>();
        if (this.websiteService.save(website)) {
            result.put("success", true);
            result.put("message", "网站信息保存成功");
        } else {
            result.put("success", false);
            result.put("message", "网站信息保存失败");
        }
        return new ObjectMapper().writeValueAsString(result);
    }
}
