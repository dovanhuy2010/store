package com.eshop.store.dto;

import com.eshop.store.entity.UserRole;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class UserRoleDto {
    int id;
    int roleId;
    String roleName;

    public UserRole mapperUserRole(int userId){
        return new UserRole(id,userId,roleId);
    }

    public UserRoleDto(int id, int roleId, String roleName) {
        this.id = id;
        this.roleId = roleId;
        this.roleName = roleName;
    }
}
