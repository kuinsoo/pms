package kr.or.ddit.commons.schedul;

import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.support.PeriodicTrigger;
import org.springframework.stereotype.Component;

@Component
public class DynamicSchedule extends DynamicScheduleAbstractScheduler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/*실행로직*/
	@Override
	public void runner() {
		logger.info("date: {}",new Date());
	}

	/*실행주기*/
	@Override
	public Trigger getTrigger() {
		return new PeriodicTrigger(1, TimeUnit.SECONDS);
	}
}
