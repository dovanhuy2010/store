package com.eshop.store.dto;

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
    Integer idRole;
}
