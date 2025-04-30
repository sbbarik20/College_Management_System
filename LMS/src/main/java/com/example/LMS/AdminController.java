package com.example.LMS;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.Types;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.ssl.SslProperties.Bundles.Watch.File;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@Controller
public class AdminController {
    
    //Database ..
    
    @Autowired
    JdbcTemplate Jdbc;
    
    @GetMapping("admindashboard")
    public String admindashboard(){
        return "admindashboard";
    }

    @GetMapping("adminheader")
    public String adminheader(){
        return "adminheader";
    }
    
    
    @GetMapping("/users")
    public String users(Model model){
        String sql="select * from user_master where role != 'admin'";
        List<Map<String,Object>> usermaster=Jdbc.queryForList(sql);
        model.addAttribute("usermaster",usermaster);
        return "users";
    }
    
    
    // manage user
    @PostMapping("/updateusers")
    public String updateusers(@RequestParam("email") String email,
    @RequestParam("name") String name,
    @RequestParam("role") String role, 
    @RequestParam("status") String status, 
    Model model 
    ){
        String sql = "update user_master set status=? where email = ?";
        
        Jdbc.update(sql, status, email);
        return users(model);
    }
    
    
    @PostMapping("/manageusers")
    public String manageusers(Model model,@RequestParam("email")String email,@RequestParam("btn")String btn){
        if(btn.equals("delete")) {
            Jdbc.execute("delete from user_master where email='"+email+"'");
            return users(model);
        }else if(btn.equals("edit")) {
            String sql = "SELECT * FROM USER_MASTER WHERE email='"+email+"'";
            List<Map<String, Object>> usermaster = Jdbc.queryForList(sql);
            model.addAttribute("usermaster", usermaster);
            return "edit";
        }else{
            return "users";
        }
    }
    
    
        @GetMapping("/adminfaqs")
        public String adminfaqs(){
            return "adminfaqs";
        }
    
    
    @GetMapping("/viewfaqs")
    public String viewfaqs(Model model){
        String sql="select * from faq_table";
        List<Map<String,Object>> faqlist=Jdbc.queryForList(sql);
        model.addAttribute("faqlist",faqlist);
        return "viewfaqs";
        }


    @PostMapping("/managefaq")
    public String managefaq(Model model,@RequestParam("btn")String btn ,@RequestParam("id")String id){
        if(btn.equals("delete")) {
            Jdbc.execute("delete from faq_table where id='"+id+"'");
            return viewfaqs(model);
        }else if(btn.equals("edit")) {
            String sql = "SELECT * FROM faq_table WHERE id = '"+id+"'";
            List<Map<String, Object>> faqlist = Jdbc.queryForList(sql);
            model.addAttribute("faqlist", faqlist);
            return "editfaqs";
        }else{
            return viewfaqs(model);
        }
    }

     // manage faq
     @PostMapping("/editfaqs")
public String editfaqs(@RequestParam("question") String question,
                       @RequestParam("answer") String answer,
                       @RequestParam("id") String id,
                       Model model) {

    // Update question
    String sql1 = "UPDATE faq_table SET question=? WHERE id = ?";
    Jdbc.update(sql1, question, id);

    // Update answer
    String sql2 = "UPDATE faq_table SET answer=? WHERE id = ?";
    Jdbc.update(sql2, answer, id);

    return viewfaqs(model);
}



    @GetMapping("/contact")
    public String contact(){
        return "contact";
    }


    @PostMapping("/Contact")
    public String Contact(Model model,@RequestParam("name") String name,
                           @RequestParam("email") String email,
                           @RequestParam("phoneno") String phoneno,
                            @RequestParam("message") String message)
                           {
       Jdbc.execute("insert into contact_table(name,email,phoneno,message)values('"+name+"','"+email+"','"+phoneno+"','"+message+"')");
       model.addAttribute("msg", "Successfully Message Sent");
        
        return "contact";
    }

    @GetMapping("/viewcontact")
    public String viewcontact(Model model){
        String sql="select * from contact_table";
        List<Map<String,Object>> usermaster=Jdbc.queryForList(sql);
        model.addAttribute("usermaster",usermaster);
        return "viewcontact";
    }

    @GetMapping("/addleave")
    public String addleave(Model model) {
        String sql = "select * from leave_master";
        List<Map<String,Object>>leavemaster=Jdbc.queryForList(sql);
        model.addAttribute("leavemaster", leavemaster);
        return "addleave";
    }

    @PostMapping("/add_leave")
    public String add_leave(Model model, @RequestParam("leave_name") String leave_name) {
        Jdbc.execute("insert into leave_master(leave_name) values('"+leave_name+"')");
        model.addAttribute("msg", "Leave Added Successfully");
        return addleave(model);
    }

    @PostMapping("/updateleave")
    public String editleave(@RequestParam("leave_name") String leave_name,
                                @RequestParam("leave_id") String leave_id,
                                Model model 
                                ){
        String sql = "update leave_master set leave_name=? where leave_id = ?";

        Jdbc.update(sql, leave_name, leave_id);
        return addleave(model);
    }

    @PostMapping("/manageleave")
    public String manageleave(Model model,@RequestParam("leave_id")String leave_id,@RequestParam("btn")String btn){
        if(btn.equals("delete")) {
            Jdbc.execute("delete from leave_master where leave_id='"+leave_id+"'");
            return addleave(model);
        }else if(btn.equals("edit")) {
            String sql = "SELECT * FROM leave_master WHERE leave_id='"+leave_id+"'";
            List<Map<String, Object>> leaveList = Jdbc.queryForList(sql);
            model.addAttribute("leaveList", leaveList);
            return "editleave";
        }else{
            return addleave(model);
        }
    }
        
    @GetMapping("/assignleave")
    public String assignleave(Model model) {
        String sql = "select * from user_master where role='faculty'";
        List<Map<String,Object>>faculty=Jdbc.queryForList(sql);
        model.addAttribute("faculty", faculty);
        
        String sql1 = "select * from leave_master";
        List<Map<String,Object>>leavetype=Jdbc.queryForList(sql1);
        model.addAttribute("leavetype", leavetype);
        
        String sql2 = "select * from leave_user_assign";
        List<Map<String,Object>>assignedleave=Jdbc.queryForList(sql2);
        model.addAttribute("assignedleave", assignedleave);

        return "assignleave";
    }

    @PostMapping("/assignleave")
    public String save_assignleave(Model model, @RequestParam("id") String id, @RequestParam("leave_id") String leave_id, @RequestParam("no_of_leave") String no_of_leave){
        Jdbc.execute("insert into leave_user_assign(id,leave_id,no_of_leave) values('"+id+"','"+leave_id+"','"+no_of_leave+"')");

        model.addAttribute("msg","Leave assigned successfully");
        return assignleave(model);
    }

    @GetMapping("/viewapplyleave")
    public String viewapplyleave(Model model) {
        String sql = "select * from leave_apply";
        List<Map<String,Object>>leavelist=Jdbc.queryForList(sql);
        model.addAttribute("leavelist",leavelist);
        return "viewapplyleave";
    }

    @GetMapping("admingallery")
    public String admingallery() {
        return "admingallery";
    }
    
        @GetMapping("viewgallery")
        public String viewgallery(Model model) {
            String sql="select * from gallery";
            List<Map<String,Object>> gallerylist=Jdbc.queryForList(sql);
            model.addAttribute("gallerylist",gallerylist);
            return "viewgallery";
        }

        @GetMapping("/aprofile")
        public String profilePage(HttpSession session, Model model) {
            String email = (String) session.getAttribute("email");

            String sql = "SELECT id, email, name, role, mobile, password FROM user_master WHERE email = ?";
            List<Map<String, Object>> profileList = Jdbc.queryForList(sql, email);

            if (!profileList.isEmpty()) {
                model.addAttribute("aprofileList", profileList);
            }
            return "aprofile";
        }

        // Show the Profile Edit Form
        @GetMapping("/editProfile")
        public String editProfile(Model model, @RequestParam("email") String email) {
            String sql = "SELECT * FROM user_master WHERE email = ?";
            List<Map<String, Object>> aprofileList = Jdbc.queryForList(sql, email);
            
            if (!aprofileList.isEmpty()) {
                model.addAttribute("aprofileList", aprofileList.get(0));  // Add the first record
            } else {
                model.addAttribute("msg", "Profile not found!");  // Handle case when profile doesn't exist
            }
            
            return "editprofile";
        }


        
        
    
    
    



    
}

