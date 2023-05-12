package com.example.barbershop.repositories;


import com.example.barbershop.models.Event;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EventRepository extends JpaRepository<Event, Long> {
    List<Event> findByDescription(String description);
}
