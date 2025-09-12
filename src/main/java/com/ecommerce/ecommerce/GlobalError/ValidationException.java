package com.ecommerce.ecommerce.GlobalError;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.CONFLICT)
public class ValidationException extends RuntimeException {
    public ValidationException(String e) {
        super(e);
    }
}
