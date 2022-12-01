package com.lding.resume.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lding.resume.domain.User;
import com.lding.resume.service.*;
import com.wf.captcha.utils.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * '@RestController
 * 将 Controller 的方法返回的对象，通过适当的转换器转换为指定的格式之后，写入到HTTP 响应(Response)对象的 body 中，
 * 通常用来返回 JSON 或者 XML 数据，返回 JSON 数据的情况比较多
 */
@RestController
@RequestMapping("/front")
public class LoginController extends BaseController {
    @Autowired
    private UserService userService;
    @Autowired
    private SkillService skillService;
    @Autowired
    private AwardService awardService;
    @Autowired
    private WebsiteService websiteService;
    @Autowired
    private EducationService educationService;
    @Autowired
    private ExperienceService experienceService;
    @Autowired
    private ProjectService projectService;

    @GetMapping("/captcha")
    public void captcha(HttpServletRequest request,
                        HttpServletResponse response) throws Exception {
        // 不使用文件目录缓存，使用内存缓存（解决异常Can't create cache file
        ImageIO.setUseCache(false);
        CaptchaUtil.out(request, response);
    }

    @PostMapping("/login")
    public String login(String captcha, String email, String password, HttpServletRequest request) throws Exception {
        // 创建返回用数据
        Map<String, Object> result = new HashMap<>();
        if (CaptchaUtil.ver(captcha, request)) {
            // 检查用户名、密码
            User user = new User();
            user.setEmail(email);
            user.setPassword(password);
            user = this.userService.getByUser(user);
            if (user != null) {
                // 将用户信息存入Session中
                request.getSession().setAttribute("user", user);
                result.put("success", true);
            } else {
                setErrMsg(result, "邮件地址或者密码不正确");
            }
        } else {
            setErrMsg(result, "验证码不正确");
        }
        // 返回json
        return new ObjectMapper().writeValueAsString(result);
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpServletRequest request) {
        // 设置数据
        ModelAndView view = new ModelAndView();
        request.getSession().setAttribute("user", null);
        view.setViewName("forward:/index.jsp");
        return view;
    }

    @GetMapping("/user")
    public ModelAndView user() throws Exception {
        // 设置数据
        ModelAndView view = new ModelAndView();
        // 用户信息
        User user = this.userService.get();
        view.addObject("user", user);
        // 个人特质
        view.addObject("trait", user.getTrait().split(","));
        // 兴趣爱好
        view.addObject("interests", user.getInterests().split(","));
        // 专业技能
        view.addObject("skills", this.skillService.getAll());
        // 获奖成就
        view.addObject("awards", this.awardService.getAll());
        // 网站的底部信息
        view.addObject("footer", this.websiteService.get().getFooter());

        view.setViewName("forward:/WEB-INF/front/user.jsp");
        return view;
    }

    @GetMapping("/education")
    public ModelAndView education() throws Exception {
        // 设置数据
        ModelAndView view = new ModelAndView();
        // 用户信息
        User user = this.userService.get();
        view.addObject("user", user);
        // 网站的底部信息
        view.addObject("footer", this.websiteService.get().getFooter());
        // 教育经验
        view.addObject("educations", this.educationService.getAll());

        view.setViewName("forward:/WEB-INF/front/education.jsp");
        return view;
    }

    @GetMapping("/experience")
    public ModelAndView experience() throws Exception {
        // 设置数据
        ModelAndView view = new ModelAndView();
        // 用户信息
        User user = this.userService.get();
        view.addObject("user", user);
        // 网站的底部信息
        view.addObject("footer", this.websiteService.get().getFooter());
        // 工作经验
        view.addObject("experiences", this.experienceService.getAll());

        view.setViewName("forward:/WEB-INF/front/experience.jsp");
        return view;
    }

    @GetMapping("/project")
    public ModelAndView project() throws Exception {
        // 设置数据
        ModelAndView view = new ModelAndView();
        // 用户信息
        User user = this.userService.get();
        view.addObject("user", user);
        // 网站的底部信息
        view.addObject("footer", this.websiteService.get().getFooter());
        // 项目成就
        view.addObject("projects", this.projectService.getAll());

        view.setViewName("forward:/WEB-INF/front/project.jsp");
        return view;
    }

    @GetMapping("/contact")
    public ModelAndView contact() throws Exception {
        // 设置数据
        ModelAndView view = new ModelAndView();
        // 用户信息
        User user = this.userService.get();
        view.addObject("user", user);
        // 网站的底部信息
        view.addObject("footer", this.websiteService.get().getFooter());

        view.setViewName("forward:/WEB-INF/front/contact.jsp");
        return view;
    }
}
