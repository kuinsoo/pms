package kr.or.ddit.commons.schedul;

import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.PeriodicTrigger;
import org.springframework.stereotype.Component;

@Component
public class ProgrammableScheduler {
	private ThreadPoolTaskScheduler scheduler;

	public void stopScheduler() {
		scheduler.shutdown();
	}

	public void startScheduler() {
		scheduler = new ThreadPoolTaskScheduler();
		scheduler.initialize();
		// 스케쥴러가 시작되는 부분 
		scheduler.schedule(getRunnable(), getTrigger());
	}

	private Runnable getRunnable(){
		return () -> {
			// do something 
			System.out.println(new Date());
		};
	}

	private Trigger getTrigger() {
		// 작업 주기 설정 
		return new PeriodicTrigger(1, TimeUnit.SECONDS);
	}
}