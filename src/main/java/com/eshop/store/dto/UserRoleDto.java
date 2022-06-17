package com.eshop.store.dto;

import com.eshop.store.entity.UserRole;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class UserRoleDto {

    int roleId;
    String roleName;

    public UserRole mapperUserRole(int userId){
        return new UserRole(null,userId,roleId);
    }

    public UserRoleDto(int roleId, String roleName) {
        this.roleId = roleId;
        this.roleName = roleName;
    }
}
