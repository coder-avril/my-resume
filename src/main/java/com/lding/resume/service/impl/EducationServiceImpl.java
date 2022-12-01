package com.lding.resume.service.impl;

import com.lding.resume.dao.EducationDao;
import com.lding.resume.domain.Education;
import com.lding.resume.service.EducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EducationServiceImpl implements EducationService {
    @Autowired
    private EducationDao dao;

    @Override
    public List<Education> getAll() {
        return this.dao.getAll();
    }

    @Override
    public boolean save(Education education) {
        boolean result = false;
        if (education.getId() == null) {
            result = this.dao.insert(education);
        } else {
            result = this.dao.update(education);
        }
        return result;
    }

    @Override
    public boolean remove(Integer id) {
        boolean result = false;
        if (id != null) {
            result = this.dao.delete(id);
        }
        return result;
    }
}
