package com.Voxce.Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RedirectController {
	public  void RedirectHome(HttpServletRequest request,HttpServletResponse response,List<String> resourceList)throws Exception {
			if(resourceList.size()<=0){
				response.sendRedirect("login.htm");
			}
			else if(indexof(resourceList, "Home")==1){
		
				response.sendRedirect("ShowHomeIndex.home");
			}
			else if(indexof(resourceList, "User Management")==1){
				response.sendRedirect("showUsersindex.users");
			}
			else if(indexof(resourceList, "Group Management")==1){
				response.sendRedirect("showGroupsindex.groups");
			}
			else if(indexof(resourceList, "Library")==1){
				response.sendRedirect("drugs/showDrugsIndex.drugs?FormCalled=add_drug_form");
			}
			else if(indexof(resourceList, "Sponsor")==1){
				response.sendRedirect("ShowSponsorDivIndex.spondiv");
			}
			else if(indexof(resourceList, "Sites")==1){
				response.sendRedirect("ShowSitesIndex.sites");
			}
			else if(indexof(resourceList, "Visits")==1){
				response.sendRedirect("ShowVisitsIndex.visits");
			}
			
			else if(indexof(resourceList, "CRF")==1){
				response.sendRedirect("ShowCRFIndex.crf?CurrentForm=add_question_form");
			}
			else{
				request.getSession().invalidate();
				response.sendRedirect("Logout.htm");
			}
		
	}

	public void RedirectLibrary(HttpServletRequest request, HttpServletResponse response,List<String> resourceList)throws Exception{
		if(resourceList.size()<=0){
			response.sendRedirect("login.htm");
		}
		else if(indexof(resourceList, "Drugs")==1)
		{
			//response.sendRedirect("drug/showDrugsIndex.drugs?FormCalled=add_drug_form");
		}
		else if(indexof(resourceList, "Countries")==1)
		{
			response.sendRedirect("../country/showCountriesIndex.countries?FormCalled=add_country_form");
		}
		else if(indexof(resourceList, "Labs")==1)
		{
			
			response.sendRedirect("../labs/showLabIndex.labs?FormCalled=add_lab_form");
		}
		else if(indexof(resourceList, "Laboratory")==1)
		{
			response.sendRedirect("../laboratory/showLaboratoryIndex.laboratory?FormCalled=add_laboratory_form");
		}
		else if(indexof(resourceList, "Units of Measures")==1)
		{
			response.sendRedirect("../uom/showUnitsOfMeasureIndex.unitsofmeasure?FormCalled=add_unitsofmeasure_form");
		}
		else if(indexof(resourceList, "Action Texts")==1)
		{
			response.sendRedirect("../ac_txt/showActionTextsIndex.actiontexts?FormCalled=add_actiontext_form");
		}
		
		else if(indexof(resourceList, "Categories")==1)
		{
			response.sendRedirect("../categories/showCategoriesIndex.categories?FormCalled=add_category_form");
		}
		else if(indexof(resourceList, "Query Statuses")==1)
		{
			response.sendRedirect("../querystatus/showQueryStatusesIndex.querystatuses?FormCalled=add_querystatus_form");
		}
		else if(indexof(resourceList, "Resolutions")==1)
		{
			response.sendRedirect("../resolution/showResolutionsIndex.resolutions?FormCalled=add_resolution_form");
		}
		else if(indexof(resourceList, "Question Texts")==1)
		{
			response.sendRedirect("../qu_txt/showQuestionTextsIndex.questiontexts?FormCalled=add_questiontext_form");
		}
		else if(indexof(resourceList, "Answer Texts")==1)
		{
			response.sendRedirect("../ans_txt/showAnswerTextsIndex.answertexts?FormCalled=add_answertext_form");
		}
		else if(indexof(resourceList, "Default Answer Texts")==1)
		{
			response.sendRedirect("../dans_txt/showDefaultAnswerTextsIndex.defaultanswertexts?FormCalled=add_defaultanswertext_form");
		}
		else if(indexof(resourceList, "Discrepency Texts")==1)
		{
			response.sendRedirect("../disc_txt/showDiscrepancyTextsIndex.discrepancytexts?FormCalled=add_discrepancytext_form");
		}
		else if(indexof(resourceList, "Recieved CRF Statuses")==1)
		{
			response.sendRedirect("../rcs/showReceivedCrfStatusesIndex.receivedcrfstatuses?FormCalled=add_rcs_form");
		}
		else if(indexof(resourceList, "Section Name Texts")==1)
		{
			response.sendRedirect("../snt/showSectionNameTextsIndex.sectionnametexts?FormCalled=add_sectionnametext_form'");
		}
		else if(indexof(resourceList, "Validation Rules")==1)
		{
			response.sendRedirect("../vrules/showValidationRulesIndex.validationrules?FormCalled=add_vrule_form");
		}
		else
		{
			response.sendRedirect("../ShowSponsorDivIndex.spondiv");
		}
		
	}
	
	private int indexof(List<String> input,String value)
    {
		//return input.size();
		value=value.toLowerCase();
		
        for(int i=0;i<input.size();i++){
        	try{
        		if(input.get(i).contains(value)){
        		//	return i;
            		return Integer.parseInt(input.get(i+1));
            	}
        	}catch (Exception e) {
				// TODO: handle exception
        		
			}
        }
		
        return -1;
    }
	
	
}
