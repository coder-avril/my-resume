package com.lding.resume.service;

import com.lding.resume.domain.Education;
import java.util.List;

public interface EducationService {
    List<Education> getAll();

    boolean save(Education education);

    boolean remove(Integer id);
}
