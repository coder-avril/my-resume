package com.lding.resume.service;

import com.lding.resume.domain.Contact;
import com.lding.resume.domain.ContactRequest;
import com.lding.resume.domain.ContactResponse;

public interface ContactService {
    ContactResponse getAll(ContactRequest request);

    boolean save(Contact contact);
}
