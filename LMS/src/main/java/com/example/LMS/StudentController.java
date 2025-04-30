package com.example.LMS;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;




@Controller
public class StudentController {
    @Autowired
    JdbcTemplate Jdbc;
    
    @GetMapping("/studentdashboard")
    public String studentdashboard(){
        return "studentdashboard";
    }

    @GetMapping("/studentmenu")
    public String studentmenu(){
        return "studentmenu";
    }

    @GetMapping("/exam")
    public String exam(Model model) {
        String sql = "select * from question_master";
        List<Map<String,Object>>all_question=Jdbc.queryForList(sql);
        model.addAttribute("all_question",all_question);
        return "exam";
    }
               
    
        @PostMapping("/saveStudentAnswer")
        public String saveStudentAnswer(@ModelAttribute Exam ed, HttpSession session, Model model){
        String email = (String) session.getAttribute("email");
            // String email="student@gmail.com";
            String[] stu_ansArray = ed.getAnsArray();
            String sql1="SELECT sl_no, answer FROM question_master";
            List<Map<String, Object>> db_answer = Jdbc.queryForList(sql1);
            int total_mark = 0;
            for (Map<String, Object> rowMap : db_answer) {
                int sl_no = (int) rowMap.get("sl_no");
                int ans = (int) rowMap.get("answer");
                int stu_mark = Integer.parseInt(stu_ansArray[sl_no]);
                if(ans == stu_mark) {
                total_mark++;
                }
            }
            String sql = "INSERT INTO answer (email, student_answer ,student_mark) values (?,?,?)";
            String json_txt = ed.toString();
            Jdbc.update(sql, email, json_txt, total_mark);

            model.addAttribute("mark", total_mark);
            return "result";

        }

        @GetMapping("/sprofile")
        public String sprofile(HttpSession session, Model model) {
            String email = (String) session.getAttribute("email");
        
            String sql = "SELECT id,email,role, mobile, password FROM user_master WHERE email = ?";
            List<Map<String, Object>> sprofileList = Jdbc.queryForList(sql, email);
            
            if (!sprofileList.isEmpty()) {
                model.addAttribute("imagedata", sprofileList.get(0).get("photo"));
                model.addAttribute("sprofileList", sprofileList);
            }
            return "sprofile";
        }

        @GetMapping("/image/{email}")
        public void getImage(@PathVariable String email, HttpServletResponse response) throws IOException {
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


        @GetMapping("/showvideo")
        public String showvideo(){
            return "showvideo";
        }

        @GetMapping("/video")
        public String video(Model model){
            String sql = "select * from video_master";
            List<Map<String, Object>> video_data = Jdbc.queryForList(sql);
            // Add the video list to the model  
            model.addAttribute("video_data", video_data);
            return "video";
        }
        
        
    
    


}




