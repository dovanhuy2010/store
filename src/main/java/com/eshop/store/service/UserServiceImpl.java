package com.eshop.store.service;

import com.eshop.store.dto.DataRes;
import com.eshop.store.dto.UserDto;
import com.eshop.store.entity.User;
import com.eshop.store.repositories.UserRepository;
import com.eshop.store.utils.Const;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

@Slf4j
@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private EmailService emailService;

    @Autowired
    private UserRepository userRepository;

    @Override
    public Iterable<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public UserDto findById(Integer id) {
        User user = userRepository.findById(id).get();
        UserDto userDto = new UserDto(user.getId(), user.getName(), user.getEmail(), user.getPhone(), user.getPassword());
        return userDto;
    }

    @Override
    public DataRes findByEmail(String email) {
        if (StringUtils.isEmpty(email)) {
            return new DataRes(null, Const.DataRes.INVALID_DATA.getMessage(), Const.DataRes.INVALID_DATA.getCode());
        }
        User user = userRepository.findByEmail(email);
        if (Objects.isNull(user)) {
            return new DataRes(null, Const.DataRes.OBJECT_NOT_FOUND.getMessage(), Const.DataRes.OBJECT_NOT_FOUND.getCode());
        }
        UserDto userDto = new UserDto(user.getId(), user.getName(), user.getEmail(), user.getPhone(), user.getPassword());
        return new DataRes(userDto, Const.DataRes.OBJECT_NOT_FOUND.getMessage(), Const.DataRes.OBJECT_NOT_FOUND.getCode());
    }

    @Override
    public Long countAll() {
        return null;
    }

    @Override
    public DataRes deleteById(int id) {
        if (Objects.isNull(userRepository.findById(id))) {
            return new DataRes(null, Const.DataRes.OBJECT_NOT_FOUND.getMessage(), Const.DataRes.OBJECT_NOT_FOUND.getCode());
        }
        try {
            userRepository.deleteById(id);
        } catch (Exception e) {
            log.error(Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), e);
            return new DataRes(null, Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), Const.DataRes.INTERNAL_SERVER_ERROR.getCode());
        }
        return new DataRes("OK", Const.DataRes.SUCCESS.getMessage(), Const.DataRes.SUCCESS.getCode());
    }

    @Override
    public DataRes saveUser(UserDto userDto, int method) {
        if (Objects.isNull(userDto)) {
            return new DataRes("null", Const.DataRes.INVALID_DATA.getMessage(), Const.DataRes.INVALID_DATA.getCode());
        }
        if (!Objects.isNull(userRepository.findByEmail(userDto.getEmail()))) {
            return new DataRes("Email already in use", Const.DataRes.DUPLICATE_DATA.getMessage(), Const.DataRes.DUPLICATE_DATA.getCode());
        }
        User user = userDto.mapperUser();
        if (Const.UserMethod.REGISTER == method) {
            //send mail
            user = userDto.mapperUser();
            user.setCode(UUID.randomUUID().toString());
            user.setStatus(Const.UserStatus.DEACTIVE);
            sendMail(Const.UserMethod.REGISTER, user);
        } else if (Const.UserMethod.SAVE == method) {
            user.setCode("");
            user.setStatus(Const.UserStatus.ACTIVE);
        } else {
            return new DataRes("not method", Const.DataRes.OBJECT_NOT_FOUND.getMessage(), Const.DataRes.OBJECT_NOT_FOUND.getCode());
        }
        //save
        try {
            userRepository.save(user);
        } catch (Exception e) {
            log.error(Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), e);
            return new DataRes(null, Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), Const.DataRes.INTERNAL_SERVER_ERROR.getCode());
        }
        return new DataRes(userDto, Const.DataRes.SUCCESS.getMessage(), Const.DataRes.SUCCESS.getCode());
    }  //FIXME Please use UserStatus in Const

    @Override
    public DataRes registerUser(UserDto userDto) {
        if (Objects.isNull(userDto)) {
            return new DataRes("null", Const.DataRes.INVALID_DATA.getMessage(), Const.DataRes.INVALID_DATA.getCode());
        }
        User user = userRepository.findByEmail(userDto.getEmail());
        if (!Objects.isNull(user)) {
            return new DataRes("Email already in use", Const.DataRes.DUPLICATE_DATA.getMessage(), Const.DataRes.DUPLICATE_DATA.getCode());
        }

        User userCurrent = userRepository.findByEmail(userDto.getEmail());
        if (Objects.isNull(userCurrent)) {
            return new DataRes(null, Const.DataRes.OBJECT_NOT_FOUND.getMessage(), Const.DataRes.OBJECT_NOT_FOUND.getCode());
        }
        convertToUser(userCurrent, userDto);

//        send mail
        user = userDto.mapperUser();
        user.setCode(UUID.randomUUID().toString());
        user.setStatus(Const.UserStatus.DEACTIVE);
        sendMail(Const.UserMethod.REGISTER, user);
        try {
            userRepository.save(user);
        } catch (Exception e) {
            log.error(Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), e);
            return new DataRes(null, Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), Const.DataRes.INTERNAL_SERVER_ERROR.getCode());
        }
        saveUser(userDto, Const.UserMethod.REGISTER);
        return new DataRes(user, Const.DataRes.SUCCESS.getMessage(), Const.DataRes.SUCCESS.getCode());
    }

    public void sendMail(int method, User user) {
        if (user.getStatus() == Const.UserStatus.DEACTIVE) {
            String title = "XÁC NHẬN ĐĂNG KÝ TÀI KHOẢN";
            String body = "Click vào đây " + "http://localhost:8080/verify/" + user.getCode()
                    + " để xác nhận đăng ký tài khoản với email là: " + user.getEmail();
            emailService.sendMail(title, body, user.getEmail());
        }
        if (Const.UserMethod.FORGET_PASSWORD == method) {
            String title = "MÃ XÁC NHẬN ĐỔI MẬT KHẨU";
            String body = "Mã xác nhận của bạn là " + user.getCode() + ", bạn không được cung cấp mã xác nhận này cho bất kỳ ai.";
            emailService.sendMail(title, body, user.getEmail());
        }
        return;
    }

    @Override
    public DataRes updateUser(UserDto userDto) {
        if (Objects.isNull(userDto)) {
            return new DataRes("null", Const.DataRes.INVALID_DATA.getMessage(), Const.DataRes.INVALID_DATA.getCode());
        }
        if (Objects.isNull(userRepository.findByEmail(userDto.getEmail()))) {
            return new DataRes("not found user by email: {}" + userDto.getEmail(), Const.DataRes.OBJECT_NOT_FOUND.getMessage(), Const.DataRes.OBJECT_NOT_FOUND.getCode());
        }
        try {
            User user = userDto.mapperUser();
            user.setStatus(Const.UserStatus.ACTIVE);
            user.setCode("");
            userRepository.save(user);
        } catch (Exception e) {
            log.error(Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), e);
            return new DataRes(null, Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), Const.DataRes.INTERNAL_SERVER_ERROR.getCode());
        }
        return new DataRes(userDto, Const.DataRes.SUCCESS.getMessage(), Const.DataRes.SUCCESS.getCode());
    }

    //
    @Override
    public DataRes confirmCode(String code) {
        if (StringUtils.isEmpty(code)) {
            return new DataRes("null", Const.DataRes.INVALID_DATA.getMessage(), Const.DataRes.INVALID_DATA.getCode());
        }
        if (Objects.isNull(userRepository.findFirstByCode(code))) {
            return new DataRes("code invalid", Const.DataRes.OBJECT_NOT_FOUND.getMessage(), Const.DataRes.OBJECT_NOT_FOUND.getCode());
        }
        User user = userRepository.findFirstByCode(code);
        try {
            user.setStatus(Const.UserStatus.ACTIVE);
            user.setCode("");
            userRepository.save(user);
        } catch (Exception e) {
            log.error(Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), e);
            return new DataRes(null, Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), Const.DataRes.INTERNAL_SERVER_ERROR.getCode());
        }

        return new DataRes(userRepository.findFirstByCode(code).getId(), Const.DataRes.SUCCESS.getMessage(), Const.DataRes.SUCCESS.getCode());
    }

    @Override
    public DataRes confirmEmail(String email) {
        if (StringUtils.isEmpty(email)) {
            return new DataRes("email null", Const.DataRes.INVALID_DATA.getMessage(), Const.DataRes.INVALID_DATA.getCode());
        }
        User userCurrent = userRepository.findByEmail(email);
        if (Objects.isNull(userCurrent)) {
            return new DataRes("account does not exist: {}" + email, Const.DataRes.OBJECT_NOT_FOUND.getMessage(), Const.DataRes.OBJECT_NOT_FOUND.getCode());
        }
        userCurrent.setCode(String.valueOf(ThreadLocalRandom.current().nextInt(111111, 999999)));
        try {
            userRepository.save(userCurrent);
        } catch (Exception e) {
            log.error(Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), e);
            return new DataRes(null, Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), Const.DataRes.INTERNAL_SERVER_ERROR.getCode());
        }
        sendMail(Const.UserMethod.FORGET_PASSWORD, userCurrent);
        return new DataRes(email, Const.DataRes.SUCCESS.getMessage(), Const.DataRes.SUCCESS.getCode());
    }

    @Override
    public DataRes forgotPassword(String email, String password) {
        if (StringUtils.isEmpty(email)) {
            return new DataRes("email null", Const.DataRes.INVALID_DATA.getMessage(), Const.DataRes.INVALID_DATA.getCode());
        }
        User userCurrent = userRepository.findByEmail(email);
        if (Objects.isNull(userCurrent)) {
            return new DataRes("account does not exist: {}" + email, Const.DataRes.OBJECT_NOT_FOUND.getMessage(), Const.DataRes.OBJECT_NOT_FOUND.getCode());
        }
        userCurrent.setPassword(password);
        try {
            userRepository.save(userCurrent);
        } catch (Exception e) {
            log.error(Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), e);
            return new DataRes(null, Const.DataRes.INTERNAL_SERVER_ERROR.getMessage(), Const.DataRes.INTERNAL_SERVER_ERROR.getCode());
        }
        return new DataRes("OK", Const.DataRes.SUCCESS.getMessage(), Const.DataRes.SUCCESS.getCode());
    }

    private void convertToUser(User user, UserDto userDto) {
        user.setId(userDto.getId());
        user.setName(userDto.getName());
        user.setEmail(userDto.getEmail());
        user.setPhone(userDto.getPhone());
        user.setPassword(userDto.getPassword());
//        user.setRole(roleService.findById(2));  //FIXME Please Add UserRole in DataBase
//        if (userDto.getIdRole() == null) {
//            user.setStatus(Const.UserStatus.DEACTIVE);
//            userDto.setIdRole(2);
//            user.setCode(UUID.randomUUID().toString());
//        } else {
        user.setStatus(Const.UserStatus.ACTIVE);
        user.setCode(String.valueOf(ThreadLocalRandom.current().nextInt(111111, 999999)));
//        }
    }
}
