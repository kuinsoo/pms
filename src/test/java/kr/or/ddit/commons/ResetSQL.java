package kr.or.ddit.commons;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
@ActiveProfiles("devTest")
public class ResetSQL {
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	protected WebApplicationContext context;
	
	//protected MockMvc mockMvc;
	
	@Before
	public void setup() {
		
//		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		
		//데이터 초기화
		ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
		populator.addScript(new ClassPathResource("kr/or/ddit/config/db/dditInit.sql"));
		populator.setContinueOnError(false);
		DatabasePopulatorUtils.execute(populator, dataSource);
	}
	
	@Ignore
	@Test
	public void test() {}
}
