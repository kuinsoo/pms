package kr.or.ddit;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.io.File;

@SpringBootApplication
@EnableScheduling
@MapperScan(value = "kr/or/ddit/**/mapper")
public class Application {
	public static String UPLOAD_DIR = "upload-dir";
	public static String UPLOAD_DIR_PATH;

	public static void main(String[] args) throws Exception {
		File file = new File(UPLOAD_DIR);
		file.mkdir();
		UPLOAD_DIR_PATH = file.getAbsolutePath();
		SpringApplication.run(Application.class, args);
	}
}