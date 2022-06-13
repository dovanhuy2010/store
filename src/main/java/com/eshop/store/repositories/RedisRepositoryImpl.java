package com.eshop.store.repositories;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import java.util.concurrent.TimeUnit;

@Repository
@RequiredArgsConstructor
public class RedisRepositoryImpl implements RedisRepository {
    private final RedisTemplate<String, Object> template;

    @Override
    public boolean saveUser(String key, Object object) {
        try {
            template.opsForValue().set(key, object);
            //7200
            template.expire(key, 3600, TimeUnit.SECONDS);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Object findUserByKey(String key) {
        Object object = template.opsForValue().get(key);
        return object;
    }

    @Override
    public boolean deleteUser(String key) {
        try {
            return template.delete(key);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Boolean checkKey(String key) {
        return template.hasKey(key);
    }
}
