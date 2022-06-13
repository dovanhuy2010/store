package com.eshop.store.repositories;

import com.eshop.store.dto.UserRoleDto;
import com.eshop.store.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {
    @Query(value = " select new com.eshop.store.dto.UserRoleDto(ur.id, ur.userId, r.roleName)  from UserRole ur " +
                    " inner join Role r on r.id = ur.roleId " +
                    " where ur.userId = :userId group by ur.userId")
    List<UserRoleDto> findByUserId(@Param("userId") int userId);

    void deleteByUserId(int userId);

//    List<UserRole> findByUserId(int userid);
}
