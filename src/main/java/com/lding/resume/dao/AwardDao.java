package com.lding.resume.dao;

import com.lding.resume.domain.Award;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import java.util.List;

public interface AwardDao {
    @Select("SELECT * FROM award")
    List<Award> getAll();

    @Insert("INSERT INTO award(name, image, intro) VALUES (#{name}, #{image}, #{intro})")
    boolean insert(Award award);

    @Update("UPDATE award SET name = #{name}, image = #{image}, intro = #{intro} WHERE id = #{id}")
    boolean update(Award award);

    @Delete("DELETE FROM award WHERE id = #{id}")
    boolean delete(Integer id);
}
