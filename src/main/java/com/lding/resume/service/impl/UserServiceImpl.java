package com.lding.resume.service.impl;

import com.lding.resume.dao.UserDao;
import com.lding.resume.domain.User;
import com.lding.resume.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao dao;

    @Override
    public User get() {
        return this.dao.get();
    }

    @Override
    public User getByUser(User user) {
        return this.dao.getByUser(user);
    }

    @Override
    public boolean save(User user) {
        boolean result = false;
        if (user.getPassword() != null) {
            result = this.dao.updatePassword(user);
        } else {
            result = this.dao.update(user);
        }
        return result;
    }
}
