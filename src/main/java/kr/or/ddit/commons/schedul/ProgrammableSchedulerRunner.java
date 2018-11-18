package kr.or.ddit.commons.schedul;

import org.springframework.beans.factory.annotation.Autowired;

public class ProgrammableSchedulerRunner {
	@Autowired
	ProgrammableScheduler scheduler;

	public void runSchedule(){
		// called by somewhere 
		scheduler.startScheduler();
	}
}
