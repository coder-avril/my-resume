package com.lding.resume.service;

import com.lding.resume.domain.User;

public interface UserService {
    User get();

    User getByUser(User user);
    boolean save(User user);
}
