package com.example.LMS;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;




@SpringBootApplication
@RestController
public class LmsApplication {

	public static void main(String[] args) {
		SpringApplication.run(LmsApplication.class, args);
	}

	// http://localhost:8082/add?f=34&s=46
	// @PostMapping("/add")
	// public static String add(@RequestParam("f") int n1, @RequestParam("s") int n2) {
	// 	int r = n1 + n2;
	// 	return String.valueOf(r);
	// }

	// // http://localhost:8082/show?name=Shakti
	// @GetMapping("/show")
	// public static String show(@RequestParam("name") String nm) {
	// 	return "hello " + nm;
	// }

	// // http://localhost:8082/hello
	// @GetMapping("/hello")
	// public static String hello() {
	// 	return "Hello seeree hii.. !";
	// }

	// // http://localhost:8082/hii
	// @GetMapping("/hii")
	// public static String hii() {
	// 	return "Hii seeree !";
	// }


}
