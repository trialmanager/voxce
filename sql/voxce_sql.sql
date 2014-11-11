-- add version number to a document
ALTER TABLE study_documents ADD VER integer;

-- Create inventory table
create table inventory (inventory_id integer, subscriber_id integer, name text, part_no text, objectType text, mass integer, BatchNumber text, mass_unit text, 
					volume int, volume_unit text, concentration int, concentration_unit text, storage_temp int, 
					inv_condition text, status text, category text, origin text, cat_nbr text, lot_nbr text, serial_nbr text, 
					issuedate date, expirydate date, gooduntildate date, hazard text, long created_by int, date_created date, modified_by int, date_modified date)

-- Create Inventory Object Type
create table object_type (name text, code text)

-- Create Batch table
create table batch (name text, creation_date date, date_received date)

-- Create Milestone table
create table study_milestone (name text, type (study, site, subject, other) text, billable int, active int, status text, prct_complete int, agreed_date date, forecast_date date, complete_date date, note text)


-- All study/site combination
select ss.study_site_number, s.site_name, st.study_name  
  from sites s, study_sites ss, studies st 
 where st.study_id=ss.study_id and s.site_id=ss.site_id 
 
-- Study Payments
select ss.study_site_number, s.site_name, st.study_name, sp.study_payment_id, (select vn.visit_name from visits v, visit_name_texts vn where vn.visit_name_text_id=v.visit_name_text_id and v.visit_id = sp.visit_id) 'Visit Name', 
  from sites s, study_sites ss, studies st, study_payment sp 
 where st.study_id=ss.study_id and s.site_id=ss.site_id and ((sp.study_id=st.study_id) or (sp.site_id=s.site_id) or (sp.study_id=st.study_id and sp.site_id=s.site_id))
 
-- Patient Payments
select ss.study_site_number, s.site_name, st.study_name, pp.patient_payment_id, (select vn.visit_name from visits v, visit_name_texts vn where vn.visit_name_text_id=v.visit_name_text_id and v.visit_id = pp.visit_id) 'Visit Name', pp.cheque_date, pp.cheque_no, pp.created_by, pp.invoice, pp.over_head, pp.payment_amount, pp.payment_status, pp.pay_to, pp.pay_to_user_address, pp.pay_to_user_name, pp.po, pp.total_payment 
  from sites s, study_sites ss, studies st, patient_payment pp 
 where st.study_id=ss.study_id and s.site_id=ss.site_id and ((pp.study_id=st.study_id) or (pp.site_id=s.site_id) or (pp.study_id=st.study_id and pp.site_id=s.site_id))