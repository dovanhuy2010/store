package com.eshop.store.controller.admin;

import com.eshop.store.common.CommonResource;
import com.eshop.store.dto.Response;
import com.eshop.store.dto.ReturnCode;
import com.eshop.store.service.RedisService;
import com.eshop.store.service.UploadFileService;
import com.eshop.store.utils.FileUtils;
import com.eshop.store.utils.Utils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping(value = "import")
@RequiredArgsConstructor
public class UploadFilesController {
    private final RedisService redisService;

    private final UploadFileService uploadFileService;

    //test
    @ResponseBody
    @RequestMapping(value = "save-file", method = RequestMethod.POST)
    public ResponseEntity<?> saveFile(MultipartHttpServletRequest multipartHttpServletRequest,
                                      HttpServletResponse response,
                                      HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        StringBuilder builder = new StringBuilder();
        builder.append("INFOR_FILE_");
        builder.append(session.getId());

        Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
        redisService.set(builder.toString(), fileMap);
        return new ResponseEntity<>(true, HttpStatus.OK);
    }
    //

    @RequestMapping(value = "/upload-file", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    protected @ResponseBody
    Response uploadOTA(final MultipartHttpServletRequest request) {
        Iterator<String> iterators = request.getFileNames();
        Response response = Utils.createResponse(ReturnCode.ERROR, null, ReturnCode.ERROR.getStatus());
        while (iterators.hasNext()) {
            // 1. Lưu file upload
            MultipartFile multipartFile = request.getFile(iterators.next());
            if (multipartFile == null) {
                return Utils.createResponse(ReturnCode.NOT_FOUND, null, ReturnCode.NOT_FOUND.getStatus());
            }
            String fileName = multipartFile.getOriginalFilename();
            File file = uploadFileService.saveFileUpload(multipartFile, fileName);
            if (file == null) {
                return response;
            }
            return Utils.createResponse(ReturnCode.SUCCESS, fileName, ReturnCode.SUCCESS.getStatus());
        }
        return response;
    }
}
