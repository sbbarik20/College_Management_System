package com.example.LMS;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;




@Controller
public class FacultyController {
    @Autowired
    JdbcTemplate Jdbc;
    
    @GetMapping("facultydashboard")
    public String facultydashboard(){
        return "facultydashboard";
    }

    @GetMapping("facultymenu")
    public String facultymenu(){
        return "facultymenu";
    }


    @GetMapping("/applyleave")
    public String applyleave(Model model, HttpSession session) {
        String id = (String)session.getAttribute("id");

        String sql = "select * from leave_master where leave_id in(select leave_id from leave_user_assign where id='"+id+"')";
        List<Map<String,Object>>leave=Jdbc.queryForList(sql);
        model.addAttribute("leave", leave);
        
        return "applyleave";
    }

    @PostMapping("/applyleave")
    public String save_applyleave(Model model, @RequestParam("id") String id, @RequestParam("leave_id") String leave_id, @RequestParam("no_of_leave") String no_of_leave) {
        Jdbc.execute("insert into leave_apply(id, leave_id, no_of_leave) values('"+id+"','"+leave_id+"','"+no_of_leave+"') ");

        model.addAttribute("msg", "leave apply successfully");
        return "applyleave";
    }

    @GetMapping("/addquestions")
    public String addquestions() {
        return "addquestions";
    }

    @PostMapping("/save_question")
    public String add_exam_question(
                    @RequestParam(name = "question")String question, 
                    @RequestParam(name = "option1")String option1,
                    @RequestParam(name = "option2")String option2,
                    @RequestParam(name = "option3")String option3,
                    @RequestParam(name = "option4")String option4,
                    @RequestParam(name = "answer")String answer,
                    @RequestParam(name = "type")String type, Model model){
         System.out.println("add exam question");
        Jdbc.execute("insert into question_master(type,question,option1,option2,option3,option4,answer) values ('"+type+"','"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+answer+"')");
        model.addAttribute("msg", "Question Added Successfully ");
        return "addquestions"; 
    }
       
    @GetMapping("/uploadVideo")
    public String uploadVideo(@RequestParam("videoFile") MultipartFile file, Model model, HttpSession session) {
        if (file.isEmpty()) {
            model.addAttribute("message", "Please select a file to upload");
            return "uploadVideo";
        }
        try {
            // Get project path
            Path currentPath = Paths.get("null");
            String projectDir = currentPath.toAbsolutePath().toString();

            // Save to static/videos
            String uploadDir = projectDir + "/src/main/resources/static/videos/";
            File directory = new File(uploadDir);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // Save the Uploaded File
            File uploFile = new File(uploadDir + file.getOriginalFilename());
            file.transferTo(uploFile);

            // Insert metadata into DB (Example only - update according)
            String teacherId = session.getAttribute("email").toString();
            String sql = "insert into video_master(teacher_id, video_name, likes, comments) values (?,?,?,?)";
            Jdbc.update(sql, teacherId, file.getOriginalFilename(), 0,0);

            model.addAttribute("message", "Video uploaded successflly" + file.getOriginalFilename());
        } catch (Exception e) {
            model.addAttribute("message", "Error uploading video" + e.getMessage());
            e.printStackTrace();
        }
        return "uploadvideo";
    }

    @GetMapping("/fprofile")
        public String fprofile(HttpSession session, Model model) {
            String email = (String) session.getAttribute("email");
        
            String sql = "SELECT id, email,role, mobile, password FROM user_master WHERE email = ?";
            List<Map<String, Object>> fprofileList = Jdbc.queryForList(sql, email);
            
            if (!fprofileList.isEmpty()) {
                model.addAttribute("imagedata", fprofileList.get(0).get("photo"));
                model.addAttribute("fprofileList", fprofileList);
            }
            return "fprofile";
        }

        @GetMapping("/faculty/image/{email}")
        public void getFacultyImage(@PathVariable String email, HttpServletResponse response) throws IOException {
            try {
                byte[] image = Jdbc.queryForObject(
                    "SELECT photo FROM profile WHERE email = ?",
                    new Object[]{email},
                    byte[].class
                );

                response.setContentType("image/jpeg");
                response.getOutputStream().write(image);
                response.getOutputStream().close();
            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        }


        

        // 2. Handle profile upload (image + age)
        @PostMapping("/fupload")
        public String fupload(HttpSession session, Model model,
                            @RequestParam("f") MultipartFile file,
                          @RequestParam("age") String age) throws IOException {

                String email = (String) session.getAttribute("email");

                if (file.isEmpty() || email == null || age == null) {
                    model.addAttribute("error", "Missing data!");
                    return "error";
                }
             model.addAttribute("email", email);
             return "fprofile"; // fprofile.jsp will show profile info/image
        }

        
        
    
    
    




    








    
    
}
