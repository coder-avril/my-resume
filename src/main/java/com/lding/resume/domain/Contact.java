package com.lding.resume.domain;

import lombok.Data;

@Data
public class Contact extends BaseDto{
    private String name;
    private String email;
    private String comment;
    private String subject;
}
