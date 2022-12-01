package com.lding.resume.service.impl;

import com.github.pagehelper.PageHelper;
import com.lding.resume.dao.ContactDao;
import com.lding.resume.domain.Contact;
import com.lding.resume.domain.ContactRequest;
import com.lding.resume.domain.ContactResponse;
import com.lding.resume.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactServiceImpl implements ContactService {
    @Autowired
    private ContactDao dao;

    @Override
    public ContactResponse getAll(ContactRequest request) {
        ContactResponse response = new ContactResponse();
        int totalCount = this.dao.getAll(request).size();
        int pageSize = request.getPageSize();
        // 自动分页
        PageHelper.startPage(request.getPageNo(), request.getPageSize());
        List<Contact> contacts = this.dao.getAll(request);
        // 根据公式计算总件数和页面个数
        response.setTotalCount(totalCount);
        response.setTotalPages((totalCount + pageSize -1) / pageSize);
        response.setContacts(contacts);
        response.setSearchInfo(request);

        return response;
    }

    @Override
    public boolean save(Contact contact) {
        int count = 0;
        if (contact.getId() == null) {
            count = this.dao.insert(contact);
        }
        return count > 0;
    }
}
