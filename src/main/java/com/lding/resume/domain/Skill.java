package com.lding.resume.domain;

import lombok.Data;

@Data
public class Skill extends BaseDto{
    private String name;
    private Integer level;
    public String getLevelName() {
        String levelstr = "";
        switch (this.level) {
            case 0:
                levelstr = "了解";
                break;
            case 1:
                levelstr = "熟悉";
                break;
            case 2:
                levelstr = "掌握";
                break;
            case 3:
                levelstr = "精通";
                break;
            default:
                levelstr = "未知";
        }
        return levelstr;
    }
}
