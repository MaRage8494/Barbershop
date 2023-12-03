package com.example.barbershop.controllers;

import com.example.barbershop.models.Product;
import com.example.barbershop.repositories.ProductRepository;
import com.example.barbershop.services.EventService;
import com.example.barbershop.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final EventService eventService;
    private final ProductService productService;
    private final ProductRepository productRepository;

    @GetMapping("/")
    public String products(@RequestParam(name = "searchWord", required = false) String title,
                           @RequestParam(name = "searchTown", required = false) String town,
                           @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
                           Principal principal, Model model) {
        Page<Product> page = productService.listProducts(title, town, pageable);
        model.addAttribute("products", page);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        model.addAttribute("searchTown", town);
        model.addAttribute("url", "/");
        return "index";
    }

    @GetMapping("/product/{id}")
    public String productInfo(@RequestParam(name = "name", required = false) String name, Principal principal, @PathVariable Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("events", eventService.listEvents(name));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        return "product-info";
    }

    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/admin";
    }
}
