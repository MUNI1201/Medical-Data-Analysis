use project_medical_data_history;
-- alter table admissions rename column attending_doctor_id to doctor_id;
select first_name,last_name,gender from patients where gender='M';
select first_name,last_name,allergies from patients  where allergies is null;
select first_name from patients where first_name like "C%";
select first_name,last_name,weight from patients where weight between 100 and 120;
update  patients set  allergies="NKA" where allergies is null; 
select concat(first_name," ",last_name) as full_name from patients;
select t1.first_name,t1.last_name,t2.province_name from patients t1 join province_names t2 on t1.province_id=t2.province_id;
select count(*) as Patients_born_on_2010 from patients where year(birth_date)='2010';
select first_name,last_name,height from patients where height in(select max(height) from patients);
select * from patients where patient_id in(1,45,534,879,1000);
select count(patient_id) as total_admissions from admissions;
select * from admissions where admission_date=discharge_date;
select patient_id,count(*) as Total_admissions from admissions group by patient_id having patient_id=579;
select distinct (city),province_id from patients  where province_id='NS';
select first_name,last_name,birth_date from patients where height>160 and weight>70;
select distinct year(birth_date) as Unique_Birth_Years from patients order by Unique_Birth_Years asc; 
select first_name from patients group by first_name having count(*)=1 ;
select patient_id,first_name from patients where first_name like "s____%s";
select t1.patient_id,t1.first_name,t1.last_name,t2.diagnosis from patients t1 join admissions t2 on t1.patient_id=t2.patient_id where t2.diagnosis='Dementia';
select first_name from patients order by length(first_name),first_name asc;
select sum(case when gender='M' then 1 else 0 end) as Male,sum(case when gender='F' then 1 else 0 end) as Female from patients;
select patient_id,diagnosis from admissions group by patient_id,diagnosis having count(*)>1;
select city,count(*) as patients_count from patients group by city order by count(*) desc,city;
select first_name,last_name,'patient' as role from patients union all select first_name,last_name,'Doctor' as role from doctors;
select allergies,count(*) as popularity from patients group by allergies having allergies is not null order by count(*) desc; 
select first_name,last_name,birth_date from patients where year(birth_date) between 1970 and 1979 order by birth_date asc;
select concat(upper(last_name),',',lower(first_name)) as full_name from patients order by first_name desc;
select province_id,sum(height) as total_height from patients group by province_id having sum(height)>=7000;
select max(weight)-min(weight) as weight_difference from patients where last_name='Maroni';
select month(admission_date) as month,day(admission_date) as day,count(*) as total_admissions from admissions group by month,day order by count(*) desc;
select
    case
        when weight between 1 and 9 then 1
        when weight between 10 and 19 then 10
        when weight between 20 and 29 then 20
        when weight between 30 and 39 then 30
        when weight between 40 and 49 then 40
        when weight between 50 and 59 then 50
        when weight between 60 and 69 then 60
        when weight between 70 and 79 then 70
        when weight between 80 and 89 then 80
        when weight between 90 and 99 then 90
        when weight between 100 and 109 then 100
        when weight between 110 and 119 then 110
        when weight between 120 and 129 then 120
        when weight between 130 and 139 then 130
        when weight between 140 and 149 then 140
        else 150
    end as weight_category,
    count(*) as total_patients
from patients
group by weight_category
order by weight_category desc;

select patient_id,weight,height, case when weight/((height/100)*(height/100))>=30 then 1 else 0 end as IsObese from patients;
select t1.patient_id,t1.first_name,t1.last_name,t2.diagnosis,t3.specialty from patients t1 join admissions t2 on t1.patient_id=t2.patient_id join doctors t3 on t2.attending_doctor_id=t3.doctor_id where t2.diagnosis='Epilepsy' and t3.first_name='Lisa';