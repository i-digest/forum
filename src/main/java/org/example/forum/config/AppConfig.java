package org.example.forum.config;

import org.example.forum.service.ForumService;
import org.example.forum.service.TopicService;
import org.example.forum.service.UserService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.support.ServletContextAttributeExporter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import javax.servlet.ServletContext;
import java.util.HashMap;
import java.util.Map;

@EnableWebMvc
@Configuration
public class AppConfig implements WebMvcConfigurer {

    @Value("${spring.mvc.view.prefix}")
    String prefix;

    @Value("${spring.mvc.view.suffix}")
    String suffix;

    @Bean
    public ServletContextAttributeExporter servletContextAttributeExporter(final ServletContext servletContext, final ForumService forumService, final UserService userService, final TopicService topicService) {
        ServletContextAttributeExporter servletContextAttributeExporter = new ServletContextAttributeExporter();
        servletContextAttributeExporter.setServletContext(servletContext);
        final Map<String, Object> map = new HashMap<>();
        map.put("forumService", forumService);
        map.put("userService", userService);
        map.put("topicService", topicService);

        servletContextAttributeExporter.setAttributes(map);
        return servletContextAttributeExporter;
    }

    @Bean
    public InternalResourceViewResolver internalResourceViewResolver() {
        final InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
        internalResourceViewResolver.setViewClass(JstlView.class);
        internalResourceViewResolver.setExposeContextBeansAsAttributes(true);
        internalResourceViewResolver.setPrefix(this.prefix);
        internalResourceViewResolver.setSuffix(this.suffix);

        return internalResourceViewResolver;
    }

    @Bean
    public BeanNameViewResolver beanNameViewResolver(){
        return new BeanNameViewResolver();
    }

    @Override
    public void addViewControllers(final ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/forum").setViewName("forum");
        registry.addViewController("/topic").setViewName("topic");
        registry.addViewController("/view").setViewName("view");
        registry.addViewController("/signIn").setViewName("signIn");
        registry.addViewController("/join").setViewName("join");
        registry.addViewController("/signOutAction").setViewName("signOutAction");
        registry.addViewController("/addForum").setViewName("addForum");
        registry.addViewController("/addTopic").setViewName("addTopic");
        registry.addViewController("/updateTopic").setViewName("updateTopic");
        registry.addViewController("/updateForum").setViewName("updateForum");
        registry.addViewController("/deleteTopic").setViewName("deleteTopic");
        registry.addViewController("/deleteForum").setViewName("deleteForum");
    }
}
