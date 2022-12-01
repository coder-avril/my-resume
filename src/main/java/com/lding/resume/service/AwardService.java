package com.lding.resume.service;

import com.lding.resume.domain.Award;
import java.util.List;

public interface AwardService {
    List<Award> getAll();

    boolean save(Award award);

    boolean remove(Integer id);
}
