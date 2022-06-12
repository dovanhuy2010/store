package com.eshop.store.service;

import com.eshop.store.dto.DataRes;
import com.eshop.store.dto.UserRoleDto;
import com.eshop.store.entity.UserRole;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserRoleService {
    List<UserRoleDto> finByUserId(int id);
    DataRes saveUserRole(List<UserRoleDto> userRoleDtoList, int userId);
//    void deleteBy
}
