package com.eshop.store.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Service
public interface UploadFileService {
    public File saveFileUpload(MultipartFile multipartFile, String fileName);
}
