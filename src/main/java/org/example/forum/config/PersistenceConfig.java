package org.example.forum.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories(basePackages = "org.example.forum.dao.repository")
@EnableTransactionManagement
public class PersistenceConfig {
}
