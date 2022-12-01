package com.lding.resume.config;

import org.springframework.core.convert.converter.Converter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class DateConverter implements Converter<String, Date> {
    private List<String> formats = null;
    public void setFormats(List<String> formats) {
        this.formats = formats;
    }
    @Override
    public Date convert(String source) {
        for (String format: formats) {
            DateFormat df = new SimpleDateFormat(format);
            try {
                return df.parse(source);
            } catch (ParseException e) {
                // 如果发生异常 执行下一次
            }
        }
        return null;
    }
}
