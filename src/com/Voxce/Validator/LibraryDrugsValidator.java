package com.Voxce.Validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.Voxce.model.Drugs;

public class LibraryDrugsValidator implements Validator{


	@Override
	public boolean supports(Class<?> cls) {
		// TODO Auto-generated method stub
		return Drugs.class.equals(cls);
	}

	@Override
	public void validate(Object obj, Errors error) {
		// TODO Auto-generated method stub
		
		ValidationUtils.rejectIfEmpty(error, "code", "drugcode.required");
		ValidationUtils.rejectIfEmpty(error, "name", "drugname.required");
		//ValidationUtils.rejectIfEmpty(error, "normal_value", "drugnormalvalue.required");
		
		//Drugs drug = (Drugs) obj;
		
	/*	if(drug.getNormal_value() < 0 )
			ValidationUtils.rejectIfEmpty(error, "normal_value", "negative.value");
		
		if(drug.getPer_normal_value() < 0)
			ValidationUtils.rejectIfEmpty(error, "normal_value", "negative.value");
		
		
		System.out.println ("validate type code = " + drug.getCode());
		
		if(drug.getType()==null || drug.getType().equals("")) {
			
			System.out.println("type is null");
			error.reject("type", "null.value");
		}
		*/
			
	}

}

