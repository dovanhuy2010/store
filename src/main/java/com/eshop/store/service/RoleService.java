package com.eshop.store.service;

import com.eshop.store.entity.Role;
import org.springframework.stereotype.Service;

@Service
public interface RoleService {
    Iterable<Role> findAll();
    Role findById(Integer id);
    long count();

}
