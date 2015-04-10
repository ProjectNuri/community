package com.world.nuri.services.config;

import javax.persistence.EntityManagerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@Configuration
@PropertySource("classpath:/config.properties")
@EnableCaching
@EnableTransactionManagement
@Import({LocalDataSourceConfiguration.class/*, MysqlDataSourceConfiguration.class*/})
@ComponentScan(basePackages = {"com.world.nuri.services.model", "com.world.nuri.services.service"})
public class ServicesConfiguration {
	public static final String UPLOADS_DIRECTORY = "/";

//	@Autowired
//	@Qualifier("authEntityManager")
//	EntityManagerFactory authEntityManagerFactory;
	
	@Autowired
	@Qualifier("localEntityManager")
	EntityManagerFactory localEntityManagerFactory;
	
//	@Autowired
//	@Qualifier("reposEntityManager")
//	EntityManagerFactory reposEntityManagerFactory;

//	@Bean(name="authTransactionManager")
//    public PlatformTransactionManager authTransactionManager() throws Exception {
//        return new JpaTransactionManager(authEntityManagerFactory);
//    }
	
    @Primary
    @Bean(name="localTransactionManager")
    public PlatformTransactionManager localTransactionManager() throws Exception {
        return new JpaTransactionManager(localEntityManagerFactory);
    }
    
//    @Bean(name="reposTransactionManager")
//    public PlatformTransactionManager repoTransactionManager() throws Exception {
//        return new JpaTransactionManager(reposEntityManagerFactory);
//    }
}
