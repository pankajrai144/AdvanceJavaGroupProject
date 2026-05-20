package com.JerseyPasal.controller.utils;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.http.Part;

public class FileUploadUtil {

    public static boolean isImage(Part part) {
        String contentType = part.getContentType();

        // Only image files are accepted for upload.
        return contentType != null && contentType.startsWith("image/");
    }

    public static String getFileExtension(String fileName) {
        if (fileName == null || !fileName.contains(".")) {
            return "";
        }

        return fileName.substring(fileName.lastIndexOf("."));
    }

    public static String cleanEmailForFileName(String email) {
        // Email is cleaned so it can be safely used as part of a file name.
        return email.replaceAll("[^a-zA-Z0-9]", "_");
    }

    public static void saveFile(Part part, String uploadDir, String fileName) throws IOException {
        Path uploadPath = Paths.get(uploadDir);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        Path filePath = uploadPath.resolve(fileName);

        try (InputStream inputStream = part.getInputStream()) {
            // Existing files with the same name are replaced to keep the latest uploaded image.
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        }
    }
}