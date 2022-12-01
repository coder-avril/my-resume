package com.lding.resume.dao;

import com.lding.resume.domain.Experience;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import java.util.List;

public interface ExperienceDao {
    List<Experience> getAll();

    @Insert("INSERT INTO experience(begin_day, end_day, job, company_id, intro) VALUES (#{beginDay}, #{endDay}, #{job}, #{companyId}, #{intro})")
    int insert(Experience experience);

    @Update("UPDATE experience SET begin_day = #{beginDay}, end_day = #{endDay}, job = #{job}, company_id = #{companyId}, intro = #{intro} WHERE id = #{id}")
    int update(Experience experience);

    @Delete("DELETE FROM experience WHERE id = #{id}")
    int delete(Integer id);
}
