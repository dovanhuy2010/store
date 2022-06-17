package com.eshop.store.controller.admin;

import com.eshop.store.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

@Controller
@RequestMapping(value = "import")
public class UploadFilesController {
    @Autowired
    private RedisService redisService;

    @RequestMapping(value = "upload-file",method = RequestMethod.POST)
    public ResponseEntity<?> uploadFile(@RequestParam("file") MultipartFile file,
                                        HttpServletRequest request)throws IOException {
        HttpSession session = request.getSession();
        StringBuilder builder = new StringBuilder();
        builder.append("INFOR_FILE_");
        builder.append(session.getId());
        try {
            byte[] bytes = file.getBytes();
            String demo = bytes.toString();
            redisService.set(builder.toString(),demo);
            return new ResponseEntity<>(demo, HttpStatus.OK);


//            Path path = Paths.get(UPLOADED_FOLDER
//                    + file.getOriginalFilename());
//            Files.write(path, bytes);
//
//            request.setAttribute("message",
//                    "You have successfully uploaded '"
//                            + file.getOriginalFilename() + "'");

        } catch (IOException e) {
            e.printStackTrace();
        }

//        if(StringUtils.isEmpty(inforImg)){
//            return new ResponseEntity<>(false, HttpStatus.BAD_REQUEST);
//        }
        return new ResponseEntity<>(true, HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping(value = "save-file",method = RequestMethod.POST)
    public ResponseEntity<?> saveFile(MultipartHttpServletRequest multipartHttpServletRequest,
                                      HttpServletResponse response,
                                      HttpServletRequest request)throws IOException {
        HttpSession session = request.getSession();
        StringBuilder builder = new StringBuilder();
        builder.append("INFOR_FILE_");
        builder.append(session.getId());

        Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
        redisService.set(builder.toString(),fileMap);
        return new ResponseEntity<>(true, HttpStatus.OK);
    }

}
