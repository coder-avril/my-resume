package com.lding.resume.service.impl;

import com.lding.resume.dao.WebsiteDao;
import com.lding.resume.domain.Website;
import com.lding.resume.service.WebsiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebsiteServiceImpl implements WebsiteService {
    @Autowired
    private WebsiteDao dao;

    @Override
    public Website get() {
        return this.dao.get();
    }

    @Override
    public boolean save(Website website) {
        int count = 0;
        if (website.getId() == null) {
            count = this.dao.insert(website);
        } else {
            count = this.dao.update(website);
        }
        return count > 0;
    }
}
