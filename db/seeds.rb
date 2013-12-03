# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

#=========================================================
#Table: Organizationtypes
Organizationtype.create(:name=>'Municipal Council', :description=>'Municipal Counsil' , :created_by=>1, :modified_by=>1)
#==================================================
#Table: Organizations
Organization.create(:long_name=>'MUNICIPAL COUNCIL MALANJKHAND', :short_name=>'MCM', :organizationtype_id=>1, :address=>'Malanjkhand', :city=>'MALANJKHAND',
:tehsil=>'BAIHAR', :district=>'BALAGHAT', :state=>'MADHYA PRADESH', :country=>'INDIA',
:pin=>'481118', :phone_number1=>'123456', :phone_number2=>'7606734',:phone_number3=>'7607144',
:fax_number1=>'8796565',:fax_number2=>'8796565', :toll_free1=>'8787879', :toll_free2=>'878257',
:service_line=>'878765653', :email=>'info@sark.com', :web=>'http://sarksystems.in',:about=>'Municipal Counsil in Balagaht Distrtict. It has population of 120000.',
:info=>'Municipal Counsil of Malanjkhand', :coordinates=>'10N 20S ', :created_by=>123, :modified_by=>123)
#===========================================================
#Table: zones
Zone.create(:name=>'North zone', :description=>'North Zone', :created_by=>1, :modified_by=>1)
Zone.create(:name=>'South zone', :description=>'South Zone', :created_by=>1, :modified_by=>1)
Zone.create(:name=>'East zone', :description=>'East Zone', :created_by=>1, :modified_by=>1)
Zone.create(:name=>'West zone', :description=>'West Zone', :created_by=>1, :modified_by=>1)
#==============================================================
#Wards
Ward.create(:name=>'Dr.Jakir Hussen Ward',:zone_id=>1, :description=>'North Zone', :created_by=>1, :modified_by=>1)
Ward.create(:name=>'Rajeev Gandhi Ward',:zone_id=>1, :description=>'South Zone', :created_by=>1, :modified_by=>1)
Ward.create(:name=>'Dr. Sardar Vallabhai Patel Ward', :zone_id=>1, :description=>'East Zone', :created_by=>1, :zone_id=>1,:modified_by=>1)
#=============================================================================================
#streets
Street.create(:name=>'Main street Street', :ward_id=>3,:description=>'Has100people', :created_by=>1, :modified_by=>1)
Street.create(:name=>'Local Street', :ward_id=>2,:description=>'Has150people', :created_by=>1, :modified_by=>1)
Street.create(:name=>'Main Market', :ward_id=>1,:description=>'Has200people', :created_by=>1, :modified_by=>1)
#================================================================================
#religions
Religion.create(:name=>'Hindu',:description=>'People Of Hindu', :created_by=>1, :modified_by=>1)
Religion.create(:name=>'Muslim',:description=>'People Of Muslim', :created_by=>1, :modified_by=>1)
Religion.create(:name=>'Christian',:description=>'People Of Christian', :created_by=>1, :modified_by=>1)
Religion.create(:name=>'Buddha',:description=>'People Of Bouddha', :created_by=>1, :modified_by=>1)
Religion.create(:name=>'Jain',:description=>'People Of Bouddha', :created_by=>1, :modified_by=>1)
#===========================================================================
#castes
Caste.create(:name=>'UR',:religion_id=>1 ,:description=>'Open Category', :created_by=>1, :modified_by=>1)
Caste.create(:name=>'OBC',:religion_id=>2 ,:description=>'Backward Category-A', :created_by=>1, :modified_by=>1)
Caste.create(:name=>'SC',:religion_id=>2 ,:description=>'Scheduled Category', :created_by=>1, :modified_by=>1)
Caste.create(:name=>'ST',:religion_id=>3 ,:description=>'Scheduled Type', :created_by=>1, :modified_by=>1)
#===========================================================================
#genders
Gender.create(:name=>'Male', :description=>'Male Properties', :created_by=>1, :modified_by=>1)
Gender.create(:name=>'Female', :description=>'Female Properties', :created_by=>1, :modified_by=>1)
#=========================================================================================
#maritals
Marital.create(:status=>'Married',:description=>'Got Married',:created_by=>1,:modified_by=>1)
Marital.create(:status=>'Single',:description=>'Not Yet Married',:created_by=>1,:modified_by=>1)
Marital.create(:status=>'Widowed',:description=>'Husband Died ',:created_by=>1,:modified_by=>1)
Marital.create(:status=>'Divorced',:description=>'Divorced From Spouse',:created_by=>1,:modified_by=>1)
#================================================================================================
#departments
Department.create(:name=>'Administration',:short_code=>'ADMIN', :description=>'People Do The Administration Work' , :created_by=>1, :modified_by=>1)
Department.create(:name=>'Clerical',:short_code=>'ad', :description=>'People Do The clerical Work' , :created_by=>1, :modified_by=>1)
#===============================================================
#designations
Designation.create(:name=>'Scale -II',:description=>'Analytical Work' , :created_by=>1, :modified_by=>1)
Designation.create(:name=>'Grade -I',:description=>'Writes The Code' , :created_by=>1, :modified_by=>1)
Designation.create(:name=>'Grade -II',:description=>'Manage The Company' , :created_by=>1, :modified_by=>1)
Designation.create(:name=>'Grade -III',:description=>'Manage Project ' , :created_by=>1, :modified_by=>1)
Designation.create(:name=>'Grade - IV',:description=>'Manage Project ' , :created_by=>1, :modified_by=>1)
#================================================================================
#sturucturefactors
Structurefactor.create(:name=>'Pucca',:factor=>1,:description=>'Pucca Property',:created_by=>1,:modified_by=>1)
Structurefactor.create(:name=>'Semi Pucca',:factor=>0.7,:description=>'Semi Pucca Property',:created_by=>1,:modified_by=>1)
Structurefactor.create(:name=>'Kutcha',:factor=>0.5,:description=>'Semi Pucca Property',:created_by=>1,:modified_by=>1)
#======================================================================================================
#occupancyfactors
Occupancyfactor.create(:name=>'Residential-Self Occupied',:factor=>1,:description=>'Only For Residential-Self Occupied',:created_by=>1,:modified_by=>1)
Occupancyfactor.create(:name=>'Residential-Rented',:factor=>2,:description=>'Only For Residential- Rented',:created_by=>1,:modified_by=>1)
Occupancyfactor.create(:name=>'Non-Residential Self Occupied',:factor=>1,:description=>'Only For Non-Residential Self Occupied',:created_by=>1,:modified_by=>1)
Occupancyfactor.create(:name=>'Non-Residential  Rented',:factor=>2,:description=>'Only For Non-Residential  Rented',:created_by=>1,:modified_by=>1)
Occupancyfactor.create(:name=>'Form House Residential Self Occupied  ',:factor=>1,:description=>'Only For Form House Residential Self Occupied   ',:created_by=>1,:modified_by=>1)       
Occupancyfactor.create(:name=>'Form House Residential Tenanted  ',:factor=>1,:description=>'Only For Form House Residential Tenanted  ',:created_by=>1,:modified_by=>1)       
Occupancyfactor.create(:name=>'Govt. Residential Self Occupied ',:factor=>1,:description=>'Only For Govt. Residential Self Occupied ',:created_by=>1,:modified_by=>1)       
#====================================================================================================
#propertytypes
Propertytype.create(:name=>'Residential ',:description=>'Residential type',:created_by=>1,:modified_by=>1)
Propertytype.create(:name=>'Industrial ',:description=>'Industrial type',:created_by=>1,:modified_by=>1)       
#===================================================================================================
#taxcategories
Taxcategory.create(:category=>'A',:description=>'A category',:created_by=>1,:modified_by=>1)
Taxcategory.create(:category=>'B',:description=>'B category',:created_by=>1,:modified_by=>1)
Taxcategory.create(:category=>'C',:description=>'C category',:created_by=>1,:modified_by=>1)
Taxcategory.create(:category=>'D',:description=>'D category',:created_by=>1,:modified_by=>1)
Taxcategory.create(:category=>'E',:description=>'E category',:created_by=>1,:modified_by=>1)
Taxcategory.create(:category=>'F',:description=>'F category',:created_by=>1,:modified_by=>1)
Taxcategory.create(:category=>'G',:description=>'G category',:created_by=>1,:modified_by=>1)
Taxcategory.create(:category=>'H',:description=>'H category',:created_by=>1,:modified_by=>1)
#================================================================================================
#unitvalues
Unitvalue.create(:taxcategory_id=>1,:amount=>650.00,:description=>'A Unit Area Value',
  :created_by=>1,:modified_by=>1)
Unitvalue.create(:taxcategory_id=>2,:amount=>550.00,:description=>'B Unit Area Value',
  :created_by=>1,:modified_by=>1)
Unitvalue.create(:taxcategory_id=>3,:amount=>450.00,:description=>'C Unit Area Value',
  :created_by=>1,:modified_by=>1)
Unitvalue.create(:taxcategory_id=>4,:amount=>350.00,:description=>'D Unit Area Value',
  :created_by=>1,:modified_by=>1)
Unitvalue.create(:taxcategory_id=>5,:amount=>250.00,:description=>'E Unit Area Value',
  :created_by=>1,:modified_by=>1)
Unitvalue.create(:taxcategory_id=>6,:amount=>150.00,:description=>'F Unit Area Value',
  :created_by=>1,:modified_by=>1)
Unitvalue.create(:taxcategory_id=>7,:amount=>1250.00,:description=>'G Unit Area Value',
  :created_by=>1,:modified_by=>1)
Unitvalue.create(:taxcategory_id=>8,:amount=>100.00,:description=>'H Unit Area Value',
  :created_by=>1,:modified_by=>1)
#==================================================================================================
#hospitals
Hospital.create(:name=>'Birsa Hospital',:address=>'2-1-252/1',:city=>'MALANJKHAND',:tehsil=>'BAIHAR',:district=>'BALAGHAT',:phone1=>'040-2454545',
:phone2=>'020-3434345',:doctor=>'Dr.Rajesh',:education=>'MD',:created_by=>1,:modified_by=>1)
Hospital.create(:name=>'Malanjkhand Hospital',:address=>'2-2-252/3',:city=>'MALANJKHAND',:tehsil=>'BAIHAR',:district=>'BALAGHAT',:phone1=>'040-2454345',
:phone2=>'020-3434115',:doctor=>'Dr.Suresh',:education=>'MS',:created_by=>1,:modified_by=>1)
Hospital.create(:name=>'Mohgon
Hospital',:address=>'2-2-252/3',:city=>'MALANJKHAND',:tehsil=>'BAIHAR',:district=>'BALAGHAT',:phone1=>'040-2451245',
:phone2=>'020-3434115',:doctor=>'Dr.Shankar',:education=>'MBBS',:created_by=>1,:modified_by=>1)
Hospital.create(:name=>'Other Hospital',:address=>'2-2-202/3',:city=>'MALANJKHAND',:tehsil=>'BAIHAR',:district=>'BALAGHAT',:phone1=>'040-2451245',
:phone2=>'020-3434115',:doctor=>'Dr.Narayana',:education=>'MBBS FRCS',:created_by=>1,:modified_by=>1)
#==================================================================================================
#deliverymethods
Deliverymethod.create(:name=>'Normal',:description=>'Normal Delivery',:created_by=>1,:modified_by=>1)
Deliverymethod.create(:name=>'Sigerian',:description=>'Sigerian Delivery',:created_by=>1,:modified_by=>1)
Deliverymethod.create(:name=>'Pharo Scope',:description=>'Sigerian Delivery',:created_by=>1,:modified_by=>1)
#==================================================================================
#births
Birth.create(:birth_date=>'2010-8-1',:first_name=>'Ala',:middle_name=>'Ravi',:last_name=>'Teja',:father_name=>'Prahladhudu',
:mother_name=>'Ramana',:gender_id=>1,:address=>'2-1-252/1',:birth_place=>'Hyderabad',:hospital_id=>2,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Raman',:religion_id=>3,:caste_id=>3,:mother_native=>'Dhone',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20001,:register_date=>'2010-8-02',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>1234,:approved_by=>1,:approved_on=>'2010-8-10',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-8-2',:first_name=>'Goreddy',:middle_name=>'Vijay',:last_name=>'Kumar',:father_name=>'Thiru Reddy',:mother_name=>'Savithri',:gender_id=>1,:address=>'2-1-202/1',:birth_place=>'Hyderabad',:hospital_id=>1,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramanji',:religion_id=>3,:caste_id=>3,:mother_native=>'Dhone',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Lecturer',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20002,:register_date=>'2010-8-03',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>2234,:approved_by=>1,:approved_on=>'2010-8-11',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-8-8',:first_name=>'Akula',:middle_name=>'Subba',:last_name=>'Rao',:father_name=>'Surendhar',
:mother_name=>'Shashikala',:gender_id=>1,:address=>'2-1-282/1',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramanji',:religion_id=>3,:caste_id=>3,:mother_native=>'Dhone',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Service',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20003,:register_date=>'2010-8-04',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>1834,:approved_by=>1,:approved_on=>'2010-8-14',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-8-4',:first_name=>'Panuganti',:middle_name=>'Anil',:last_name=>'Shastri',:father_name=>'Venkateswarlu',
:mother_name=>'Suchitra',:gender_id=>1,:address=>'2-1-1012/1',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramanji',:religion_id=>3,:caste_id=>3,:mother_native=>'Dhone',:father_education=>'Graduation',:mother_education=>
'Post Graduation',:father_occupation=> 'S/W  Engineer',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20004,:register_date=>'2010-8-05',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>2589,:approved_by=>1,:approved_on=>'2010-8-15',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-8-1',:first_name=>'Kanaparti',:middle_name=>'Lavanya',:last_name=>'Kumari',:father_name=>'Surendhar',
:mother_name=>'Saroja',:gender_id=>2,:address=>'2-1-252/2',:birth_place=>'Hyderabad',:hospital_id=>2,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramanji',:religion_id=>1,:caste_id=>3,:mother_native=>'Dhone',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20014,:register_date=>'2010-8-02',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6547,:approved_by=>1,:approved_on=>'2010-8-10',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-8-8',:first_name=>'Ragala',:middle_name=>'Suchitra',:last_name=>'Kumari',:father_name=>'Satish',
:mother_name=>'Saroja',:gender_id=>2,:address=>'2-1-250/2',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:caste_id=>3,:mother_native=>'Hyderabad',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20005,:register_date=>'2010-8-12',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6547,:approved_by=>1,:approved_on=>'2010-8-10',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-7-8',:first_name=>'Bandla',:middle_name=>'Sarita',:last_name=>'Reddy',:father_name=>'Siddhartha',
:mother_name=>'Saroja',:gender_id=>2,:address=>'2-1-150/2',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:caste_id=>3,:mother_native=>'Hyderabad',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20006,:register_date=>'2010-8-12',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6500,:approved_by=>1,:approved_on=>'2010-8-10',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-7-7',:first_name=>'Sandu',:middle_name=>'Sudhakar',:last_name=>'Rao',:father_name=>'Seshaiah',
:mother_name=>'Saroja',:gender_id=>1,:address=>'2-2-250/2',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>4,:caste_id=>3,:mother_native=>'Hyderabad',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20015,:register_date=>'2010-7-12',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6547,:approved_by=>1,:approved_on=>'2010-8-10',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-7-8',:first_name=>'Bandla',:middle_name=>'Balaram',:last_name=>'Kumar',:father_name=>'Vijay',
:mother_name=>'Savithri',:gender_id=>1,:address=>'2-1-250/9',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:caste_id=>3,:mother_native=>'Hyderabad',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>1,:total_time=>44,:helper=>'Nurse',:register_id=>20007,:register_date=>'2010-7-12',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6547,:approved_by=>1,:approved_on=>'2010-8-10',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-7-18',:first_name=>'Perala',:middle_name=>'Rajaram',:last_name=>'Rao',:father_name=>'Sridhar',
:mother_name=>'Laxmi',:gender_id=>1,:address=>'2-1-250/9',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:caste_id=>3,:mother_native=>'Hyderabad',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20008,:register_date=>'2010-7-12',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6500,:approved_by=>1,:approved_on=>'2010-8-10',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-7-19',:first_name=>'Perala',:middle_name=>'Satish',:last_name=>'Rao',:father_name=>'Sridhar',
:mother_name=>'Laxmi',:gender_id=>1,:address=>'2-1-250/9',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:caste_id=>3,:mother_native=>'Hyderabad',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20009,:register_date=>'2010-7-20',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6500,:approved_by=>1,:approved_on=>'2010-8-21',:created_by=>1,:modified_by=>1,:approved=>1)
Birth.create(:birth_date=>'2010-7-19',:first_name=>'Sangala',:middle_name=>'Rajaram',:last_name=>'Reddy',:father_name=>'Sridhar',
:mother_name=>'Laxmi',:gender_id=>1,:address=>'2-1-250/9',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:caste_id=>3,:mother_native=>'Hyderabad',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20010,:register_date=>'2010-7-20',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6500,:approved_by=>1,:approved_on=>'2010-8-21',:created_by=>1,:modified_by=>1,:approved=>0)
Birth.create(:birth_date=>'2010-7-20',:first_name=>'Sangala',:middle_name=>'Supraja',:last_name=>'Reddy',:father_name=>'Sridhar',
:mother_name=>'Laxmi',:gender_id=>2,:address=>'2-1-250/9',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:caste_id=>3,:mother_native=>'Hyderabad',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>2,:total_time=>44,:helper=>'Nurse',:register_id=>20011,:register_date=>'2010-7-21',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6500,:approved_by=>1,:approved_on=>'2010-8-22',:created_by=>1,:modified_by=>1,:approved=>0)
Birth.create(:birth_date=>'2010-7-21',:first_name=>'Sangala',:middle_name=>'vijay',:last_name=>'Reddy',:father_name=>'Sridhar',
:mother_name=>'Laxmi',:gender_id=>1,:address=>'2-1-250/9',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:caste_id=>3,:mother_native=>'Hyderabad',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>1,:total_time=>44,:helper=>'Nurse',:register_id=>20012,:register_date=>'2010-7-22',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6500,:approved_by=>1,:approved_on=>'2010-8-23',:created_by=>1,:modified_by=>1,:approved=>0)
Birth.create(:birth_date=>'2010-7-22',:first_name=>'Sangala',:middle_name=>'Anil',:last_name=>'Kumar',:father_name=>'Sridhar',
:mother_name=>'Laxmi',:gender_id=>1,:address=>'2-1-250/9',:birth_place=>'Hyderabad',:hospital_id=>3,:city=>'Hyderabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:caste_id=>3,:mother_native=>'Hyderabad',:father_education=>'Graduation',:mother_education=>
'PostGraduation',:father_occupation=>'Business',:mother_occupation=>'HouseWife',:mother_age_marriage=>22,:mother_age_delivery=>26,
:weight=>10.3,:total_children=>3,:deliverymethod_id=>1,:total_time=>44,:helper=>'Nurse',:register_id=>20013,:register_date=>'2010-7-23',
:remarks=>'Successful',:unit=>'hyderabad',:amount=>5,:employee_id=>6500,:approved_by=>1,:approved_on=>'2010-8-24',:created_by=>1,:modified_by=>1,:approved=>0)
#================================================================================================================================================
#deaths
Death.create(:death_date=>'2010-8-11',:first_name=>'Panuganti',:middle_name=>'Aravind',:last_name=>'Swamy',:father_name=>'Simhachalam',
:gender_id=>1,:age=>68,:address=>'5-2-246/1',:death_place=>'Hyderabad',:hospital_id=>3,:city=>'Hydearabad',:tehsil=>'Hyderabad',
:district=>'Hyderaad',:applicant=>'Ramana',:religion_id=>4,:death_before_treatment=>'Yes',:death_with_illness=>'Yes',
:desease_name=>'Maleria',:death_delivery=>'No',:death_cause_smoke=>'Yes',:death_smoke_age=>2,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30001,:register_date=>'2010-9-11',
:remarks=>'SoSad',:amount=>5,:employee_id=>325,:approved_by=>1,:approved_on=>'2010-9-13',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-21',:first_name=>'Akula',:middle_name=>'Shashikala',:last_name=>'Reddy',:father_name=>'Simhachalam',
:gender_id=>2,:age=>68,:address=>'5-2-236/1',:death_place=>'Hyderabad',:hospital_id=>2,:city=>'Hydearabad',:tehsil=>'Hyderabad',
:district=>'Hyderaad',:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'Yes',
:desease_name=>'Maleria',:death_delivery=>'No',:death_cause_smoke=>'No',:death_smoke_age=>0,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30002,:register_date=>'2010-9-21',
:remarks=>'SoBad',:amount=>5,:employee_id=>325,:approved_by=>1,:approved_on=>'2010-9-13',:created_by=>1,:modified_by=>1,
:approved=>1)
Death.create(:death_date=>'2010-8-20',:first_name=>'Kanaparti',:middle_name=>'Sridhar',:last_name=>'Setty',:father_name=>'Rajeswar',
:gender_id=>1,:age=>62,:address=>'5-2-206/1',:death_place=>'Hyderabad',:hospital_id=>3,:city=>'Hydearabad',:tehsil=>'Hyderabad',
:district=>'Hyderaad',:applicant=>'Ramana',:religion_id=>4,:death_before_treatment=>'No',:death_with_illness=>'Yes',
:desease_name=>'HIV',:death_delivery=>'No',:death_cause_smoke=>'Yes',:death_smoke_age=>5,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30003,:register_date=>'2010-9-20',
:remarks=>'SoBad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-9-23',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-22',:first_name=>'Gattu',:middle_name=>'Rajesh',:last_name=>'Sasthri',:father_name=>'Rajeswaraiah',
:gender_id=>1,:age=>62,:address=>'5-2-206/1',:death_place=>'Hyderabad',:hospital_id=>1,:city=>'Hydearabad',:tehsil=>'Hyderabad',
:district=>'Hyderaad',:applicant=>'Ramana',:religion_id=>2,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'Yes',:death_smoke_age=>5,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30004,:register_date=>'2010-9-22',
:remarks=>'SoBad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-9-23',:created_by=>1,:modified_by=>1,
:approved=>1)
Death.create(:death_date=>'2010-8-1',:first_name=>'Bandla',:middle_name=>'Balaram',:last_name=>'Setty',:father_name=>'Sitaram',
:gender_id=>1,:age=>62,:address=>'5-2-226/1',:death_place=>'Hyderabad',:hospital_id=>3,:city=>'Hydearabad',:tehsil=>'Hyderabad',
:district=>'Hyderaad',:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'Yes',
:desease_name=>'HIV',:death_delivery=>'No',:death_cause_smoke=>'Yes',:death_smoke_age=>5,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30005,:register_date=>'2010-8-2',
:remarks=>'SoBad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-3',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-2',:first_name=>'Ala',:middle_name=>'Chennamma',:last_name=>'Sasthri',:father_name=>'Sitaram',
:gender_id=>2,:age=>62,:address=>'5-2-226/5',:death_place=>'Hyderabad',:hospital_id=>3,:city=>'Hydearabad',:tehsil=>'Hyderabad',
:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'No',:death_smoke_age=>0,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30006,:register_date=>'2010-8-3',
:remarks=>'SoSad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-4',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-3',:first_name=>'Sandu',:middle_name=>'Suvarchala',:last_name=>'Kumari',:father_name=>'Chennareddy',
:gender_id=>2,:age=>62,:address=>'5-2-126/5',:death_place=>'Hyderabad',:hospital_id=>1,:city=>'Hydearabad',:tehsil=>'Hyderabad',:district=>'Hyderabad',
:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'No',:death_smoke_age=>0,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30007,:register_date=>'2010-8-4',
:remarks=>'SoSad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-5',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-4',:first_name=>'Gitala',:middle_name=>'Sundhar',:last_name=>'Reddy',:father_name=>'Ravikanth',
:gender_id=>1,:age=>62,:address=>'5-2-126/5',:death_place=>'Hyderabad',:hospital_id=>1,:city=>'Hydearabad',:tehsil=>'Hyderabad',:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'No',:death_smoke_age=>0,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30008,:register_date=>'2010-8-5',
:remarks=>'SoSad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-6',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-5',:first_name=>'Bandaru',:middle_name=>'Katika',:last_name=>'Reddy',:father_name=>'Chennareddy',
:gender_id=>2,:age=>62,:address=>'5-2-122/5',:death_place=>'Hyderabad',:hospital_id=>2,:city=>'Hydearabad',:tehsil=>'Hyderabad',:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>2,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'No',:death_smoke_age=>0,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30009,:register_date=>'2010-8-6',
:remarks=>'SoSad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-7',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-6',:first_name=>'Bethala',:middle_name=>'Ravi',:last_name=>'Kumar',:father_name=>'Chennareddy',
:gender_id=>1,:age=>62,:address=>'5-2-126/5',:death_place=>'Hyderabad',:hospital_id=>2,:city=>'Hydearabad',:tehsil=>'Hyderabad',:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'Yes',:death_smoke_age=>2,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30010,:register_date=>'2010-8-7',
:remarks=>'SoSad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-8',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-7',:first_name=>'Bethala',:middle_name=>'Suvarna',:last_name=>'Kumari',:father_name=>'Laxmareddy',
:gender_id=>2,:age=>62,:address=>'5-2-126/5',:death_place=>'Hyderabad',:hospital_id=>2,:city=>'Hydearabad',:tehsil=>'Hyderabad',:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'Yes',:death_smoke_age=>2,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30011,:register_date=>'2010-8-8',
:remarks=>'SoSad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-9',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-8',:first_name=>'Arla',:middle_name=>'Shashirekha',:last_name=>'Choudari',:father_name=>'Laxmareddy',
:gender_id=>2,:age=>62,:address=>'5-2-126/5',:death_place=>'Hyderabad',:hospital_id=>2,:city=>'Hydearabad',:tehsil=>'Hyderabad',:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'Yes',:death_smoke_age=>2,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30012,:register_date=>'2010-8-9',
:remarks=>'SoSad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-10',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-9',:first_name=>'Sandu',:middle_name=>'Sudharshan',:last_name=>'Shetty',:father_name=>'Rajesh',
:gender_id=>1,:age=>62,:address=>'5-2-126/5',:death_place=>'Hyderabad',:hospital_id=>3,:city=>'Hydearabad',:tehsil=>'Hyderabad',:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'Yes',:death_smoke_age=>2,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30013,:register_date=>'2010-8-10',
:remarks=>'SoSad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-11',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-10',:first_name=>'Charu',:middle_name=>'Sumalata',:last_name=>'Rao',:father_name=>'Suresh',
:gender_id=>2,:age=>62,:address=>'5-2-126/5',:death_place=>'Hyderabad',:hospital_id=>3,:city=>'Hydearabad',:tehsil=>'Hyderabad',:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'No',:death_smoke_age=>0,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30014,:register_date=>'2010-8-11',
:remarks=>'SoSad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-12',:created_by=>1,:modified_by=>1,
:approved=>0)
Death.create(:death_date=>'2010-8-11',:first_name=>'Charu',:middle_name=>'vijay',:last_name=>'Rao',:father_name=>'Suresh',
:gender_id=>1,:age=>62,:address=>'5-2-126/5',:death_place=>'Hyderabad',:hospital_id=>3,:city=>'Hydearabad',:tehsil=>'Hyderabad',:district=>'Hyderabad',:applicant=>'Ramana',:religion_id=>3,:death_before_treatment=>'No',:death_with_illness=>'No',
:desease_name=>'No',:death_delivery=>'No',:death_cause_smoke=>'No',:death_smoke_age=>0,:death_cause_supari=>'No',
:death_supari_age=>0,:death_cause_drink=>'No',:death_drink_age=>0,:register_id=>30015,:register_date=>'2010-8-11',
:remarks=>'SoSad',:amount=>5,:employee_id=>425,:approved_by=>1,:approved_on=>'2010-8-12',:created_by=>1,:modified_by=>1,
:approved=>0)
#==========================================================================================================
#connectiontypes
Connectiontype.create(:name=>'Residential',:description=>'Residential Connection',:amount=>500,:created_by=>1,:modified_by=>1)
Connectiontype.create(:name=>'Business',:description=>'Hotel Connection',:amount=>600,:created_by=>1,:modified_by=>1)
#==============================================================================================
#employees
Employee.create(:employment_id=>10001,:name=>'Kiran',:gender_id=>1,:father_name=>'shashikanth',
:dob=>'1978-5-03',:date_join=>'2000-09-03',:religion_id=>3,:marital_id=>1,:education=>'Post Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-252/1',:phone=>'040-2020201',:mobile=>'9948815263',
:email=>'kiran@sark.com',:photo=>'1.jpg',:pan=>'A12P0031',:pf_number=>'85285210',
:bank_account_number=>'62016344273',:bank_id=>1,:employeetype_id=>1,:designation_id=>3,
:department_id=>1,:UID=>'Kiran',:caste_id=>3,
:created_by=>1,:modified_by=>1,:employeecategory_id => 1)
Employee.create(:employment_id=>10002,:name=>'Varma',:gender_id=>1,:father_name=>'shashikanth',
:dob=>'1978-5-09',:date_join=>'2002-09-03',:religion_id=>3,:marital_id=>2,:education=>'Post Graduation',:blood_group=>'O+ve',:nationality=>'India',:address=>'2-1-252/2',:phone=>'040-2020201',:mobile=>'9948815263',
:email=>'varma@sark.com',:photo=>'2.jpg',:pan=>'A12P0051',:pf_number=>'85284210',
:bank_account_number=>'62016344273',:bank_id=>1,:employeetype_id=>2,:designation_id=>3,
:department_id=>1,:UID=>'Varma',:caste_id=>3,
:created_by=>1,:modified_by=>1,:employeecategory_id => 1)
Employee.create(:employment_id=>10003,:name=>'Sharma',:gender_id=>1,:father_name=>'Mahesh',
:dob=>'1969-5-09',:date_join=>'1992-09-03',:religion_id=>3,:marital_id=>1,:education=>'Post Graduation',:blood_group=>'A+ve',:nationality=>'India',:address=>'2-1-152/2',:phone=>'040-2020211',:mobile=>'9948819263',
:email=>'sharma@sark.com',:photo=>'3.jpg',:pan=>'A12P0051',:pf_number=>'85284210',
:bank_account_number=>'62016344273',:bank_id=>1,:employeetype_id=>1,:designation_id=>3,
:department_id=>1,:UID=>'Sharma',:caste_id=>3,
:created_by=>1,:modified_by=>1,:employeecategory_id => 2)    
Employee.create(:employment_id=>10004,:name=>'Raju',:gender_id=>1,:father_name=>'Sundhar',
:dob=>'1980-5-09',:date_join=>'2002-09-03',:religion_id=>3,:marital_id=>1,:education=>' Graduation',:blood_group=>'A+ve',:nationality=>'India',:address=>'2-1-152/2',:phone=>'040-2020211',:mobile=>'9948810263',
:email=>'raju@sark.com',:photo=>'4.jpg',:pan=>'A12P0011',:pf_number=>'85284010',
:bank_account_number=>'62016344273',:bank_id=>1,:employeetype_id=>2,:designation_id=>3,
:department_id=>1,:UID=>'Raju',:caste_id=>3,
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)   
Employee.create(:employment_id=>10005,:name=>'Sekhar',:gender_id=>1,:father_name=>'Sundhar',
:dob=>'1988-5-09',:date_join=>'2003-09-03',:religion_id=>2,:caste_id=>1,:marital_id=>2,:education=>' Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-152/2',:phone=>'040-2020211',:mobile=>'9948810263',
:email=>'sekhar@sark.com',:photo=>'5.jpg',:pan=>'A12P0021',:pf_number=>'85284010',
:bank_account_number=>'62036344273',:bank_id=>1,:employeetype_id=>1,:designation_id=>2,
:department_id=>1,:UID=>'Sekhar',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)      
Employee.create(:employment_id=>10006,:name=>'Navaratan',:gender_id=>1,:father_name=>'Sekhar',
:dob=>'1987-5-09',:date_join=>'2005-09-03',:religion_id=>3,:caste_id=>1,:marital_id=>1,:education=>' Graduation',:blood_group=>'A+ve',:nationality=>'India',:address=>'2-1-152/2',:phone=>'040-2020211',:mobile=>'9948810263',
:email=>'navaratan@sark.com',:photo=>'6.jpg',:pan=>'A12P0022',:pf_number=>'85284010',
:bank_account_number=>'62016004273',:bank_id=>1,:employeetype_id=>1,:designation_id=>3,
:department_id=>1,:UID=>'Navaratan',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)  
Employee.create(:employment_id=>10007,:name=>'Srinivas',:gender_id=>1,:father_name=>'Prahlath',
:dob=>'1989-5-09',:date_join=>'2009-09-03',:religion_id=>2,:caste_id=>2,:marital_id=>2,:education=>' Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-252/2',:phone=>'040-2012211',:mobile=>'9948889263',
:email=>'srinivas@sark.com',:photo=>'7.jpg',:pan=>'A12P0022',:pf_number=>'85284010',
:bank_account_number=>'62016004273',:bank_id=>1,:employeetype_id=>1,:designation_id=>3,
:department_id=>1,:UID=>'Srinivas',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3) 
Employee.create(:employment_id=>10008,:name=>'Sandhya',:gender_id=>2,:father_name=>'Sharath',
:dob=>'1984-5-09',:date_join=>'2006-09-03',:religion_id=>2,:caste_id=>2,:marital_id=>2,:education=>' Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-252/2',:phone=>'040-2012211',:mobile=>'9952889263',
:email=>'sandhaya@sark.com',:photo=>'8.jpg',:pan=>'A12P0822',:pf_number=>'85280010',
:bank_account_number=>'62016004273',:bank_id=>1,:employeetype_id=>2,:designation_id=>3,
:department_id=>1,:UID=>'Sandhya',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)  
Employee.create(:employment_id=>10009,:name=>'Kavitha',:gender_id=>2,:father_name=>'Kiran',
:dob=>'1987-5-09',:date_join=>'2008-09-03',:religion_id=>3,:caste_id=>2,:marital_id=>2,:education=>' Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-292/2',:phone=>'040-2012001',:mobile=>'9952889230',
:email=>'kavitha@sark.com',:photo=>'9.jpg',:pan=>'A12P0822',:pf_number=>'85280010',
:bank_account_number=>'62016004273',:bank_id=>1,:employeetype_id=>2,:designation_id=>3,
:department_id=>1,:UID=>'Kavitha',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)   
Employee.create(:employment_id=>10010,:name=>'Pavani',:gender_id=>2,:father_name=>'Chranjeevi',
:dob=>'1990-5-09',:date_join=>'2009-09-03',:religion_id=>3,:caste_id=>2,:marital_id=>2,:education=>' Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-292/2',:phone=>'040-2012001',:mobile=>'9952889230',
:email=>'Pavani@sark.com',:photo=>'10.jpg',:pan=>'A12P0820',:pf_number=>'80080010',
:bank_account_number=>'62016004270',:bank_id=>1,:employeetype_id=>2,:designation_id=>3,
:department_id=>1,:UID=>'Pavani',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)    
Employee.create(:employment_id=>10011,:name=>'Rajita',:gender_id=>2,:father_name=>'Ramakrishna',
:dob=>'1992-5-09',:date_join=>'2009-09-03',:religion_id=>3,:caste_id=>2,:marital_id=>2,:education=>' Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-252/2',:phone=>'040-2012001',:mobile=>'9952889230',
:email=>'rajita@sark.com',:photo=>'11.jpg',:pan=>'A12P0820',:pf_number=>'80080010',
:bank_account_number=>'62016004270',:bank_id=>1,:employeetype_id=>1,:designation_id=>3,
:department_id=>1,:UID=>'Rajita',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)   
Employee.create(:employment_id=>10012,:name=>'Dinesh',:gender_id=>1,:father_name=>'Narayana',
:dob=>'1991-5-09',:date_join=>'2008-09-03',:religion_id=>3,:caste_id=>2,:marital_id=>2,:education=>' Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-252/2',:phone=>'040-2010001',:mobile=>'9999889230',
:email=>'dinesh@sark.com',:photo=>'12.jpg',:pan=>'A12P0800',:pf_number=>'80080010',
:bank_account_number=>'62016004070',:bank_id=>1,:employeetype_id=>1,:designation_id=>3,
:department_id=>1,:UID=>'Dinesh',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)    
Employee.create(:employment_id=>10013,:name=>'Teja',:gender_id=>1,:father_name=>'Narayana',
:dob=>'1990-5-09',:date_join=>'2008-09-03',:religion_id=>3,:caste_id=>2,:marital_id=>2,:education=>' Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-252/2',:phone=>'040-2010001',:mobile=>'9999889230',
:email=>'teja@sark.com',:photo=>'13.jpg',:pan=>'A12P0800',:pf_number=>'80080010',
:bank_account_number=>'62016004070',:bank_id=>1,:employeetype_id=>1,:designation_id=>3,
:department_id=>1,:UID=>'Teja',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)     
Employee.create(:employment_id=>10014,:name=>'Sudhakar',:gender_id=>1,:father_name=>'Sriramulu',
:dob=>'1989-5-09',:date_join=>'2008-09-03',:religion_id=>3,:caste_id=>2,:marital_id=>2,:education=>' Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-252/2',:phone=>'040-2010001',:mobile=>'9999866230',
:email=>'sudhakar@sark.com',:photo=>'14.jpg',:pan=>'A12P0800',:pf_number=>'80080010',
:bank_account_number=>'62016001270',:bank_id=>1,:employeetype_id=>1,:designation_id=>3,
:department_id=>1,:UID=>'Sudhakar',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)   
Employee.create(:employment_id=>10015,:name=>'Sekhar',:gender_id=>1,:father_name=>'Narayana',
:dob=>'1990-5-09',:date_join=>'2007-09-03',:religion_id=>3,:caste_id=>2,:marital_id=>2,:education=>' Graduation',:blood_group=>'B+ve',:nationality=>'India',:address=>'2-1-252/2',:phone=>'040-2010001',:mobile=>'9999889230',
:email=>'sekhar@sark.com',:photo=>'15.jpg',:pan=>'A12P0800',:pf_number=>'80080010',
:bank_account_number=>'62016004070',:bank_id=>1,:employeetype_id=>1,:designation_id=>3,
:department_id=>1,:UID=>'Sekhar',
:created_by=>1,:modified_by=>1,:employeecategory_id => 3)  
#==============================================================================================
#employeetypes
Employeetype.create (:name=>'Perminent',:description=>'Perminent- Employee',:created_by=>1,:modified_by=>1)   
Employeetype.create (:name=>'Daily Wage',:description=>'Temporary- Employee',:created_by=>1,:modified_by=>1)
#===============================================================================================
#banks
Bank.create(:name=>'SBI', :branch=>'BanjaraHills', :branch_code=>1400, :address=>'Hyderabad', :phone1=>'12355',:phone2=>'12345', :manager=>'Veni', :manager_contact=>'12345', :created_by=>1,:modified_by=>1)
#========================================================================================
#employeecategory
Employeecategory.create (:name=>'Executive',:description=>'Perminent- Employee',:created_by=>1,:modified_by=>1)   
Employeecategory.create (:name=>'Officer',:description=>'Temporary- Employee',:created_by=>1,:modified_by=>1)
Employeecategory.create (:name=>'Employee',:description=>'Temporary- Employee',:created_by=>1,:modified_by=>1)
#========================================================================================
 #itemmasters
Itemmaster.create(:itemcategory_id=>1,:item_name=>'pen',:quantity=>5,:description=>'five pens',
:created_by=>1,:modified_by=>1) 
Itemmaster.create(:itemcategory_id=>2,:item_name=>'pencil',:quantity=>5,:description=>'five pencils',:created_by=>1,:modified_by=>1)
#====================================================================================
#itemcategories
Itemcategory.create(:category_name=>'pen',:short_description=>'first',:description=>'first',
:created_by=>1,:modified_by=>1)  
Itemcategory.create(:category_name=>'pencil',:short_description=>'second',
:description=>'second',:created_by=>1,:modified_by=>1) 
#====================================================================================
#billpassings
Billpassing.create(:invoice_number=>1,:invoice_date=>'2010-8-31',:amount=>500.0,
:org_name=>'mahesh stores',:address=>'jublihills',:description=>'passing invoices',
:created_by=>1,:modified_by=>1)  
Billpassing.create(:invoice_number=>2,:invoice_date=>'2010-8-31',:amount=>1000.0,
:org_name=>'Kumar stores',:address=>'jublihills',:description=>'passing invoices',
:created_by=>1,:modified_by=>1)  

#====================================================================================
#storecunsumptions  
Storecunsumption.create(:itemmaster_id=>1,:department_id=>1,:quantity=>10,:description=>'proper consumption',:created_by=>1,:modified_by=>1) 
Storecunsumption.create(:itemmaster_id=>2,:department_id=>2,:quantity=>20,:description=>'over consumption',:created_by=>1,:modified_by=>1) 
#====================================================================================
#goodsreceives
Goodsreceive.create(:itemmaster_id=>1,:quantity=>10,:amount=>5000.00,:received_date=>'2010-8-9',
:description=>'receiving goods',:created_by=>1,:modified_by=>1) 
Goodsreceive.create(:itemmaster_id=>2,:quantity=>10,:amount=>4000.00,:received_date=>'2010-8-10',
:description=>'receiving goods',:created_by=>1,:modified_by=>1) 
#===================================================================================
#goodsreturns
Goodsreturn.create(:itemmaster_id=>1,:quantity=>3,:amount=>150.0,:return_date=>'2010-8-16',
:description=>'damaged goods',:created_by=>1,:modified_by=>1) 
Goodsreturn.create(:itemmaster_id=>2,:quantity=>4,:amount=>250.0,:return_date=>'2010-8-17',
:description=>'expired goods',:created_by=>1,:modified_by=>1) 
#====================================================================================
#billpays
Billpay.create(:invoice_number=>1,:date=>'2010-8-20',:amount=>400.0,:paid_amount=>140.0,
:description=>'bill payment',:created_by=>1,:modified_by=>1) 
Billpay.create(:invoice_number=>2,:date=>'2010-8-22',:amount=>800.0,:paid_amount=>440.0,
:description=>'bill payment',:created_by=>1,:modified_by=>1) 
#====================================================================================
#table: licenses
License.create(:license_number=>50001,:first_name=>'ala',:last_name=>'Ramana',:father_name=>'Prahladhudu',
 :shop_name=>'PVR',:shop_address1=>'punjagutta',:shop_address1=>'hyderabad',
 :street_id=>1,:ward_id=>1,:licensetype_id=>1,:period_from=>'2010-8-1',  :period_to=>'2011-8-1',
:description=>'ramana license',
  :created_by=>1,:modified_by=>1)
License.create(:license_number=>50002,:first_name=>'Katepally',:last_name=>'Raviteja',:father_name=>'KrishnaMurthy',
 :shop_name=>'Inox',:shop_address1=>'Banjarahills',:shop_address1=>'hyderabad',
 :street_id=>2,:ward_id=>2,:licensetype_id=>2,:period_from=>'2010-7-1',  :period_to=>'2011-7-1',
:description=>'raviteja license',
  :created_by=>1,:modified_by=>1)
License.create(:license_number=>50003,:first_name=>'Bethala',:last_name=>'Anil',:father_name=>'Narayana',
 :shop_name=>'cinemax',:shop_address1=>'Suchitra',:shop_address1=>'hyderabad',
 :street_id=>2,:ward_id=>2,:licensetype_id=>2,  :period_from=>'2010-7-1',  :period_to=>'2011-7-1',
:description=>'anil license',
  :created_by=>1,:modified_by=>1)
 
#====================================================================================
#licensetypes
Licensetype.create(:lic_type=>'License-1',:amount=>1400,:description=>'perminent license',:created_by=>1,:modified_by=>1)
Licensetype.create(:lic_type=>'License-2',:amount=>900,:description=>'temporery license',:created_by=>1,:modified_by=>1)
 
#===============================================================================================
#structurefactors
Structurefactor.create(:name=>'Pucca',:factor=>1.0,:description=>'Pucca structure',
:created_by=>1,:modified_by=>1)
Structurefactor.create(:name=>'Katcha',:factor=>2.0,:description=>'Katcha structure',
:created_by=>1,:modified_by=>1)
#===============================================================================================
#wtaxes
Wtax.create(:register_date=>'2010-8-1',:wtax_number=>1,:name=>'Ramanji',:door_number=>'2-1-252/1',:address=>'Nallkunta',
:phone=>'040-7607212',:email=>'ramana.ala@gmail.com',:mobile=>'9948818260',:connectiontype_id=>1,:start_year=>'2010-9-1',
:end_year=>'2011-9-1',:created_by=>1,:modified_by=>1)
Wtax.create(:register_date=>'2010-8-2',:wtax_number=>2,:name=>'Sekhar',:door_number=>'2-1-352/1',:address=>'SRnagar',
:phone=>'040-7601212',:email=>'sekhar.ala@gmail.com',:mobile=>'9948845260',:connectiontype_id=>2,:start_year=>'2010-10-1',
:end_year=>'2011-10-1',:created_by=>1,:modified_by=>1)
#===============================================================================================
#ptaxpayments
Ptaxpayment.create(:ptax_id=>1,:total_amount=>400.0,:paid_amount=>300.0,:balance_amount=>100.0,:paymentmode=>'cash',
:bank_name=>'SBI',:cheque_number=>'NULL',:remark=>'Balance To Be Paid',:created_by=>1,:modified_by=>1)
Ptaxpayment.create(:ptax_id=>2,:total_amount=>500.0,:paid_amount=>400.0,:balance_amount=>100.0,:paymentmode=>'check',
:bank_name=>'SBI',:cheque_number=>'54321',:remark=>'Balance To Be Paid',:created_by=>1,:modified_by=>1)
#===============================================================================================
#marriages
Marriage.create(:marriage_reg_number=>40001,:groom_name=>'Ramana',:groom_father=>'Prahlathudu',:groom_mother=>'Parvathi',
:groom_birth_date=>'1985-8-1',:groom_address=>'Dhone',:groom_district=>'Kurnool',:groom_state=>'Andhara Pradesh',
:groom_country=>'India',:bride_name=>'Bhumika',:bride_father=>'Johnson Chawla',:bride_mother=>'Swetha Chawla',:bride_birth_date=>'1985-3-16',:bride_address=>'Mumbai',:bride_district=>'Mumbai',:bride_state=>'Maharasthra',
:bride_country=>'India',:marriage_date=>'2010-3-16',:marriage_place=>'Kurnool',:created_by=>1,:modified_by=>1)
Marriage.create(:marriage_reg_number=>40002,:groom_name=>'Ramanji',:groom_father=>'Balaiah',:groom_mother=>'Chennamma',
:groom_birth_date=>'1972-8-1',:groom_address=>'Dhone',:groom_district=>'Kurnool',:groom_state=>'Andhara Pradesh',
:groom_country=>'India',:bride_name=>'Shashikala',:bride_father=>'Venkatesh',:bride_mother=>'Saroja ',:bride_birth_date=>'1976-3-16',:bride_address=>'Ballari',:bride_district=>'Ballari',:bride_state=>'Karnataka',
:bride_country=>'India',:marriage_date=>'2010-8-8',:marriage_place=>'Kurnool',:created_by=>1,:modified_by=>1)
Marriage.create(:marriage_reg_number=>40003,:groom_name=>'Ramesh',:groom_father=>'Suresh',:groom_mother=>'Sharada',
:groom_birth_date=>'1985-7-1',:groom_address=>'Dhone',:groom_district=>'Kurnool',:groom_state=>'Andhara Pradesh',
:groom_country=>'India',:bride_name=>'Suvarchala',:bride_father=>'Sudhakar',:bride_mother=>'Savithri ',:bride_birth_date=>'1989-3-16',:bride_address=>'Panyam',:bride_district=>'Kurnool',:bride_state=>'Andhra Pradesh',
:bride_country=>'India',:marriage_date=>'2008-8-8',:marriage_place=>'Kurnool',:created_by=>1,:modified_by=>1)
#===============================================================================================
#rationcards
Rationcard.create(:rationcardtype_id=>1,:rationcard_number=>70001,:owner_name=>'Rajesh',:owner_birth_date=>'1965-8-8',
:gender_id=>1,:owner_address=>'Hyderabad',:memeber_name1=>'Savithri',:memeber1_birth_date=>'1969-8-5',:gender_id=>2,
:relation1=>'wife',:memeber_name2=>'Ranjit',:memeber2_birth_date=>'1985-6-20',:gender_id=>1,:relation2=>'son',
:memeber_name3=>'Laxmi',:memeber3_birth_date=>'1982-8-1',:gender_id=>2,:relation3=>'daughter',	
:memeber_name4=>'Srinu',:memeber4_birth_date=>'1989-8-8',:gender_id=>1,:relation4=>'Son',
:memeber_name5=>'Venkateswari',:memeber5_birth_date=>'1988-8-9',:gender_id=>2,:relation5=>'daughter',
:memeber_name6=>'Madhu',:memeber6_birth_date=>'1990-8-7',:gender_id=>1,:relation6=>'son',:card_reg_date=>'2001-8-1',
:created_by=>1,:modified_by=>1)
Rationcard.create(:rationcardtype_id=>2,:rationcard_number=>70002,:owner_name=>'Prahlathudu',:owner_birth_date=>'1955-8-8',
:gender_id=>1,:owner_address=>'Dhone',:memeber_name1=>'Parvathi',:memeber1_birth_date=>'1960-8-5',:gender_id=>2,
:relation1=>'wife',:memeber_name2=>'Ramana',:memeber2_birth_date=>'1985-8-1',:gender_id=>1,:relation2=>'son',
:memeber_name3=>'Laxmi',:memeber3_birth_date=>'1983-8-1',:gender_id=>2,:relation3=>'daughter',	
:memeber_name4=>'Srinu',:memeber4_birth_date=>'1989-8-8',:gender_id=>1,:relation4=>'Son',
:memeber_name5=>'Venkateswari',:memeber5_birth_date=>'1988-8-9',:gender_id=>2,:relation5=>'daughter',
:memeber_name6=>'Madhu',:memeber6_birth_date=>'1990-6-5',:gender_id=>1,:relation6=>'son',:card_reg_date=>'2001-8-1',
:created_by=>1,:modified_by=>1)
#===============================================================================================	
#rationcardtypes
Rationcardtype.create(:card_type=>'BPL',:description=>'BPL Type',:created_by=>1,:modified_by=>1)	
Rationcardtype.create(:card_type=>'APL',:description=>'APL Type',:created_by=>1,:modified_by=>1)	
Rationcardtype.create(:card_type=>'AY',:description=>'AY Type',:created_by=>1,:modified_by=>1)	

#===============================================================================================	       
#seasonallicenses
Seasonallicense.create(:first_name=>'ala',:last_name=>'ramana',:gender_id=>1,
 :address=>'nallakunta',:shop_name=>'aditya  trades',
 :shop_number=>111,:shop_address=>'ameerpet',
 :start_date=>'2009-8-1',:end_date=>'2010-8-1',
 :amount=>25000,:created_by=>1,:modified_by=>1)
Seasonallicense.create(:first_name=>'Bethala',:last_name=>'kiran',:gender_id=>1,
 :address=>'lbnagar',:shop_name=>'sureka  finance',
 :shop_number=>112,:shop_address=>'uppal',
 :start_date=>'2009-8-2',:end_date=>'2010-8-1',
 :amount=>26000,:created_by=>1,:modified_by=>1)
Seasonallicense.create(:first_name=>'Panuganti',:last_name=>'anil',:gender_id=>1,
 :address=>'koti',:shop_name=>'sureka  diagnostics',
 :shop_number=>113,:shop_address=>'koti',
 :start_date=>'2009-8-3',:end_date=>'2010-8-2',
 :amount=>27000,:created_by=>1,:modified_by=>1)	
Seasonallicense.create(:first_name=>'Kanaparti',:last_name=>'sridhar',:gender_id=>1,
 :address=>'nacharam',:shop_name=>'sureka  medicalstores',
 :shop_number=>114,:shop_address=>'koti',
 :start_date=>'2009-8-3',:end_date=>'2010-8-2',
 :amount=>28000,:created_by=>1,:modified_by=>1)	
Seasonallicense.create(:first_name=>'Koniseti',:last_name=>'Savithri',:gender_id=>2,
 :address=>'koti',:shop_name=>'savithri  sarees',
 :shop_number=>115,:shop_address=>'koti',
 :start_date=>'2009-8-3',:end_date=>'2010-8-2',
 :amount=>28000,:created_by=>1,:modified_by=>1)	
#===============================================================================================	       
#spensions
Spension.create(:spension_number=>80001,:ssccategory_id=>1,:first_name=>'Koniseti',
:last_name=>'Savithri',:gender_id=>2,:date_of_birth=>'1935-8-2',
:photo=>'1.jpg',:reg_date=>'1995-5-5',:age=>60,:address=>'kurnool',
:description=>'eligible',:approved=>0,:created_by=>1,:modified_by=>1)
Spension.create(:spension_number=>80002,:ssccategory_id=>2,:first_name=>'Bethala',
:last_name=>'kiran',:gender_id=>1,:date_of_birth=>'1936-8-2',
:photo=>'2.jpg',:reg_date=>'1996-5-5',:age=>60,:address=>'vijayavada',
:description=>'eligible',:approved=>0,:created_by=>1,:modified_by=>1)
Spension.create(:spension_number=>80003,:ssccategory_id=>3,:first_name=>'panuganti',
:last_name=>'anil',:gender_id=>1,:date_of_birth=>'1937-8-2',
:photo=>'3.jpg',:reg_date=>'1997-5-5',:age=>60,:address=>'warangal',
:description=>'eligible',:approved=>0,:created_by=>1,:modified_by=>1)
#===============================================================================================	       
#complainttypes
Complainttype.create(:complaint_type =>'Normal',:description =>'normal-complaint',:created_by =>1,:modified_by =>1)
Complainttype.create(:complaint_type =>'Urgent',:description =>'serious-complaint',:created_by =>1,:modified_by =>1) 
Complainttype.create(:complaint_type =>'Most Urgent',:description =>'very serious-complaint',:created_by =>1,:modified_by =>1) 
#===============================================================================================	                
#complaints
Complaint.create(:complaint_number=>1,:complainttype_id=>1,:department_id=>1,
:complaint_dec=>'problem with watertax',:complaint_date=>'201-8-1',
:resolve_time=>'5',:approved=>0,:created_by=>1,:modified_by=>1)
Complaint.create(:complaint_number=>2,:complainttype_id=>2,:department_id=>2,
:complaint_dec=>'problem with birth certificate',:complaint_date=>'201-8-2',
:resolve_time=>'6',:approved=>0,:created_by=>1,:modified_by=>1)
Complaint.create(:complaint_number=>3,:complainttype_id=>3,:department_id=>2,
:complaint_dec=>'problem with death certificate',:complaint_date=>'201-8-3',
:resolve_time=>'7',:approved=>0,:created_by=>1,:modified_by=>1)
#===============================================================================================	                
#rentaltypes
Rentaltype.create(:rental_type =>'Commercial',:amount =>25000,
:description =>'commercial rentals',:created_by =>1,:modified_by =>1)
Rentaltype.create(:rental_type =>'Residential',:amount =>5000,
:description =>'residential rentals',:created_by =>1,:modified_by =>1)
#===============================================================================================	                
#rentals
Rental.create(:rental_number =>60001,:first_name =>'ala',
:last_name =>'ramanji',:father_name =>'balaiah',
:rentaltype_id =>1,:street_id =>1,:ward_id =>1,:period_from =>'2009-8-1',
:period_to => '2010-5-2',:description =>'rental for commercial',
:created_by =>1,:modified_by =>1)
 Rental.create(:rental_number =>60002,:first_name =>'panuganti',
:last_name =>'anil',:father_name =>'venkatesh',
:rentaltype_id =>1,:street_id =>1,:ward_id =>1,:period_from =>'2009-8-11',
:period_to => '2010-5-12',:description =>'rental for commercial',
:created_by =>1,:modified_by =>1)
 Rental.create(:rental_number =>60003,:first_name =>'kanaparti',
:last_name =>'sridhar',:father_name =>'narayana',
:rentaltype_id =>2,:street_id =>2,:ward_id =>2,:period_from =>'2009-8-12',
:period_to => '2010-5-22',:description =>'rental for redential',
:created_by =>1,:modified_by =>1)
#===============================================================================================	                                
#ssccategories
Ssccategory.create(:name =>'Widow',:amount =>200,:description =>'normal category',:created_by =>1,:modified_by =>1)
Ssccategory.create(:name =>'Garibhi',:amount =>300,:description =>'special category',:created_by =>1,:modified_by =>1)
#===============================================================================================	                                



  

