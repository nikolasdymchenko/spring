package com.example.sweater.controller;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/user")  //assigning the controller methods the addresses at which they will be available to the client.

//@PreAuthorize("hasAuthority('ADMIN)")
public class UserController {
    @Autowired
    private UserService userService;
    @PreAuthorize("hasAuthority('ADMIN')")  //differentiation of user and administration access rights
    @GetMapping
    public String userList(Model model){
        model.addAttribute("users", userService.findAll());

        return "userList";
    }
    @PreAuthorize("hasAuthority('ADMIN')")  //differentiation of user and administration access rights
    @GetMapping("{user}") //we get not only the user but also user ID
    public String userEditFrom(@PathVariable User user, Model model) { //we get users directly from the database without using UserRepos
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }
    @PreAuthorize("hasAuthority('ADMIN')")  //differentiation of user and administration access rights
    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form, //list of the fields from the form (
            @RequestParam("userId") User user
    ){

        userService.saveUser(user, username, form);

        return "redirect:/user";
    }
    @GetMapping("profile")  //view data
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());

        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam String password,
            @RequestParam String email
    ){
        userService.updateProfile(user, password, email);
        return "redirect:/user/profile";
    }
}