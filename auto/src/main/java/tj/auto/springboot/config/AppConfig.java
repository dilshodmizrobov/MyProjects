package tj.auto.springboot.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.hibernate.SessionFactory;
import org.hibernate.jpa.HibernatePersistenceProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@ComponentScan(basePackages = "tj.auto.springboot")
@EnableTransactionManagement
@EnableJpaRepositories("tj.auto.springboot.dao")
public class AppConfig {
    @Autowired
    private Environment env;
    private static Logger logger = LoggerFactory.getLogger(AppConfig.class);

    @Bean(name = "dataSource")
    public DataSource dataSource(){
      try{
          /*DriverManagerDataSource dataSource=new DriverManagerDataSource();
        dataSource.setDriverClassName(env.getProperty("spring.datasource.driver-class-name"));
        dataSource.setUrl(env.getProperty("spring.datasource.url"));
        dataSource.setUsername(env.getProperty("spring.datasource.username"));
        dataSource.setPassword(env.getProperty("spring.datasource.password"));
        System.out.println("## getDataSource: " + dataSource);
          return dataSource;*/
          HikariConfig config = new HikariConfig();
          config.setJdbcUrl(env.getProperty("spring.datasource.url"));
          config.setUsername(env.getProperty("spring.datasource.username"));
          config.setPassword(env.getProperty("spring.datasource.password"));
          config.addDataSourceProperty("cachePrepStmts", "true");
          config.addDataSourceProperty("prepStmtCacheSize", "250");
          config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
          HikariDataSource ds = new HikariDataSource(config);
          return ds;
    }catch (Exception e){
          logger.error("Mysql DataSource bean cannot be created!",e);
      }
       return null;
    }
    private Properties hibernateProperties(){
        Properties hibernateProps=new Properties();
        hibernateProps.put("hibernate.dialect", env.getProperty("spring.jpa.properties.hibernate.dialect"));
        hibernateProps.put("hibernate.format_sql", env.getProperty("spring.jpa.properties.hibernate.format_sql"));
        hibernateProps.put("hibernate.show_sql", env.getProperty("spring.jpa.show-sql"));
        //hibernateProps.put("hibernate.max_fetch_depth", env.getProperty("spring.jpa.properties.hibernate.max_fetch_depth"));
        //hibernateProps.put("hibernate.jdbc.fetch_size", env.getProperty("spring.jpa.properties.hibernate.jdbc.fetch_size"));
        //hibernateProps.put("hibernate.jdbc.batch_size", env.getProperty("spring.jpa.properties.hibernate.jdbc.batch_size"));
    return hibernateProps;
    }
    /*@Bean
    public SessionFactory sessionFactory() throws Exception {
        LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
        factoryBean.setPackagesToScan("tj.auto.springboot.entity");
        factoryBean.setDataSource(dataSource());
        factoryBean.setHibernateProperties(hibernateProperties());
        factoryBean.afterPropertiesSet();
        SessionFactory sf = factoryBean.getObject();
        System.out.println("## getSessionFactory: " + sf);
        return sf;
    }*/
    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
        entityManagerFactoryBean.setDataSource(dataSource());
        entityManagerFactoryBean.setPersistenceProviderClass(HibernatePersistenceProvider.class);
        entityManagerFactoryBean.setPackagesToScan("tj.auto.springboot.entity");
        entityManagerFactoryBean.setJpaProperties(hibernateProperties());
        return entityManagerFactoryBean;
    }
    @Bean
    public JpaTransactionManager transactionManager() {
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(entityManagerFactory().getObject());
        return transactionManager;
    }
   /* @Bean("transactionManager")
    public PlatformTransactionManager transactionManager() throws Exception {
        return new HibernateTransactionManager(sessionFactory());
    }*/
}
