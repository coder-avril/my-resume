package com.lding.resume.service.impl;

import com.lding.resume.dao.ProjectDao;
import com.lding.resume.domain.Project;
import com.lding.resume.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectDao dao;

    @Override
    public List<Project> getAll() {
        return this.dao.getAll();
    }

    @Override
    public boolean save(Project project) {
        int count = 0;
        if (project.getId() == null) {
            count = this.dao.insert(project);
        } else {
            count = this.dao.update(project);
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
