
package com.br.gdcampus.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;

@Configuration
public class SwaggerConfig {

  @Bean
  public OpenAPI openAPI() {
    return new OpenAPI()
        .components(new Components())
        .info(apiInfo());
  }
 
  private Info apiInfo() {
    return new Info()
        .title("Springdoc 테스트") // API의 제목
        .description("Springdoc을 사용한 Swagger UI 테스트") // API에 대한 설명
        .version("1.0.0"); // API의 버전
  }
 
}