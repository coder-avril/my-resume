package com.lding.resume.domain;

import lombok.Data;
import java.util.Date;

@Data
public class DateDto extends BaseDto {
    protected Date beginDay;
    protected Date endDay;
}
