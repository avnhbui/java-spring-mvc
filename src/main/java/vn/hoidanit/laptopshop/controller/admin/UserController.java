package vn.hoidanit.laptopshop.controller.admin;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
