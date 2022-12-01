package com.lding.resume.service;

import com.lding.resume.domain.Company;

import java.util.List;

public interface CompanyService {
    List<Company> getAll();

    boolean save(Company company);

    boolean remove(Integer id);
}
