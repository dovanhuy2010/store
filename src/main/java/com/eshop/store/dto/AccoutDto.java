package com.eshop.store.dto;

import com.eshop.store.entity.User;
import lombok.Data;

@Data
public class AccoutDto {
    Integer id;
    String name;
    String email;
    String phone;

    public User convertToUser(AccoutDto accoutDto){
        User user = new User();
        user.setId(accoutDto.getId());
        user.setName(accoutDto.getName());
        user.setEmail(accoutDto.getEmail());
        user.setPhone(accoutDto.getPhone());
        return user;
    }
}
