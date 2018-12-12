package kr.or.ddit.commons.web;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

/**
 * kr.or.ddit.commons.web
 * null.java
 * Desc : Custom Error Controller
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-12 / 오전 11:03
 * @Version :
 */
@Controller
public class MyErrorController implements ErrorController {


	@RequestMapping(value = "/error")
	public String handleError(HttpServletRequest request) {
		//do something like lgging
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

		if (status != null) {
			Integer statusCode = Integer.valueOf(status.toString());

			if(statusCode == HttpStatus.NOT_FOUND.value()) {
				return "redirect:/error-404";
			}

			if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
				return "redirect:/error-500";
			}
			else {
				return "redirect:/error-404";
			}
		}
		return "error";
	}

	@Override
	public String getErrorPath() {
		return "/error";
	}

	@RequestMapping(value = "/error-404")
	public String error404() {
		return "error/error-404";
	}

	@RequestMapping(value = "/error-500")
	public String error500() {
		return "error/error-500";
	}

}
