package vn.hoidanit.laptopshop.controller;

import org.springframework.web.bind.annotation.RestController;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.service.UserService;

import java.lang.reflect.Array;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    // DI

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrsUser = this.userService.GetAllUserByEmail("vanhbui04@gmail.com");
        System.out.println(arrsUser);
        model.addAttribute("vanhbui", "test");
        model.addAttribute("vanhbui36", "from controller with model");

        return "hello";
    }

    @RequestMapping("/admin/user")
    public String AdminUser(Model model) {
        List<User> users = this.userService.GetAllUser();
        model.addAttribute("users", users);
        return "admin/user/table-user";
    }

    @RequestMapping("/admin/user/create") // GET
    public String AdminUserCreate(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String CreateUserPage(Model model, @ModelAttribute("newUser") User vanhbui) {
        this.userService.handleSaveUser(vanhbui);
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
