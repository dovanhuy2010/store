package com.eshop.store.service;

import com.eshop.store.dto.UserDto;
import com.eshop.store.repositories.RedisRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class RedisService {

    @Autowired
    private RedisRepository redisRepository;

    public Boolean set(String key, Object ob) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            String json = mapper.writeValueAsString(ob);
            redisRepository.saveUser(key, json);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public UserDto get(String key) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            UserDto userDto = mapper.readValue((String) redisRepository.findUserByKey(key), UserDto.class);
            return userDto;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean checkRedis(String key) {
        return redisRepository.checkKey(key);
    }
}
