//package com.eshop.store.controller;
//
//import com.eshop.store.dto.UserDto;
//import com.eshop.store.entity.Role;
//import com.eshop.store.entity.User;
//import com.eshop.store.repositories.UserRepository;
//import com.eshop.store.service.UserService;
//import com.eshop.store.service.UserServiceImpl;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationListener;
//import org.springframework.context.event.ContextRefreshedEvent;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Component;
//
//@Component
//public class DataSeedingListener implements ApplicationListener<ContextRefreshedEvent> {
//    @Autowired
//    private UserRepository userRepository;
//
//    @Autowired
//    private UserService userService;
//
//    @Autowired
//    private PasswordEncoder passwordEncoder;
//
//    @Override
//    public void onApplicationEvent(ContextRefreshedEvent arg0) {
//        User user = new User();
//        user.setName("van huy");
//        user.setPassword(passwordEncoder.encode("230398"));
//        user.setEmail("dovanhuy2010@gmail.com");
//        user.setPhone("0364887111");
//        user.setStatus(1);
//        Role role = new Role(1,"ROLE_ADMIN",null);
//        user.setRole(role);
//        userRepository.save(user);
//
//    }
//}
