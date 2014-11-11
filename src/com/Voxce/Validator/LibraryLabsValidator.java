package com.Voxce.Validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.Voxce.model.Labs;

public class LibraryLabsValidator implements Validator {

	@Override
	public boolean supports(Class<?> cls) {
		// TODO Auto-generated method stub
		return Labs.class.equals(cls);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		
		ValidationUtils.rejectIfEmpty(arg1, "code", "labcode.required");
		ValidationUtils.rejectIfEmpty(arg1, "name", "labname.required");		
	}

}
