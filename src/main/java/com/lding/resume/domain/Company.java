package com.lding.resume.domain;

import lombok.Data;

@Data
public class Company extends BaseDto {
    private String name;
    private String website;
    private String intro;
}
