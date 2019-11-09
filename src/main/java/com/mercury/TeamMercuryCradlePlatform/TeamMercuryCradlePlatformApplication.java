package com.mercury.TeamMercuryCradlePlatform;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import javax.swing.text.html.parser.Entity;

@SpringBootApplication
public class TeamMercuryCradlePlatformApplication extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(TeamMercuryCradlePlatformApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(TeamMercuryCradlePlatformApplication.class, args);
	}
}
