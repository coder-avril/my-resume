package com.lding.resume.service.impl;

import com.lding.resume.dao.CompanyDao;
import com.lding.resume.domain.Company;
import com.lding.resume.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    private CompanyDao dao;

    @Override
    public List<Company> getAll() {
        return this.dao.getAll();
    }

    @Override
    public boolean save(Company company) {
        boolean result = false;
        if (company.getId() != null) {
            result = this.dao.update(company);
        } else {
            result = this.dao.insert(company);
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
