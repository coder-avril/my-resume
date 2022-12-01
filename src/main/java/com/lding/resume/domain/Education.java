package com.lding.resume.domain;

import lombok.Data;

@Data
public class Education extends DateDto{
    private Integer type;
    private String name;
    private String intro;
    public String getTypeName() {
        String typeName = "";
        switch (this.type) {
            case 1:
                typeName = "小学";
                break;
            case 2:
                typeName = "初中";
                break;
            case 3:
                typeName = "高中";
                break;
            case 4:
                typeName = "中专";
                break;
            case 5:
                typeName = "大专";
                break;
            case 6:
                typeName = "本科";
                break;
            case 7:
                typeName = "硕士";
                break;
            case 8:
                typeName = "博士";
                break;
            default:
                typeName = "其它";
        }
        return typeName;
    }
}
