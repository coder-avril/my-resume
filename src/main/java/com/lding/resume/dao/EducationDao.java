package com.lding.resume.dao;

import com.lding.resume.domain.Education;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import java.util.List;

public interface EducationDao {
    @Select("SELECT * FROM education")
    List<Education> getAll();

    @Update("UPDATE education SET name = #{name}, begin_day = #{beginDay}, end_day = #{endDay}, type = #{type}, intro = #{intro} WHERE id = #{id}")
    boolean update(Education education);

    @Insert("INSERT INTO education(name, begin_day, end_day, type, intro) VALUES (#{name}, #{beginDay}, #{endDay}, #{type}, #{intro})")
    boolean insert(Education education);

    @Delete("DELETE FROM education WHERE id = #{id}")
    boolean delete(Integer id);
}
