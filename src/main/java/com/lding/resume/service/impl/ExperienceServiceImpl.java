package com.lding.resume.service.impl;

import com.lding.resume.dao.ExperienceDao;
import com.lding.resume.domain.Experience;
import com.lding.resume.service.ExperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ExperienceServiceImpl implements ExperienceService {
    @Autowired
    private ExperienceDao dao;

    @Override
    public List<Experience> getAll() {
        return this.dao.getAll();
    }

    @Override
    public boolean save(Experience experience) {
        int count = 0;
        if (experience.getId() == null) {
            count = this.dao.insert(experience);
        } else {
            count = this.dao.update(experience);
        }
        return count > 0;
    }

    @Override
    public boolean remove(Integer id) {
        int count = 0;
        if (id != null) {
            count = this.dao.delete(id);
        }
        return count > 0;
    }
}
