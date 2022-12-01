package com.lding.resume.service;

import com.lding.resume.domain.Experience;
import java.util.List;

public interface ExperienceService {
    List<Experience> getAll();

    boolean save(Experience experience);

    boolean remove(Integer id);
}
