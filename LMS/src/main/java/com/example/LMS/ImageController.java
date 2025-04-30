package com.example.LMS;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageController {

    @Autowired
    JdbcTemplate jdbc;

    private final String profileDirectory = "C:\\Java6pm\\springboot\\lms\\src\\main\\resources\\static\\profile";

    // Update the User Profile
    @PostMapping("/updateProfile")
    public String updateProfile(@RequestParam("email") String email,
                                @RequestParam("name") String name,
                                @RequestParam("mobile") String mobile,
                                @RequestParam("password") String password,
                                @RequestParam(value = "photo", required = false) MultipartFile photo,
                                Model model) {

        String sql;

        if (photo != null && !photo.isEmpty()) {
            // Get the current project directory path
            Path currentPath = Paths.get("");
            String projectDir = currentPath.toAbsolutePath().toString();

            // Define the directory to save the profile photo
            String uploadDir = projectDir + "\\src\\main\\resources\\static\\profile\\";
            File directory = new File(uploadDir);

            if (!directory.exists()) {
                directory.mkdirs();  // Create the directory if it doesn't exist
            }

            try {
                // Save the uploaded photo
                String fileName = photo.getOriginalFilename();
                File uploadFile = new File(uploadDir + fileName);
                photo.transferTo(uploadFile);

                // SQL query to update the user profile
                sql = "UPDATE user_master SET name = ?, mobile = ?, password = ?, photo = ? WHERE email = ?";
                jdbc.update(sql, name, mobile, password, fileName, email);  // Update profile with the photo file path
            } catch (IOException e) {
                model.addAttribute("error", "Error saving the profile photo: " + e.getMessage());
                return "editProfile"; // Return to the edit profile page on error
            }
        } else {
            // If no photo is uploaded, update without changing the photo
            sql = "UPDATE user_master SET name = ?, mobile = ?, password = ? WHERE email = ?";
            jdbc.update(sql, name, mobile, password, email);  // Update profile without photo
        }

        model.addAttribute("msg", "Profile updated successfully!");
        return "editProfile";  // Return the edit profile page
    }
}
