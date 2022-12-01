package com.lding.resume.dao;

import com.lding.resume.domain.Company;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import java.util.List;

public interface CompanyDao {
    @Select("SELECT * FROM company")
    List<Company> getAll();

    @Insert("INSERT INTO company(name, website, intro) VALUES (#{name}, #{website}, #{intro})")
    boolean insert(Company company);

    @Update("UPDATE company SET name = #{name}, website = #{website}, intro = #{intro} WHERE id = #{id}")
    boolean update(Company company);

    @Delete("DELETE FROM company WHERE id = #{id}")
    boolean delete(Integer id);
}
