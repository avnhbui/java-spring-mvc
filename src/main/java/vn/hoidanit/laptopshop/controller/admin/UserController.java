package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.List;
import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

import java.io.File;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    // DI

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/admin/user")
    public String AdminUser(Model model, User user) {
        List<User> users = this.userService.GetAllUser();
        model.addAttribute("users", users);
        return "admin/user/view";
    }

    @RequestMapping("/admin/user/{id}")
    public String GetUserDetailPage(Model model, @PathVariable long id) {
        User userWithId = this.userService.GetUserByID(id);
        model.addAttribute("userWithId", userWithId);
        System.out.println(id);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create") // GET
    public String AdminUserCreate(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String CreateUserPage(Model model,
            @ModelAttribute("newUser") @Valid User vanhbui,
            BindingResult newUserBindingResult,
            @RequestParam("vanhbuiFile") MultipartFile file) {
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        } // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(vanhbui.getPassword());

        vanhbui.setAvatar(avatar);
        vanhbui.setPassword(hashPassword);
        vanhbui.setRole(this.userService.getRoleByName(vanhbui.getRole().getName()));
        this.userService.handleSaveUser(vanhbui);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String AdminUserUpdate(Model model, @PathVariable long id) {
        User userUpdate = this.userService.GetUserByID(id);
        model.addAttribute("updateUser", userUpdate);
        System.out.println(id);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUserUpdate(Model model, @ModelAttribute("updateUser") User vanhbui) {
        User userUpdate = this.userService.GetUserByID(vanhbui.getId());
        if (userUpdate != null) {
            userUpdate.setFullName(vanhbui.getFullName());
            userUpdate.setAddress(vanhbui.getAddress());
            userUpdate.setPhone(vanhbui.getPhone());
            this.userService.handleSaveUser(userUpdate);
        }
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/delete/{id}")
    public String AdminUserDelete(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postUserDelete(Model model, @ModelAttribute("deleteUser") User vanhbui) {
        this.userService.DeleteUser(vanhbui.getId());
        return "redirect:/admin/user";
    }
}

// RestAPI
// @RestController
// public class UserController {

// //DI
// private UserService userService;

// public UserController(UserService userService) {
// this.userService = userService;
// }

// @GetMapping("/")
// public String getHomePage() {
// return userService.handleHello();
// }
// }
