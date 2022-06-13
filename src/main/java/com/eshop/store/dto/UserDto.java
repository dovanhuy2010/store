package com.eshop.store.dto;

import com.eshop.store.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDto {
    Integer id;
    String name;
    String email;
    String phone;
    String password;

    public User mapperUser(){
        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        return user;
    }
}
