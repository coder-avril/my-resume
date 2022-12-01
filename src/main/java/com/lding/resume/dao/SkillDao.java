package com.lding.resume.dao;

import com.lding.resume.domain.Skill;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import java.util.List;

public interface SkillDao {
    @Select("SELECT * FROM skill")
    List<Skill> getAll();

    @Insert("INSERT INTO skill(name, level) VALUES (#{name}, #{level})")
    boolean insert(Skill skill);

    @Update("UPDATE skill SET name = #{name}, level = #{level} WHERE id = #{id}")
    boolean update(Skill skill);

    boolean delete(Integer id);
}
