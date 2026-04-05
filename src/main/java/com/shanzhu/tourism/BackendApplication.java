package com.shanzhu.tourism;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * SpringBoot 启动类
 * 项目启动入口（点击右键 选择 "run BackendApplication" 启动项目）
 *
 * 什么是SpringBoot？（https://www.php.cn/faq/498384.html）
 *
 * 
 * @date: 2024-08-10
 */
@Slf4j
@SpringBootApplication(scanBasePackages = "com.shanzhu.*")
@ComponentScan("com.shanzhu")
@MapperScan("com.**.mapper")
public class BackendApplication {

    public static void main(String[] args) {

        //SpringBoot 执行启动
        SpringApplication.run(BackendApplication.class, args);

        log.info("=====================项目后端启动成功============================");
    }

}