package br.com.martins.biblioteca.conf;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return null;
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] {AppWebConfiguration.class, JPAConfiguration.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }
    
    @Override
    protected void customizeRegistration(Dynamic registration) {
        registration.setMultipartConfig(new MultipartConfigElement(""));
    }
    
//    @Override
//    protected Filter[] getServletFilters() {
//        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
//        encodingFilter.setEncoding("UTF-8");
//        
//        return new Filter[] {encodingFilter};
//    }
}
