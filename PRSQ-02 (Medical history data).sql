select first_name, last_name, gender from patients where gender = "M";

select first_name, last_name from patients where allergies is null;

select first_name from patients where first_name like "C%";

select first_name, last_name from patients where weight between 100 and 120;

update patients set allergies = "NKA" where allergies is null;

select concat(first_name," ",last_name) as full_name from patients;

select pa.first_name, pa.last_name, pro.province_name from patients pa 
join province_names pro on pa.province_id = pro.province_id;

select count(*) as patient_count_2010 from patients where year(birth_date) = 2010;

select first_name,last_name,height from patients order by height desc limit 1;

select * from patients where patient_id in (1,45,534,879,1000);

select count(*) as total_admissions from admissions;

select * from admissions where admission_date = discharge_date;

select count(*) as total_admissions from admissions where patient_id = 579;

select distinct city from patients where province_id = "NS";

select first_name, last_name, birth_date from patients where height > 160 and weight > 70;

select distinct year(birth_date) from patients order by year(birth_date) asc;

select distinct first_name from patients group by first_name having count(first_name) = 1;

select patient_id, first_name from patients where first_name 
like "s%" and first_name like "%s" and length(first_name) >= 6;

select p.patient_id, p.first_name, p.last_name from patients p 
join admissions ad on p.patient_id = ad.patient_id where ad.diagnosis = "Dementia";

select first_name from patients order by length(first_name), first_name;

select (select count(*) from patients where gender = "M") as total_amount_of_male_patients, 
(select count(*) from patients where gender = "F") as total_amount_of_female_patients;

select patient_id, diagnosis from admissions group by patient_id, diagnosis having count(*) > 1;

select city, count(*) as total_patients from patients group by city order by total_patients desc, city asc;

select distinct first_name, last_name, "patient" as role from patients 
union select distinct first_name, last_name, "Doctor" as role from doctors;

select allergies, count(*) as popularity from patients where allergies is not null 
group by allergies order by popularity desc;

select first_name, last_name, birth_date from patients where year(birth_date) 
between "1970-01-01" and "1979-12-31" order by birth_date asc;

select concat(upper(last_name), ",", lower(first_name)) as patients_full_name from patients 
order by first_name desc;

select province_id, sum(height) as total_height from patients group by 
province_id having sum(height) >= 7000;

select max(weight) - min(weight) as weight_difference from patients where last_name = "Maroni";

select day(admission_date) as day_of_month, count(*) as admission_count from admissions 
group by day(admission_date) order by admission_count desc;

select floor(weight / 10) * 10 as weight_group, count(*) as total_patients
from patients group by weight_group order by weight_group desc;
 
select patient_id, weight, height, weight/pow(height/100,2) as Obese, 
case when weight/pow(height/100,2) >= 30 then 1 else 0 end as isObese from patients;

select p.patient_id,p.first_name,p.last_name,d.specialty from patients p join admissions ad on 
p.patient_id = ad.patient_id join doctors d on ad.attending_doctor_id = d.doctor_id 
where ad.diagnosis = "Epilepsy" and d.first_name = "Lisa";

select p.patient_id, concat(p.patient_id,length(p.last_name),year(p.birth_date)) 
as temp_password from patients p join admissions ad on p.patient_id = ad.patient_id;







