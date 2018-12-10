/**
 * @tilte	: 어플리케이션 초기화
 * @package	: kr.co.nextlab.config
 * @file	: AppInitializer.java
 * @author	: jnlee
 * @date	: 2017. 11. 3.
 * @desc	: 
 */
package kr.co.nextlab.config;

import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

public class AppInitializer implements WebApplicationInitializer {
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(AppConfiguration.class);
		ctx.setServletContext(servletContext);
		
		servletContext.addListener(new ContextLoaderListener(ctx));
		
		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", new DispatcherServlet(ctx));
		servlet.setLoadOnStartup(0);
		servlet.addMapping("/");
		registerCharacterEncodingFilter(servletContext);
		servlet.setInitParameter("throwExceptionIfNoHandlerFound", "true");
	}
	
	private void registerCharacterEncodingFilter(ServletContext context) {
		FilterRegistration.Dynamic characterEncodingFilter = context.addFilter("characterEncodingFilter",
				new CharacterEncodingFilter());
		characterEncodingFilter.addMappingForUrlPatterns(EnumSet.allOf(DispatcherType.class), true, "/*");
		characterEncodingFilter.setInitParameter("encoding", "UTF-8");
		characterEncodingFilter.setInitParameter("forceEncoding", "true");
	}
	
}
