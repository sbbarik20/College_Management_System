package com.example.LMS;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;




@Controller
public class AnoController {

    @GetMapping("header")
    public String header(){
        return "header";
    }

    @GetMapping("index")
    public String index(){
        return "index";
    }

    //Database ..
    
    @Autowired
    JdbcTemplate Jdbc;
    

    @GetMapping("/register")
    public String register(){
        return "register";
    }
    
    @PostMapping("/Register")
    public String Register(Model model,@RequestParam("name") String name,
                           @RequestParam("email") String email,
                           @RequestParam("mobile") String mobile,
                           @RequestParam("password") String password,
                            @RequestParam("role") String role)
                           {
       Jdbc.execute("insert into user_master(name,email,mobile,password,role)values('"+name+"','"+email+"','"+mobile+"','"+password+"','"+role+"')");
       model.addAttribute("msg", "Register successfully");
        
        return "register";
    }
    

    @GetMapping("login")
    public String login(){
        return "login";
    }
    

    @PostMapping("/login")
    public String chk_login(Model model, HttpSession session, @RequestParam("email") String email, @RequestParam("password") String password) {
    
        String sql = "select * from user_master where email='"+email+"' and password='"+password+"'";
        ArrayList<String> ali = new ArrayList<String>();
    
    
        Jdbc.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet rs, int rowNum)throws SQLException{
                ali.add(rs.getString(1));  // id
                ali.add(rs.getString(2));  // name
                ali.add(rs.getString(3));   // email
                ali.add(rs.getString(4));   // mobile
                ali.add(rs.getString(5));   // password
                ali.add(rs.getString(6));   // role
                ali.add(rs.getString(7));   // status
                
                return "";
            }
        });
    
        if (!ali.isEmpty()) {
            if (ali.get(6).equals("0")) {
                model.addAttribute("msg", "plz contact to admin");
                return "login";
            } else {
                session.setAttribute("id", ali.get(0));
                session.setAttribute("name", ali.get(1));
                session.setAttribute("email", ali.get(2));
                
                if (ali.get(5).equals("student")) {
                    return "studentdashboard";
                }
                else if (ali.get(5).equals("faculty")) {
                    return "facultydashboard";
                }
                else if (ali.get(5).equals("admin")) {
                    return "admindashboard";
                }
                else{
                    model.addAttribute("msg", "No user..");
                    return "login";
                }
            }
        }
        else{
            model.addAttribute("msg", "Invalid Details");
            return "login";
        }
    }
    
    
    @GetMapping("/logout")
    public String logout(){
        return "index";
    }


    @GetMapping("/faq")
        public String faq(Model model){
            String sql="select * from faq_table";
            List<Map<String,Object>> faqlist=Jdbc.queryForList(sql);
            model.addAttribute("faqlist",faqlist);
            return "faq";
        }



    @GetMapping("sircontact")
    public String sircontact(){
        return "sircontact";
    }

    @GetMapping("calc")
    public String calc(){
        return "calc";
    }

    @PostMapping("/calc")
	public String calc(@RequestParam("btn") String bn, @RequestParam("f") int i, @RequestParam("s") int j, Model model) {
        int r=0;
        if(bn.equals("add")){
            r = i + j;
        }else if(bn.equals("sub")){
            r = i - j;
        }else if(bn.equals("mul")){
            r = i * j;
        }else if(bn.equals("div")){
            r = i / j;
        }
		
        model.addAttribute("result",r);
		return "calc";
	}


    @GetMapping("/home")
    public String home(){
        return "home";
    }

    @GetMapping("/services")
    public String services(){
        return "services";
    }


    @GetMapping("/gallery")
    public String gallery(){
        return "gallery";
    }


    @GetMapping("/pricing")
    public String pricing(){
        return "pricing";
    }

    @GetMapping("/about")
    public String about(){
        return "about";
    }

    @GetMapping("/adminmenu")
    public String adminmenu(){
        return "adminmenu";
    }

    @GetMapping("/editprofile")
    public String editprofile(){
        return "editprofile";
    }

    @GetMapping("/test")
    public String test(){
        return "test";
    }

    // @RequestMapping("test")
    // public String test(Model model){
    // //public ModelAndView test(){
    //     model.addAttribute("name","Suprava Biswal");
    //     model.addAttribute("id",1234);
    //     List<String> li = new ArrayList<String>();
    //     li.add("jaga");
    //    li.add("shakti");
    //     li.add("prabin");

                

        // model.addAttribute("f", li);
        // return "test";

        // ModelAndView obj=new ModelAndView() ;
        // obj.addObject("roll", 1234);
        // obj.addObject("name", "suprava");
        // obj.setViewName("test");
        // return obj;

    

    @GetMapping("/test1")
    public String test1(){
        return "test1";
    }



    

   
            
       






}



