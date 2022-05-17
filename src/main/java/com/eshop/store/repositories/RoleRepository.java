package com.eshop.store.repositories;

import com.eshop.store.entity.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends CrudRepository<Role, Integer> {
    Role findByRoleName(String roleName);
}
