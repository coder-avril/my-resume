package com.lding.resume.domain;

import lombok.Data;

@Data
public class Project extends DateDto{
    private String name;
    private String intro;
    private String website;
    private String image;
    private Integer companyId;
    /* 用于直接接受来自联合检索的公司信息 */
    private Company company;
}
