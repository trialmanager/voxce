package com.Voxce.Validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.Voxce.model.Countries;

public class LibraryCountryValidator implements Validator{

	@Override
	public boolean supports(Class<?> cls) {
		// TODO Auto-generated method stub
		return Countries.class.equals(cls);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmpty(arg1, "COUNTRY_CODE", "countrycode.required");
		ValidationUtils.rejectIfEmpty(arg1, "COUNTRY_NAME", "countryname.required");
		ValidationUtils.rejectIfEmpty(arg1, "DESCRIPTION", "countrydescription.required");
	}

}
