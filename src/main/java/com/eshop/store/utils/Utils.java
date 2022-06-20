package com.eshop.store.utils;

import com.eshop.store.dto.Response;
import com.eshop.store.dto.ReturnCode;

public class Utils {

    public static Response createResponse(final ReturnCode returnCode) {
        final Response response = new Response();
        response.setCode(returnCode.getValue());
        response.setStatus(returnCode.getStatus());
        return response;
    }

    public static Response createResponse(final ReturnCode returnCode, Object data) {
        final Response response = new Response();
        response.setCode(returnCode.getValue());
        response.setStatus(returnCode.getStatus());
        response.setData(data);
        return response;
    }

    public static Response createResponse(final ReturnCode returnCode, Object data, String message) {
        final Response response = new Response();
        response.setCode(returnCode.getValue());
        response.setStatus(returnCode.getStatus());
        response.setData(data);
        response.setMsg(message);
        return response;
    }
}
