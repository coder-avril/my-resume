package com.lding.resume.dao;

import com.lding.resume.domain.Project;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import java.util.List;

public interface ProjectDao {
    List<Project> getAll();

    @Insert("INSERT INTO project(name, intro, website, image, begin_day, end_day, company_id) VALUES (#{name}, #{intro}, #{website}, #{image}, #{beginDay}, #{endDay}, #{companyId})")
    int insert(Project project);

    @Update("UPDATE project SET name = #{name}, intro = #{intro}, website = #{website}, image = #{image}, begin_day = #{beginDay}, end_day = #{endDay}, company_id = #{companyId} WHERE id = #{id}")
    int update(Project project);

    @Delete("DELETE FROM project WHERE id = #{id}")
    int delete(Integer id);
}
