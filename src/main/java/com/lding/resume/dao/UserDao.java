package com.lding.resume.dao;

import com.lding.resume.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserDao {
    @Select("SELECT * FROM user")
    User get();

    @Select("SELECT * FROM user WHERE email = #{email} AND password = #{password}")
    User getByUser(User user);

    @Insert("UPDATE user SET password = #{password} WHERE id = #{id}")
    boolean updatePassword(User user);

    @Update("UPDATE user SET name = #{name}, birthday = #{birthday}, phone = #{phone}, address = #{address}, intro = #{intro}, photo = #{photo}, job = #{job}, trait = #{trait}, interests = #{interests} WHERE id = #{id}")
    boolean update(User user);
}
