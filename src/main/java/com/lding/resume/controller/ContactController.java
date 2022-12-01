package com.lding.resume.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lding.resume.domain.Contact;
import com.lding.resume.domain.ContactRequest;
import com.lding.resume.domain.ContactResponse;
import com.lding.resume.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class ContactController extends BaseController{
    @Autowired
    private ContactService contactService;

    @GetMapping("/contact")
    public ModelAndView contact(ContactRequest input) {
        if (input.getPageNo() == null) {
            input.setPageNo(1);
        }
        if (input.getPageSize() == null) {
            input.setPageSize(10);
        }
        ContactResponse response = this.contactService.getAll(input);
        // 设置数据
        ModelAndView view = new ModelAndView();
        view.addObject("contacts", response.getContacts());
        view.addObject("totalCount", response.getTotalCount());
        view.addObject("totalPages", response.getTotalPages());
        view.addObject("searchInfo", response.getSearchInfo());
        view.setViewName("contact");
        return view;
    }
    @PostMapping("/contact/send")
    public String sendInfo(@RequestBody Contact contact) throws JsonProcessingException {
        Map<String, Object> result = new HashMap<>();
        if (contact.getName() == null || contact.getName().trim().equals("") ||
                contact.getEmail() == null || contact.getEmail().trim().equals("") ||
                contact.getSubject() == null || contact.getSubject().equals("")) {
            result.put("success", false);
            result.put("message", "发送失败！请检查姓名、邮件和消息内容，不可以为空！");
        } else {
            contact.setCreatedTime(new Date());
            try {
                this.contactService.save(contact);
                result.put("success", true);
            } catch (Exception e) {
                setErrMsg(result, "联系信息发送失败: " + e.getMessage());
            }
        }
        return new ObjectMapper().writeValueAsString(result);
    }
}
