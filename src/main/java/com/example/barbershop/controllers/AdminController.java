package com.example.barbershop.controllers;

import com.example.barbershop.models.Product;
import com.example.barbershop.models.User;
import com.example.barbershop.models.enums.Role;
import com.example.barbershop.services.EventService;
import com.example.barbershop.services.ProductService;
import com.example.barbershop.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;
    private final ProductService productService;
    private final EventService eventService;

    @GetMapping("/admin")
    public String admin(@RequestParam(name = "title", required = false) String title,Principal principal, Model model){
        model.addAttribute("events", eventService.listEvents(title));
        model.addAttribute("users", userService.list());
        model.addAttribute("products", productService.listProducts(title));
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "admin";
    }
    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id){
        userService.banUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }
    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form){
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }
    @PostMapping("/admin/create")
    public String createProduct(@RequestParam("file") MultipartFile file, Product product, Principal principal) throws IOException {
        productService.saveProduct(principal, product, file);
        return "redirect:/admin";
    }
    @PostMapping("/product/deleteEventAdmin/{id}")
    public String deleteEventAdmin(@PathVariable Long id) {
        eventService.deleteEvent(id);
        return "redirect:/admin";
    }
}
