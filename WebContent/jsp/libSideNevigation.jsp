<div class="left_nav" id="MainDiv">
	<div class="left_nav_header">LIBRARY</div>
	<div class="nav_body">
		<c:if test="${tl:rightsofView(resourceList,'Drugs')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Drugs</h3>
				<ul class="categoryitems">
					<c:if test="${tl:rightsofView(resourceList,'Add Drugs')==1}">
						<li><a
							href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form'/>"
							class="empty" id="add_drug">&bull; Add Drugs</a></li>
					</c:if>
					<c:if test="${tl:rightsofView(resourceList,'View Drugs')==1}">
						<li><a
							href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=list_drug_form'/>"
							class="empty" id="view_drugs">&bull; View Drugs</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Inventory</h3>
				<ul class="categoryitems">
						<li><a
							href="<c:url value='/inventory/showInventoryIndex.inventory?FormCalled=add_inventory_form'/>"
							class="empty" id="add_inventory">&bull; Add Inventory</a></li>
						<li><a
							href="<c:url value='/inventory/showInventoryIndex.inventory?FormCalled=list_inventory_form'/>"
							class="empty" id="view_inventory">&bull; View Inventory</a></li>
					
				</ul>
			</div>
		
		<%-- <c:if test="${tl:rightsofView(resourceList,'Countries')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Countries</h3>
				<ul class="categoryitems">
					<c:if test="${tl:rightsofView(resourceList,'Add Countries')==1}">
						<li><a
							href="<c:url value='/country/showCountriesIndex.countries?FormCalled=add_country_form'/>"
							id="add_country" onclick="LoadPage('countries_index.jsp')">&bull;
								Add Country</a></li>
					</c:if>
					<c:if test="${tl:rightsofView(resourceList,'View Countries')==1}">
						<li><a
							href="<c:url value='/country/showCountriesIndex.countries?FormCalled=list_countries_form'/>"
							id="view_countries" onclick="LoadPage('countries_index.jsp')">&bull;
								View Countries</a></li>
					</c:if>
				</ul>
			</div>
		</c:if> --%>
		<c:if test="${tl:rightsofView(resourceList,'LABS')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Labs</h3>
				<ul class="categoryitems">
					<c:if test="${tl:rightsofView(resourceList,'Add Labs')==1}">
						<li><a
							href="<c:url value='/labs/showLabIndex.labs?FormCalled=add_lab_form'/>"
							id="add_lab" onclick="LoadPage('labs_index.jsp')">&bull; Add
								Lab</a></li>
					</c:if>
					<c:if test="${tl:rightsofView(resourceList,'View Labs')==1}">
						<li><a
							href="<c:url value='/labs/showLabIndex.labs?FormCalled=list_labs_form'/>"
							id="view_labs" onclick="LoadPage('labs_index.jsp')">&bull;
								View Labs</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<c:if test="${tl:rightsofView(resourceList,'LABORATORY')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Laboratory</h3>
				<ul class="categoryitems">
					<c:if test="${tl:rightsofView(resourceList,'Add Laboratory')==1}">
						<li><a
							href="<c:url value='/laboratory/showLaboratoryIndex.laboratory?FormCalled=add_laboratory_form'/>"
							id="add_laboratory" onclick="LoadPage('laboratory_index.jsp')">&bull;
								Add Laboratory</a></li>
					</c:if>
					<c:if test="${tl:rightsofView(resourceList,'View Laboratory')==1}">
						<li><a
							href="<c:url value='/laboratory/showLaboratoryIndex.laboratory?FormCalled=list_laboratories_form'/>"
							id="view_laboratories" onclick="LoadPage('laboratory_index.jsp')">&bull;
								View Laboratories</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<c:if test="${tl:rightsofView(resourceList,'Units of Measures')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Units Of Measures</h3>
				<ul class="categoryitems">
					<c:if
						test="${tl:rightsofView(resourceList,'Add Units Of Measure')==1}">
						<li><a
							href="<c:url value='/uom/showUnitsOfMeasureIndex.unitsofmeasure?FormCalled=add_unitsofmeasure_form'/>"
							id="add_uom" onclick="LoadPage('unitsofmeasure_index.jsp')">&bull;
								Add Units Of Measure</a></li>
					</c:if>
					<c:if
						test="${tl:rightsofView(resourceList,'View Units Of Measure')==1}">
						<li><a
							href="<c:url value='/uom/showUnitsOfMeasureIndex.unitsofmeasure?FormCalled=list_unitsofmeasure_form'/>"
							id="view_uom" onclick="LoadPage('unitsofmeasure_index.jsp')">&bull;
								View Units Of Measure</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<c:if test="${tl:rightsofView(resourceList,'ACTION TEXTS')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Action Texts</h3>
				<ul class="categoryitems">
					<c:if test="${tl:rightsofView(resourceList,'Add Action Texts')==1}">
						<li><a
							href="<c:url value='/ac_txt/showActionTextsIndex.actiontexts?FormCalled=add_actiontext_form'/>"
							id="add_actiontext">&bull; Add Action Text</a></li>
					</c:if>
					<c:if
						test="${tl:rightsofView(resourceList,'View Action Texts')==1}">
						<li><a
							href="<c:url value='/ac_txt/showActionTextsIndex.actiontexts?FormCalled=list_actiontexts_form'/>"
							id="view_actiontexts">&bull; View Action Texts</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<c:if test="${tl:rightsofView(resourceList,'CATEGORIES')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Categories</h3>
				<ul class="categoryitems">
					<c:if test="${tl:rightsofView(resourceList,'Add Categories')==1}">
						<li><a
							href="<c:url value='/categories/showCategoriesIndex.categories?FormCalled=add_category_form'/>"
							id="add_category" onclick="LoadFormLibrary('add_category_form')">&bull;
								Add Category</a></li>
					</c:if>
					<c:if test="${tl:rightsofView(resourceList,'View Categories')==1}">
						<li><a
							href="<c:url value='/categories/showCategoriesIndex.categories?FormCalled=list_categories_form'/>"
							id="view_categories"
							onclick="LoadFormLibrary('list_categories_form')">&bull; View
								Categories</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<c:if test="${tl:rightsofView(resourceList,'QUERY STATUSES')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Query Statuses</h3>
				<ul class="categoryitems">
					<c:if test="${tl:rightsofView(resourceList,'Add Query Status')==1}">
						<li><a
							href="<c:url value='/querystatus/showQueryStatusesIndex.querystatuses?FormCalled=add_querystatus_form'/>"
							id="add_querystatus"
							onclick="LoadPage('query_statuses_index.jsp')">&bull; Add
								Query Status</a></li>
					</c:if>
					<c:if
						test="${tl:rightsofView(resourceList,'View Query Statuses')==1}">
						<li><a
							href="<c:url value='/querystatus/showQueryStatusesIndex.querystatuses?FormCalled=list_querystatuses_form'/>"
							id="view_querystatus"
							onclick="LoadPage('query_statuses_index.jsp')">&bull; View
								Query Statuses</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<c:if test="${tl:rightsofView(resourceList,'RESOLUTIONS')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Resolutions</h3>
				<ul class="categoryitems">
					<c:if test="${tl:rightsofView(resourceList,'Add Resolution')==1}">
						<li><a
							href="<c:url value='/resolution/showResolutionsIndex.resolutions?FormCalled=add_resolution_form'/>"
							id="add_resolution" onclick="LoadPage('resolutions_index.jsp')">&bull;
								Add Resolution</a></li>
					</c:if>
					<c:if test="${tl:rightsofView(resourceList,'View Resolutions')==1}">
						<li><a
							href="<c:url value='/resolution/showResolutionsIndex.resolutions?FormCalled=list_resolutions_form'/>"
							id="view_resolutions" onclick="LoadPage('resolutions_index.jsp')">&bull;
								View Resolutions</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>

		<!--   <div class="arrowlistmenu">
        <h3 class="menuheader expandable">Question Texts</h3>
        <ul class="categoryitems">
        <li><a href="<c:url value='/qu_txt/showQuestionTextsIndex.questiontexts?FormCalled=add_questiontext_form'/>"  id="add_questiontext" onclick="LoadPage('questiontexts_index.jsp')">&bull; Add Question Text</a></li>
        <li><a href="<c:url value='/qu_txt/showQuestionTextsIndex.questiontexts?FormCalled=list_questiontexts_form'/>" id="view_questiontexts" onclick="LoadPage('questiontexts_index.jsp')">&bull; View Question Text</a></li>
        </ul>
        </div>
        
        <div class="arrowlistmenu">
        <h3 class="menuheader expandable">Question Types</h3>
        <ul class="categoryitems">
        <li><a href="<c:url value='/qu_type/showQuestionTypesIndex.questiontypes?FormCalled=add_questiontype_form'/>"  id="add_questiontype" onclick="LoadPage('questiontypes_index.jsp')">&bull; Add Question Type</a></li>
        <li><a href="<c:url value='/qu_type/showQuestionTypesIndex.questiontypes?FormCalled=list_questiontypes_form'/>" id="view_questiontypes" onclick="LoadPage('questiontypes_index.jsp')">&bull; View Question Type</a></li>
        </ul>
        </div>
        
        <div class="arrowlistmenu">
        <h3 class="menuheader expandable">Answer Texts</h3>
        <ul class="categoryitems">
        <li><a href="<c:url value='/ans_txt/showAnswerTextsIndex.answertexts?FormCalled=add_answertext_form'/>"  id="add_answertext" onclick="LoadPage('answertexts_index.jsp')">&bull; Add Answer Text</a></li>
        <li><a href="<c:url value='/ans_txt/showAnswerTextsIndex.answertexts?FormCalled=list_answertexts_form'/>" id="view_answertexts" onclick="LoadPage('answertexts_index.jsp')">&bull; View Answer Texts</a></li>
        </ul>
        </div>
        
        <div class="arrowlistmenu">
        <h3 class="menuheader expandable">Default Answer Texts</h3>
        <ul class="categoryitems">
        <li><a href="<c:url value='/dans_txt/showDefaultAnswerTextsIndex.defaultanswertexts?FormCalled=add_defaultanswertext_form'/>"  id="add_defaultanswertext" onclick="LoadPage('defaultanswertexts_index.jsp')">&bull; Add Default Answer Text</a></li>
        <li><a href="<c:url value='/dans_txt/showDefaultAnswerTextsIndex.defaultanswertexts?FormCalled=list_defaultanswertexts_form'/>" id="view_defaultanswertexts" onclick="LoadPage('defaultanswertexts_index.jsp')">&bull; View Default Answer Texts</a></li>
        </ul>
        </div>
         -->
		<c:if test="${tl:rightsofView(resourceList,'Discrepency Texts')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Discrepancy Texts</h3>
				<ul class="categoryitems">
					<c:if
						test="${tl:rightsofView(resourceList,'Add Discrepency Text')==1}">
						<li><a
							href="<c:url value='/disc_txt/showDiscrepancyTextsIndex.discrepancytexts?FormCalled=add_discrepancytext_form'/>"
							id="add_discrepancytext"
							onclick="LoadPage('discrepancytexts_index.jsp')">&bull; Add
								Discrepancy Text</a></li>
					</c:if>
					<c:if
						test="${tl:rightsofView(resourceList,'View Discrepency Texts')==1}">
						<li><a
							href="<c:url value='/disc_txt/showDiscrepancyTextsIndex.discrepancytexts?FormCalled=list_discrepancytexts_form'/>"
							id="view_discrepancytexts"
							onclick="LoadPage('discrepancytexts_index.jsp')">&bull; View
								Discrepancy Text</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<c:if
			test="${tl:rightsofView(resourceList,'Recieved CRF Statuses')==1}">
			<div class="arrowlistmenu">
				<h3 class="menuheader expandable">Received CRF Statuses</h3>
				<ul class="categoryitems">
					<c:if
						test="${tl:rightsofView(resourceList,'Add Recieved CRF Statuses')==1}">
						<li><a
							href="<c:url value='/rcs/showReceivedCrfStatusesIndex.receivedcrfstatuses?FormCalled=add_rcs_form'/>"
							id="add_rcs" onclick="LoadPage('receivedrcsstatuses_index.jsp')">&bull;
								Add Received CRF Status</a></li>
					</c:if>
					<c:if
						test="${tl:rightsofView(resourceList,'View Recieved CRF Statuses')==1}">
						<li><a
							href="<c:url value='/rcs/showReceivedCrfStatusesIndex.receivedcrfstatuses?FormCalled=list_rcs_form'/>"
							id="view_rcs" onclick="LoadPage('receivedrcsstatuses_index.jsp')">&bull;
								View Received CRF Status</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<!--  
		<c:if test="${tl:rightsofView(resourceList,'Section Name Texts')==1}">
		<div class="arrowlistmenu">
        <h3 class="menuheader expandable">Section Name Texts</h3>
        <ul class="categoryitems">
        <c:if test="${tl:rightsofView(resourceList,'Add Section Name Text')==1}"><li><a href="<c:url value='/snt/showSectionNameTextsIndex.sectionnametexts?FormCalled=add_sectionnametext_form'/>"  id="add_sectionnametext" onclick="LoadPage('sectionnametexts_index.jsp')">&bull; Add Section Name Text</a></li></c:if>
        <c:if test="${tl:rightsofView(resourceList,'View Section Name Texts')==1}"><li><a href="<c:url value='/snt/showSectionNameTextsIndex.sectionnametexts?FormCalled=list_sectionnametexts_form'/>" id="view_sectionnametexts" onclick="LoadPage('sectionnametexts_index.jsp')">&bull; View Section Name Text</a></li></c:if>
        </ul>
        </div>
        
        </c:if>
        <c:if test="${tl:rightsofView(resourceList,'Validation Rules')==1}">
        <div class="arrowlistmenu">
        <h3 class="menuheader expandable">Validation Rules</h3>
        <ul class="categoryitems">
        <c:if test="${tl:rightsofView(resourceList,'Add Validation Rule')==1}"><li><a href="<c:url value='/vrules/showValidationRulesIndex.validationrules?FormCalled=add_vrule_form'/>"  id="add_vrule" onclick="LoadPage('validationrules_index.jsp')">&bull; Add Validation Rule</a></li></c:if>
        <c:if test="${tl:rightsofView(resourceList,'View Validation Rule')==1}"><li><a href="<c:url value='/vrules/showValidationRulesIndex.validationrules?FormCalled=list_vrules_form'/>" id="view_vrules" onclick="LoadPage('validationrules_index.jsp')">&bull; View Validation Rules</a></li></c:if>
        </ul>
        </div>
        </c:if>
        -->
	</div>
	<div class="nav_bottom"></div>

	<div class="nav_shade"></div>
</div>