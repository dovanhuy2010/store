package com.eshop.store.service;

import com.eshop.store.common.CommonResource;
import com.eshop.store.utils.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Paths;

@Slf4j
@Service
@RequiredArgsConstructor
public class UploadFileServiceImpl implements UploadFileService{
    private final CommonResource commonResource;

    public File saveFileUpload(MultipartFile multipartFile, String fileName) {
        File file = FileUtils.convert(multipartFile);
        File destFile = null;
        try {
            multipartFile.transferTo(file);
            //==================
            if (file != null) {
                // Đổi tên file
                if (fileName == null) {
                    fileName = file.getName();
                }
                fileName = FileUtils.renameFileName(fileName);
                File destDir = new File(commonResource.getFolderUploadUser());
                if (!destDir.exists())
                    destDir.mkdirs();

                // Tạo file
                String destFileUrl = Paths.get(destDir.getAbsolutePath(), fileName).toString();
                destFile = new File(destFileUrl);
                org.apache.commons.io.FileUtils.copyFile(file, destFile);
            }
        } catch (Exception e) {
            log.error("Lỗi khi upload error: {}", e.getMessage());
            return destFile;
        } finally {
            org.apache.commons.io.FileUtils.deleteQuietly(file);
        }
        return destFile;
    }
}
