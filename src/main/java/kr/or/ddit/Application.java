package kr.or.ddit;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
@MapperScan(value = {"kr/or/ddit/**/mapper"})
public class Application {

	public static void main(String[] args) throws Exception {

		SpringApplication.run(Application.class, args);
	}
}