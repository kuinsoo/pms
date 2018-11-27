package kr.or.ddit.commons.schedul;

import java.util.Calendar;
import java.util.concurrent.atomic.AtomicInteger;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import kr.or.ddit.member.mapper.MemberMapper;

@Component
public class Timer {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private AtomicInteger loopCounter = new AtomicInteger();
	
	@Autowired
	private StopWatch watch;
	
	private String timerName =  "exampleTimer";
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Value("${spring.task.scheduling.thread-name-prefix}")
	private String taskNamePrefix;
	
	@PostConstruct
	public void init() {
		logger.info("{} init", timerName);
		watch.start();
	}
	
	/*
	 * @Scheduled어노테이션을통해작업이끝난후1초후다시작업을시작한다
	 * fixedRateString의경우이전작업이끝나지않아도1초마다작업을시작한다
	 * 
	 * @Scheduled의 cron속성으로 크론탭처럼(* * * * *) 설정도 가능하다.
	 * 출처: http://www.donnert.net/73?category=412866 [donnert.net]
	 * */
	//@Scheduled(fixedDelayString = "30000")
	public void tick() throws InterruptedException {
		watch.stop();
		//logger.info(watch.prettyPrint());
			logger.info("{} memberMapper", memberMapper.selectAllMember());
		
		String taskName = taskNamePrefix + "-" + String.valueOf(loopCounter.getAndIncrement());
		watch.start(taskName);
	}
	
	//@Scheduled(cron = "0 10 10 10 * ?")
	public void run() {
	    logger.info("Current time is :: " + Calendar.getInstance().getTime());
	}
	
	@Bean
	public StopWatch watch() {
		return new StopWatch();
	}
}
