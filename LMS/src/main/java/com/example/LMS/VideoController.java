package com.example.LMS;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;



@Controller
public class VideoController {
    @Autowired
    JdbcTemplate jdbc;

    private final String videoDierectory = "C:\\Java6pm\\springboot\\lms\\src\\main\\resources\\static\\videos";

        @GetMapping("/addVideo")
            public String addVideo(){
                return "addVideo";
            }

        @PostMapping("/upload_video")
        public String upload_video(Model model ,HttpSession session, @RequestParam("title") String title,@RequestParam("file") MultipartFile file) throws IOException {
            
            String teacher_id= (String) session.getAttribute("email");

            if(file.isEmpty()){
                model.addAttribute("error", "Please select a video file to upload.");
                return "addVideo";
            }
            try {
                // get project path
                Path currenPath = Paths.get("");
                String projectDir = currenPath.toAbsolutePath().toString();

                // save to src/main/resources/static/videos

               String uploadDir = projectDir + "\\src\\main\\resources\\static\\videos\\";
               File directory = new File(uploadDir);
               if (!directory.exists()) {
                   directory.mkdirs(); // Create the directory if it doesn't exist
                     }
                //save the uploaded file
                File uploadFile = new File(uploadDir + file.getOriginalFilename());
                file.transferTo(uploadFile);

                // insert metadata into the database(Example only - update accordingly)

                String sql = "INSERT into video_master (teacher_id,title,video_name,likes,comments) values (?,?,?,?,?)";
                jdbc.update(sql,teacher_id, title, file.getOriginalFilename(), 0, 0);
                model.addAttribute("success", "Video uploaded successfully!");
            } catch (Exception e) {
                model.addAttribute("error", "Error uploading video: " + e.getMessage());
                return "addVideo"; 
            }
                
            return "addVideo";
        }

        

}