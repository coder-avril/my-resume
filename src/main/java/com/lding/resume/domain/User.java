package com.lding.resume.domain;

import lombok.Data;
import java.util.Date;

@Data
public class User extends BaseDto{
    private String name;
    private String password;
    private Date birthday;
    private String phone;
    private String email;
    private String address;
    private String intro;
    private String photo;
    private String job;
    private String trait;
    private String interests;
}
