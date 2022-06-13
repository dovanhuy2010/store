package com.eshop.store.service;

import com.eshop.store.dto.DataRes;
import com.eshop.store.dto.UserRoleDto;
import com.eshop.store.entity.UserRole;
import com.eshop.store.repositories.UserRoleRepository;
import com.eshop.store.utils.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Objects;

@Service
public class UserRoleServiceImpl implements UserRoleService{
    @Autowired
    private UserRoleRepository userRoleRepository;

    @Autowired
    private RoleService roleService;

    @Override
    public List<UserRoleDto> finByUserId(int id) {
        List<UserRoleDto> userRoleDtos = userRoleRepository.findByUserId(id);
        if(CollectionUtils.isEmpty(userRoleDtos)){
            return null;
        }
        return userRoleDtos;
    }

    @Override
    public DataRes saveUserRole(List<UserRoleDto> userRoleDtoList, int userId) {
        if(CollectionUtils.isEmpty(userRoleDtoList)){
            return new DataRes(null,Const.DataRes.INVALID_DATA.getMessage(),Const.DataRes.INVALID_DATA.getCode());
        }

        try {
            for (UserRoleDto userRoleDto : userRoleDtoList){
                UserRole userRole = userRoleDto.mapperUserRole(userId);
                userRoleRepository.save(userRole);
            }
            return new DataRes(userRoleDtoList, Const.DataRes.SUCCESS.getMessage(),Const.DataRes.SUCCESS.getCode());
        }catch (Exception e){
            return new DataRes("",Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(),Const.DataRes.INTERNAL_SERVER_ERROR.getCode());
        }
    }

    @Override
    public DataRes deleteUserRoleByUserId(int userId) {
        List<UserRoleDto> userRoleDtos = userRoleRepository.findByUserId(userId);
        if(CollectionUtils.isEmpty(userRoleDtos)){
            return new DataRes();
        }
        try {
            userRoleRepository.deleteByUserId(userId);
        }catch (Exception e){
            return new DataRes("",Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(),Const.DataRes.INTERNAL_SERVER_ERROR.getCode());
        }
        return null;
    }
}
