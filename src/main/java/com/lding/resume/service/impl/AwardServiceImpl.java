package com.lding.resume.service.impl;

import com.lding.resume.dao.AwardDao;
import com.lding.resume.domain.Award;
import com.lding.resume.service.AwardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AwardServiceImpl implements AwardService {
    @Autowired
    private AwardDao dao;

    @Override
    public List<Award> getAll() {
        return this.dao.getAll();
    }

    @Override
    public boolean save(Award award) {
        boolean result = false;
        if (award.getId() == null) {
            result = this.dao.insert(award);
        } else {
            result = this.dao.update(award);
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
