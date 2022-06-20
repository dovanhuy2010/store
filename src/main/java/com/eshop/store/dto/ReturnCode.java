package com.eshop.store.dto;

public enum ReturnCode {

    SUCCESS(1, "success"),
    ERROR(2, "system error"),
    WARNING(3, "warning"),
    CONFILICT_CODE(4, "code is exists"),
    CONFILICT_NAME(5, "name is exists"),
    CONFILICT_EMAIL(6, "email is exists"),
    CONFILICT_PHONE(7, "phone is exists"),
    // TIME WORKING
    CONFILICT_PERIOD(12,"period is conflict"),
    NOT_FOUND_BY_ID(8, "Not found ObjectS By Id"),
    REQUEST_BODY_INVALID(9, "Request Body invalid"),
    ALREADY_EXISTS(10, "Already exists"),
    ACCESS_TOKEN_NOT_EXISTS(11, "Access Token is not exists"),
    DEVICE_FULL(13, "device is full"),
    INVALID_PARAMETER(14, "INVALID PARAMETER"),
    NOT_FOUND(15, "Not found"),
    INVALID_DATE_FORMAT(16, "INVALID INVALID_DATE_FORMAT"),
    STATUS_ACTIVING(18, "OBJECT ACTIVE"),
    FK_REFERENCED(19, "FK REFERENCED"),
    //account
    USER_NOT_EXISTS(20, "user not exists"),
    USER_INACTIVATE(21, "user inactivate"),
    USER_NOT_PERMISSION(22, "user not permisstion"),
    CHECKSUM_NOT_MATCH(23,"checksum not match"),
    SEND_SMS_REACH_LIMIT(30, "SEND_SMS_REACH_LIMIT"),
    //ROLE
    ROLE_ASSIGN_USER(60, "Nhóm quyến đã gắn với tài khoản"),

    PERMISSON_ASSIGN_ROLE(65, "Quyền được gán với nhóm quyền"),

    TIME_REACH_LIMIT(70, "TIME_REACH_LIMIT"),
    SIZE_REACH_LIMIT(71, "SIZE_REACH_LIMIT"),
    EXPIRED(72, "EXPIRED");

    private final int value;
    private final String status;

    private ReturnCode(final int value, final String status) {
        this.value = value;
        this.status = status;
    }

    public int getValue() {
        return this.value;
    }

    public String getStatus() {
        return this.status;
    }
}
