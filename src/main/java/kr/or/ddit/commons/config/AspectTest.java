package kr.or.ddit.commons.config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * kr.or.ddit.commons.config
 * null.java
 * Desc :
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-26 / 오후 1:58
 * @Version :
 */
@Aspect
@Component
public class AspectTest {
	private static final Logger logger = LoggerFactory.getLogger(AspectTest.class);


//	@Before("execution(* kr.or.ddit.card.service.*.*(..))")
	public void onBeforeHandler(JoinPoint joinPoint) {
		logger.debug("=======================  onBeforeThing");
	}

//	@After("execution(* kr.or.ddit.member.service.*.*Aop(..))")
	public void onAfterHandler(JoinPoint joinPoint) {
		logger.debug("=============== onAfterHandler");
	}

//	@AfterReturning(pointcut = "execution(* kr.or.ddit.member.service.*.*Aop(..))", returning = "str")
	public void onAfterReturningHandler(JoinPoint joinPoint, Object str) {
		logger.debug("@AfterReturning : " + str);
		logger.debug("=============== onAfterReturningHandler");
	}

//	@Pointcut("execution(* kr.or.ddit.member.service.*.*Aop(..))")
	public void onPointcut(JoinPoint joinPoint) {
		logger.debug("=============== onPointcut");
	}
	}


