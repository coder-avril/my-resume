package com.lding.resume.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lding.resume.domain.Project;
import com.lding.resume.service.CompanyService;
import com.lding.resume.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class ProjectController extends BaseController {
    @Autowired
    private ProjectService projectService;

    @Autowired
    private CompanyService companyService;

    @GetMapping("/project")
    public ModelAndView project() {
        // 设置数据
        ModelAndView view = new ModelAndView();
        view.addObject("projects", this.projectService.getAll());
        view.addObject("companies", this.companyService.getAll());
        view.setViewName("project");
        return view;
    }

    @PostMapping("/project/save")
    public String saveProject(Project project, MultipartFile imageFile) throws IOException {
        Map<String, Object> result = new HashMap<>();
        project.setImage(uploadImage(imageFile, project.getImage()));
        // 更新新密码
        try {
            this.projectService.save(project);
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "项目经验更新失败: " + e.getMessage());
        }
        return new ObjectMapper().writeValueAsString(result);
    }

    @PostMapping("/project/remove")
    public String removeProject(@RequestBody Project project) throws IOException {
        // 设置数据
        Map<String, Object> result = new HashMap<>();
        try {
            this.projectService.remove(project.getId());
            deleteOldFile(project.getImage());
            result.put("success", true);
        } catch (Exception e) {
            setErrMsg(result, "项目经验删除失败");
        }
        return new ObjectMapper().writeValueAsString(result);
    }
}
