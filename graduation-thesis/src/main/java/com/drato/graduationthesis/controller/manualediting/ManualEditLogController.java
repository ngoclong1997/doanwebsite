package com.drato.graduationthesis.controller.manualediting;

import com.drato.graduationthesis.model.ExamSubject;
import com.drato.graduationthesis.model.UploadFileResponse;
import com.drato.graduationthesis.service.implementation.FileStorageService;
import com.drato.graduationthesis.service.interfaces.ExamSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class ManualEditLogController {

    @Autowired
    private FileStorageService fileStorageService;

    @Autowired
    ExamSubjectService examSubjectService;

    @PostMapping("/uploadManualEditLogFile")
    public UploadFileResponse uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("examId") Long examId, @RequestParam("subjectId") Long subjectId) throws IOException, NoSuchAlgorithmException {
        String fileName = fileStorageService.storeFile(file);
        examSubjectService.updatePath(fileName, examId, subjectId);
        String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/downloadManualEditLogFile?examId="+examId + "&subjectId=" + subjectId)
                .toUriString();

        return new UploadFileResponse(file.getOriginalFilename(), fileDownloadUri, file.getContentType(), file.getSize());
    }

    @GetMapping("/downloadManualEditLogFile")
    public ResponseEntity<Resource> downloadFile(@RequestParam("examId") Long examId, @RequestParam("subjectId") Long subjectId, HttpServletRequest request) throws Exception {
        String examSubjectPath = examSubjectService.getPath(examId, subjectId);
        Resource resource = fileStorageService.loadFileAsResource(examSubjectPath);
        String contentType = null;
        try {
            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        } catch (IOException ex) {
            throw new Exception("Could not determine file type.");
        }
        // Fallback to the default content type if type could not be determined
        if(contentType == null) {
            contentType = "application/octet-stream";
        }

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }
}