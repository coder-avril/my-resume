package com.lding.resume.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lding.resume.domain.Company;
import com.lding.resume.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class CompanyController extends BaseController {
    @Autowired
    private CompanyService companyService;

    @GetMapping("/company")
    public ModelAndView company() {
        // 设置数据
        ModelAndView view = new ModelAndView();
        view.addObject("companies", this.companyService.getAll());
        view.setViewName("company");
        return view;
    }

    @PostMapping("/company/save")
    public String saveCompany(@RequestBody Company company) throws JsonProcessingException {
        Map<String, Object> result = new HashMap<>();
        try {
            this.companyService.save(company);
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "公司信息保存失败: " + e.getMessage());
        }
        return new ObjectMapper().writeValueAsString(result);
    }

    @PostMapping("/company/remove")
    public String removeCompany(@RequestBody Company company) throws JsonProcessingException {
        // 设置数据
        Map<String, Object> result = new HashMap<>();
        try {
            this.companyService.remove(company.getId());
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "公司信息删除失败: " + e.getMessage());
        }
        return new ObjectMapper().writeValueAsString(result);
    }
}
