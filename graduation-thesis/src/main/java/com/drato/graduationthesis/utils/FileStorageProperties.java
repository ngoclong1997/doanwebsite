package com.drato.graduationthesis.utils;

import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.Calendar;

@ConfigurationProperties(prefix = "file")
public class FileStorageProperties {
    private String uploadDir;

    public String getUploadDir() {
        return uploadDir;
    }

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }
}