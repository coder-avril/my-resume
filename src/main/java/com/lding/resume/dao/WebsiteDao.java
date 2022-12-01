package com.lding.resume.dao;

import com.lding.resume.domain.Website;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface WebsiteDao {
    @Select("SELECT * FROM website")
    Website get();

    @Insert("INSERT INTO website(footer) VALUES (#{footer})")
    int insert(Website website);

    @Update("UPDATE website SET footer = #{footer} WHERE id = #{id}")
    int update(Website website);
}
