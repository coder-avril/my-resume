package com.lding.resume.dao;

import com.lding.resume.domain.Contact;
import com.lding.resume.domain.ContactRequest;
import org.apache.ibatis.annotations.Insert;
import java.util.List;

public interface ContactDao {
    List<Contact> getAll(ContactRequest request);

    @Insert("INSERT INTO contact(name, email, comment, subject) VALUES (#{name} ,#{email}, #{comment}, #{subject})")
    int insert(Contact contact);
}
