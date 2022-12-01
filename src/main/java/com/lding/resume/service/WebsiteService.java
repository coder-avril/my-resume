package com.lding.resume.service;

import com.lding.resume.domain.Website;

public interface WebsiteService {
    Website get();

    boolean save(Website website);
}
