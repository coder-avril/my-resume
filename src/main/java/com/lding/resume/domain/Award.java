package com.lding.resume.domain;

import lombok.Data;

@Data
public class Award extends BaseDto{
    private String name;
    private String image;
    private String intro;
}
