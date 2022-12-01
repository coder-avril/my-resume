package com.lding.resume.service;

import com.lding.resume.domain.Project;
import java.util.List;

public interface ProjectService {
    List<Project> getAll();

    boolean save(Project project);

    boolean remove(Integer id);
}
