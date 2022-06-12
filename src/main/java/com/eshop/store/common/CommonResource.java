package com.eshop.store.common;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class CommonResource {

    @Getter
    @Value("${spring.redis.host}")
    private String redisHost;

    @Getter
    @Value("${spring.redis.port}")
    private int redisPort;

}
