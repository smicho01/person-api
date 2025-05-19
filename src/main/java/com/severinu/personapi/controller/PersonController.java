package com.severinu.personapi.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/api/person")
public class PersonController {

    @GetMapping
    public String getPerson() {
        log.info("Person [GET]");
        try {
            log.info("Person [GET] sleep");
            Thread.sleep(500);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        return "Person [GET]";
    }

    @PostMapping
    public String createPerson() {
        log.info("Person [POST]");
        return "Person [POST]";
    }
}
