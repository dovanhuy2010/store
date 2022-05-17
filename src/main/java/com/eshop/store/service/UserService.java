package com.eshop.store.service;

import com.eshop.store.dto.UserDto;
import com.eshop.store.entity.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    static final Integer ACTIVE = 1;
    static final Integer DEACTIVE = 0;

    Iterable<User> findAll();

    UserDto findById(Integer id);

    UserDto findByEmail(String email);

    Long countAll();

    void deleteById(Integer id);

    void saveUser(UserDto UserDto);

    void saveUser(UserDto userDto,Integer status);

    boolean activeAcc(String code);
}
