/**
 * @title	: 어플리케이션 기본 설정
 * @package	: kr.co.nextlab.config
 * @file	: AppConfiguration.java
 * @author	: jnlee
 * @date	: 2017. 11. 3.
 * @desc	: 
 */
package kr.co.nextlab.config;

import java.io.IOException;
import java.util.Locale;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.handler.AbstractHandlerMapping;
import org.springframework.web.servlet.handler.MappedInterceptor;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

import kr.co.nextlab.interceptor.AuthInterceptor;
import kr.co.nextlab.interceptor.BaseInterceptor;
import kr.co.nextlab.util.PropertyUtil;

import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
@EnableWebMvc
@ComponentScan("kr.co.nextlab")
@PropertySource("classpath:config-${spring.profiles.active}/app.properties")
@ImportResource(value={ "classpath:transaction-config.xml"})
public class AppConfiguration extends WebMvcConfigurationSupport {

	@Autowired
	private Environment env;
	
	@Value("${spring.profiles.active}")
	private String active;
	
	@Autowired
	private AuthInterceptor authInterceptor;
	
	@Override
	@Bean
	public HandlerMapping resourceHandlerMapping() {
		AbstractHandlerMapping handlerMapping = (AbstractHandlerMapping) super.resourceHandlerMapping();
		handlerMapping.setOrder(1);
		return handlerMapping;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/js/**").addResourceLocations("/resources/js/");
		registry.addResourceHandler("/css/**").addResourceLocations("/resources/css/");
		registry.addResourceHandler("/images/**").addResourceLocations("/resources/images/");
		registry.addResourceHandler("/robots.txt").addResourceLocations("/robots.txt");
	}
	
	@Bean
	public MappedInterceptor baseInterceptor()
	{
		String [] includePatterns = {"/**"};
		String [] excludePatterns = {"/js/**","/css/**","/images/**","/robots.txt"};
		return new MappedInterceptor(includePatterns, excludePatterns, new BaseInterceptor());
	}
	
	@Bean
	public MappedInterceptor authInterceptorMapped()
	{
		String [] includePatterns = {"/**"};
		String [] excludePatterns = {"/js/**","/css/**","/images/**","/robots.txt"};
		return new MappedInterceptor(includePatterns, excludePatterns, authInterceptor);
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] { "classpath:tiles.xml" });
		tilesConfigurer.setCheckRefresh(true);
		return tilesConfigurer;
	}
	
	@Bean
	public UrlBasedViewResolver urlBasedViewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(TilesView.class);
		viewResolver.setOrder(2);
		return viewResolver;
	}
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setOrder(3);
		return viewResolver;
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		return resolver;
	}
	
	@Bean
	public JavaMailSenderImpl mailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost(env.getProperty("mail.host"));
		mailSender.setPort(Integer.parseInt(env.getProperty("mail.port")));
		mailSender.setUsername(env.getProperty("mail.username"));
		mailSender.setPassword(env.getProperty("mail.password"));
		mailSender.setJavaMailProperties(additionalMailProperties());
		return mailSender;
	}
	
	private Properties additionalMailProperties() {
		Properties properties = new Properties();
		properties.setProperty("mail.transport.protocol", env.getProperty("mail.transport.protocol"));
		properties.setProperty("mail.smtp.auth", env.getProperty("mail.smtp.auth"));
		properties.setProperty("mail.smtp.starttls.enable", env.getProperty("mail.smtp.starttls.enable"));
		properties.setProperty("mail.debug", env.getProperty("mail.debug"));
		return properties;
	}
	
	@Bean
	public MessageSource messageSource(){
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasenames("classpath:message/message");
		messageSource.setDefaultEncoding("UTF-8");
		return messageSource;
	}
	
	@Bean
	public LocaleResolver localeResolver() {
		SessionLocaleResolver localeResolver = new SessionLocaleResolver();
		localeResolver.setDefaultLocale(new Locale("ko"));
		return localeResolver;
	}
	
	@Bean
	public MessageSourceAccessor messageSourceAccessor() {
		return new MessageSourceAccessor(messageSource());
	}
	
	@Bean
	public LocaleChangeInterceptor localeChange() {
		LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
		localeChangeInterceptor.setParamName("lang");
		return localeChangeInterceptor;
	}
	
	@Bean
	public MappedInterceptor localeChangeInterceptor()
	{
		String [] includePatterns = {"/**"};
		String [] excludePatterns = {"/js/**","/css/**","/images/**","/robots.txt"};
		return new MappedInterceptor(includePatterns, excludePatterns, localeChange());
	}
	
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(localeChangeInterceptor());
	}
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer placeHolderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	@Bean
	public PropertyUtil propertyUtil() throws IOException {
		return new PropertyUtil(new ClassPathResource("config-" + active + "/app.properties"));
	}
	
}
