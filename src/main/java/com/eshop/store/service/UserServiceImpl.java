package com.eshop.store.service;

import com.eshop.store.dto.UserDto;
import com.eshop.store.entity.User;
import com.eshop.store.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private EmailService emailService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleService roleService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    //

    @Override
    public Iterable<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public UserDto findById(Integer id) {
        User user = userRepository.findById(id).get();
        UserDto userDto = new UserDto(user.getId(), user.getName(), user.getEmail(), user.getPhone(), user.getPassword(), user.getRole().getId());
        return userDto;
    }

    @Override
    public UserDto findByEmail(String email) {
        UserDto userDto;
        User user = userRepository.findByEmail(email);
        if (userRepository.findByEmail(email) == null) {
            return null;
        } else {
            userDto = new UserDto(user.getId(), user.getName(), user.getEmail(), user.getPhone(), user.getPassword(), user.getRole().getId());
        }
        return userDto;
    }

    @Override
    public Long countAll() {
        return null;
    }

    @Override
    public void deleteById(Integer id) {
        userRepository.deleteById(id);
    }

    @Override
    public void saveUser(UserDto userDto) {
        saveUser(userDto, ACTIVE);
    }

    @Override
    public void saveUser(UserDto userDto, Integer status) {
        if (userDto.getIdRole() <= 0 || userDto.getIdRole() == null) {
            userDto.setIdRole(2);
        }
        User user = convertToUser(userDto);
        user.setStatus(status);
        user.setCode(UUID.randomUUID().toString());
        if (userDto.getPassword().isEmpty() != true ){
            user.setPassword(userRepository.findByEmail(userDto.getEmail()).getPassword());
        }
        userRepository.save(user);

        //send mail
        if (status == UserService.DEACTIVE) {

            if (user.getStatus() == UserService.DEACTIVE) {

                String title = "XÁC NHẬN ĐĂNG KÝ TÀI KHOẢN";
                String body = "Click vào đây " + "http://localhost:8080/verify/" + user.getCode()
                        + " để xác nhận đăng ký tài khoản với mật khẩu là: " + userDto.getPassword();
                emailService.sendMail(title, body, user.getEmail());
            }
//            else {
//                String code = String.valueOf(ThreadLocalRandom.current().nextInt(111111, 999999));
//                user.setCode(code);
//                String title = "MÃ XÁC NHẬN ĐỔI MẬT KHẨU";
//                String body = "Mã xác nhận của bạn là " + code + ", bạn không được cung cấp mã xác nhận này cho bất kỳ ai.";
//                emailService.sendMail(title, body, user.getEmail());
//            }
        }
    }


    //
    @Override
    public boolean activeAcc(String code) {
        User user = userRepository.findFirstByCode(code);
        if (user == null) {
            return false;
        }
        user.setCode("");
        user.setStatus(ACTIVE);
        userRepository.save(user);
        return true;
    }

    private User convertToUser(UserDto userDto) {
        User user = new User();
        user.setId(userDto.getId());
        user.setName(userDto.getName());
        user.setEmail(userDto.getEmail());
        user.setPhone(userDto.getPhone());
        user.setPassword(userDto.getPassword());
        user.setRole(roleService.findById(userDto.getIdRole()));
        return user;
    }
}
