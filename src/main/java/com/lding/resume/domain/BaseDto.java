package com.lding.resume.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Data;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class BaseDto {
    protected Integer id;
    protected Date createdTime;
    // 该注解代表Json字符串的对象外方法
    @JsonIgnore
    public String getJSON() throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        // 指定日期的格式
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
        return mapper.writeValueAsString(this).replace("\"", "'");
    }
}
