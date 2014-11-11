package com.Voxce.tld;

import java.util.List;

public class Functions {
	public static int rightsofView(List<String> input,String value)
    {
		if(input.size()<=0)
			return 0;
			value=value.toLowerCase().trim();
		for(int i=0;i<input.size();i++){
        	try{
        		if(input.get(i).equals(value)){
        		
            		return Integer.parseInt(input.get(i+1));
            	}
        	}catch (Exception e) {
        		e.printStackTrace();
				// TODO: handle exception
        		
			}
        }
		
        return 0;
    }	
	
	public static int length(String value){
		return value.length();
	}
	
}
