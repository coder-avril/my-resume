package com.lding.resume.controller;

import com.lding.resume.config.ImageUploader;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

public class BaseController {
    @Autowired
    private ImageUploader imageUploader;

    protected void setErrMsg(Map<String, Object> result, String msg) {
        result.put("success", false);
        result.put("message", msg);
    }

    protected String uploadImage(MultipartFile photoFile, String oldPath) throws IOException {
        // 如果FileItem为空 或者空串的话 直接返回oldDbPath
        if (photoFile == null || photoFile.getInputStream().available() == 0) return oldPath;
        // 获取文件拓展名
        String extension = FilenameUtils.getExtension(photoFile.getOriginalFilename());
        // 获取路径和文件名
        String fileName = UUID.randomUUID() + "." + extension;
        String path = imageUploader.getImageFullPath() + fileName;
        String dbPath = imageUploader.getImagePath() + fileName;

        // 删除旧的文件
        deleteOldFile(oldPath);

        File file = new File(path);
        // 创建好目标文件所在的父目录
        FileUtils.forceMkdirParent(file);
        // 将文件数据写到目标文件
        FileUtils.copyInputStreamToFile(photoFile.getInputStream(), file);

        return dbPath;
    }

    protected void deleteOldFile(String oldPath) {
        if (oldPath != null && oldPath.trim().length() != 0) {
            FileUtils.deleteQuietly(new File(imageUploader.getBasePath() + oldPath));
        }
    }
}
