package com.eshop.store.repositories;

import org.springframework.stereotype.Repository;


@Repository
public interface RedisRepository {
    boolean saveUser(String key,Object object);

    Object findUserByKey(String key);

    boolean deleteUser(String key);

    Boolean checkKey(String key);
}
