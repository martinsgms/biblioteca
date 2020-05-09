package br.com.martins.biblioteca.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import br.com.martins.biblioteca.controller.HomeController;
import br.com.martins.biblioteca.repository.ProdutoRepository;

@EnableWebMvc
@ComponentScan(basePackageClasses={HomeController.class, ProdutoRepository.class})
public class AppWebConfiguration {
    
    @Bean
    public InternalResourceViewResolver internalResourceViewResolver( ) {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        
        resolver.setPrefix("/WEB-INF/view/");
        resolver.setSuffix(".jsp");
        
        return resolver;
    }
}
