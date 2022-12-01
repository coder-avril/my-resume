package com.lding.resume.service;

import com.lding.resume.domain.Skill;
import java.util.List;

public interface SkillService {
    List<Skill> getAll();

    boolean save(Skill skill);

    boolean remove(Integer id);
}
