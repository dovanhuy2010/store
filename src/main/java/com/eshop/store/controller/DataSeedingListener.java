//package com.eshop.store.controller;
//
//import com.eshop.store.service.RedisService;
//import lombok.RequiredArgsConstructor;
//import org.springframework.context.ApplicationListener;
//import org.springframework.context.event.ContextRefreshedEvent;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.stereotype.Component;
//
//import java.util.concurrent.TimeUnit;
//
//@Component
//public class DataSeedingListener implements ApplicationListener<ContextRefreshedEvent> {
//
//    @Override
//    public void onApplicationEvent(ContextRefreshedEvent arg0) {
//        String key = "hien";
//        String values = "huy";
//        template.opsForValue().set(key,values);
//        template.expire(key,120, TimeUnit.MILLISECONDS);
//    }
//}
