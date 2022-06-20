package com.eshop.store.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.io.FilenameUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Slf4j
public class FileUtils {

    public static File convert(MultipartFile file) {
        File convFile = new File(file.getOriginalFilename());
        FileOutputStream fos = null;
        try {
            convFile.createNewFile();
            fos = new FileOutputStream(convFile);
            fos.write(file.getBytes());
        } catch (Exception e) {
            log.error(e.toString());
        } finally {
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
        return convFile;
    }

    public static String renameFileName(String oldFileName) {
        if (StringUtils.isEmpty(oldFileName))
            return oldFileName;
        try {
            String extension = FilenameUtils.getExtension(oldFileName);
            String baseName = FilenameUtils.getBaseName(oldFileName);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmssSSS");
            StringBuilder sb = new StringBuilder();
            sb.append(baseName).append("_").append("_").append(sdf.format(new Date())).append(".")
                    .append(extension);
            return sb.toString();
        } catch (Exception e) {
            log.error("Error--" + e, e);
        }
        return oldFileName;
    }
}
