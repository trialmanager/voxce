package com.Voxce.Validator;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.Voxce.model.Groups;



public class CreateGroupsValidator implements Validator
{
	public boolean supports(Class<?> cls)
	{
		return Groups.class.equals(cls);
	}
	
	public void validate(Object arg0, Errors arg1)
	{
    	ValidationUtils.rejectIfEmpty(arg1, "name", "name.required");
	}
}