package com.lding.resume.service.impl;

import com.lding.resume.dao.SkillDao;
import com.lding.resume.domain.Skill;
import com.lding.resume.service.SkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SkillServiceImpl implements SkillService {
    @Autowired
    private SkillDao dao;

    @Override
    public List<Skill> getAll() {
        return this.dao.getAll();
    }

    @Override
    public boolean save(Skill skill) {
        boolean result = false;
        if (skill.getId() != null) {
            result = this.dao.update(skill);
        } else {
            result = this.dao.insert(skill);
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
