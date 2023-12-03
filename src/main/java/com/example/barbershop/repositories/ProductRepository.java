package com.example.barbershop.repositories;

import com.example.barbershop.models.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Page<Product> findByTitle(String title, Pageable pageable);
    Page<Product> findAll(Pageable pageable);
    Page<Product> findByCity(String town, Pageable pageable);
    Page<Product> findByTitleAndCity(String title, String town, Pageable pageable);
}
