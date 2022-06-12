package com.eshop.store.service;

import com.eshop.store.dto.CustomUserDetails;
import com.eshop.store.entity.User;
import com.eshop.store.repositories.RoleRepository;
import com.eshop.store.repositories.UserRepository;

import com.eshop.store.utils.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.HashSet;
import java.util.Set;

public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public CustomUserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        for (String roleName : roleRepository.findRoleNameByUserId(user.getId())) {
            grantedAuthorities.add(new SimpleGrantedAuthority(roleName));
        }
        boolean enable = user.getStatus() == Const.UserStatus.ACTIVE ? true : false;
        CustomUserDetails customUserDetails = new CustomUserDetails(user.getEmail(), user.getPassword(), enable, grantedAuthorities);
        customUserDetails.setId(user.getId());
        customUserDetails.setName(user.getName());
        customUserDetails.setPhone(user.getPhone());
        return customUserDetails;
    }
}
