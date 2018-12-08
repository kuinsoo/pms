package kr.or.ddit.work.web;

import org.apache.maven.model.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.work.model.WorkVo;
import kr.or.ddit.work.service.WorkServiceInf;

/**
 * kr.or.ddit.work.web
 * null.java
 * Desc : 업무 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:34
 * @Version : 
 */
@Controller
public class WorkController {
	Logger logger = LoggerFactory.getLogger(WorkController.class);
	
	@Autowired
	private WorkServiceInf workService;
	
	
	@RequestMapping(value="/ajaxCreateWork",method=RequestMethod.POST)
	public String createWork(Model model, WorkVo workVo) {
		logger.debug("work {}", workVo);
		return "";
	}
}
