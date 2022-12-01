package com.lding.resume.domain;

import lombok.Data;

@Data
public class Experience extends DateDto{
    private String job;
    private String companyId;
    private String intro;
    /* 用于直接接受来自联合检索的公司信息 */
    private Company company;
}
