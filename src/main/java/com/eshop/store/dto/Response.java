package com.eshop.store.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = false)
public class Response implements Serializable {
    private int code;
    private String status;
    private String msg;
    private Object data;
}
