package com.lding.resume.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lding.resume.domain.Password;
import com.lding.resume.domain.User;
import com.lding.resume.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;

    @GetMapping("/user")
    public ModelAndView user() {
        // 设置数据
        ModelAndView view = new ModelAndView();
        view.addObject("user", this.userService.get());
        view.setViewName("user");
        return view;
    }

    @GetMapping("/password")
    public ModelAndView password() {
        return new ModelAndView("password");
    }

    @PostMapping("/password/save")
    public String savePassword(@RequestBody Password password) throws JsonProcessingException {
        Map<String, Object> result = new HashMap<>();
        // 检查旧密码是否正确
        User user = this.userService.get();
        if (!password.getOldPassword().equals(user.getPassword())) {
            result.put("success", false);
            result.put("message", "旧密码不正确");
        } else {
            // 更新新密码
            user.setPassword(password.getNewPassword());
            try {
                this.userService.save(user);
                result.put("success", true);
            } catch (Exception e) {
                setErrMsg(result, "密码更新失败: " + e.getMessage());
            }
        }
        return new ObjectMapper().writeValueAsString(result);
    }

    @PostMapping("/user/save")
    public ModelAndView saveUser(User user, MultipartFile photoFile) throws IOException {
        // 设置数据
        ModelAndView view = new ModelAndView();
        user.setPhoto(uploadImage(photoFile, user.getPhoto()));
        /* 在viewName前面加上"forward:"或"redirect:" 可以排除InternalResourceViewResolver的影响 */
        if (this.userService.save(user)) {
            view.setViewName("redirect:/admin/user");
        } else {
            view.setViewName("forward:/WEB-INF/other/error.jsp");
        }
        return view;
    }
}
