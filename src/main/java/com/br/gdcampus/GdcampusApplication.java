package com.br.gdcampus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling // servlet-context.xml의 <task:annotation-driven /> 대체
@SpringBootApplication
public class GdcampusApplication {

	public static void main(String[] args) {
		SpringApplication.run(GdcampusApplication.class, args);
	}

}
