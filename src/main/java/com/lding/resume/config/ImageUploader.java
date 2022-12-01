package com.lding.resume.config;

import lombok.Data;

@Data
public class ImageUploader {
    private String basePath;
    private String imagePath;
    // 获得完整图片的路径
    public String getImageFullPath() {
        return this.basePath + this.imagePath;
    }
}
