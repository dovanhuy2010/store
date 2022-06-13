package com.eshop.store.config;

import com.eshop.store.dto.CustomUserDetails;
import com.eshop.store.service.UserDetailServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {


    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailServiceImpl();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    }

    // đăng ký kiểu mã hóa mật khẩu
    @Bean
    public PasswordEncoder passwordEncoder() {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {


        http.authorizeRequests().antMatchers("/admin/user/**").access("hasRole('ROLE_ADMIN')");
        http
                .authorizeRequests()
                .antMatchers("/admin/**").authenticated()
                // những thằng api có chứa admin thì bắt buộc phải xác thực (user đăng nhạp)
                .anyRequest().permitAll();// nhưng request còn lại thì cho vào (khách)
        http.formLogin()
                .loginPage("/_admin/login")// đường dẫn để đến trang login
                .loginProcessingUrl("/_admin/doLogin")// api đăng ký để nhận xử lý luoong login
                .usernameParameter("email")// name trong form login
                .passwordParameter("password")// mật khẩu trong forrm login
                .defaultSuccessUrl("/admin")// đường dẫn mặc định sau khi login thành công
                .failureUrl("/_admin/login?message=error")  // trả về nếu login lỗi
//                .and()
//                .logout()
//                .logoutUrl("/logout")
//                .deleteCookies("JSESSIONID")
//                .logoutSuccessHandler(logoutSuccessHandler())
                .and()
                .exceptionHandling()
                .accessDeniedPage("/403"); //khi không đủ quyền sẽ redirect đến trang 403
        http.csrf().disable();
    }

    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/api/**");
    }


}
