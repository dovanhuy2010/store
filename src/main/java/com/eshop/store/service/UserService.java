package com.eshop.store.service;

import com.eshop.store.dto.DataRes;
import com.eshop.store.dto.UserDto;
import com.eshop.store.entity.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    Iterable<User> findAll();

    UserDto findById(Integer id);

    DataRes findByEmail(String email);

    Long countAll();

    DataRes deleteById(int id);

    DataRes saveUser(UserDto userDto, int method);

    DataRes updateUser(UserDto userDto);

    DataRes registerUser(UserDto userDto);

    DataRes confirmCode(String code);

    DataRes confirmEmail(String email);

    DataRes forgotPassword(String email,String password);
}
