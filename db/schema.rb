# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101005105841) do

  create_table "banks", :force => true do |t|
    t.string   "name",            :limit => 50, :null => false
    t.string   "branch",          :limit => 50, :null => false
    t.integer  "branch_code",                   :null => false
    t.text     "address",                       :null => false
    t.string   "phone1",          :limit => 11, :null => false
    t.string   "phone2",          :limit => 11
    t.string   "manager",         :limit => 50
    t.string   "manager_contact", :limit => 50
    t.integer  "created_by",                    :null => false
    t.integer  "modified_by",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billpassings", :force => true do |t|
    t.integer  "invoice_number"
    t.date     "invoice_date"
    t.float    "amount"
    t.string   "org_name"
    t.text     "address"
    t.text     "description"
    t.integer  "created_by",     :null => false
    t.integer  "modified_by",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billpays", :force => true do |t|
    t.integer  "invoice_number"
    t.date     "date"
    t.float    "amount"
    t.float    "paid_amount"
    t.text     "description"
    t.integer  "created_by",     :null => false
    t.integer  "modified_by",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "births", :force => true do |t|
    t.date     "birth_date",                                            :null => false
    t.string   "first_name",          :limit => 50
    t.string   "middle_name",         :limit => 50
    t.string   "last_name",           :limit => 50
    t.string   "father_name",         :limit => 100,                    :null => false
    t.string   "mother_name",         :limit => 100,                    :null => false
    t.integer  "gender_id",                                             :null => false
    t.text     "address"
    t.integer  "caste_id",                                              :null => false
    t.string   "birth_place",         :limit => 20,                     :null => false
    t.integer  "hospital_id"
    t.string   "city",                :limit => 50
    t.string   "tehsil",              :limit => 50
    t.string   "district",            :limit => 50
    t.string   "applicant",           :limit => 100,                    :null => false
    t.integer  "religion_id",                                           :null => false
    t.string   "mother_native",       :limit => 50
    t.string   "father_education",    :limit => 50
    t.string   "mother_education",    :limit => 50
    t.string   "father_occupation",   :limit => 50
    t.string   "mother_occupation",   :limit => 50
    t.integer  "mother_age_marriage", :limit => 2
    t.integer  "mother_age_delivery", :limit => 2
    t.float    "weight"
    t.integer  "total_children",      :limit => 2
    t.integer  "deliverymethod_id",                                     :null => false
    t.integer  "total_time",          :limit => 2
    t.string   "helper",              :limit => 50,                     :null => false
    t.integer  "register_id",                                           :null => false
    t.date     "register_date"
    t.string   "remarks",             :limit => 100
    t.string   "unit",                :limit => 100
    t.float    "amount"
    t.integer  "copies"
    t.integer  "employee_id",                                           :null => false
    t.integer  "approved_by"
    t.date     "approved_on"
    t.integer  "created_by",                                            :null => false
    t.integer  "modified_by",                                           :null => false
    t.boolean  "approved",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bpays", :force => true do |t|
    t.integer  "department_id"
    t.integer  "designation_id"
    t.float    "bpay_amount"
    t.text     "description"
    t.integer  "created_by",     :null => false
    t.integer  "modified_by",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "castes", :force => true do |t|
    t.string   "name",        :limit => 20, :null => false
    t.integer  "religion_id"
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "complaints", :force => true do |t|
    t.integer  "complaint_number"
    t.integer  "complainttype_id"
    t.integer  "department_id"
    t.text     "complaint_dec"
    t.date     "complaint_date"
    t.integer  "resolve_time"
    t.boolean  "approved",         :default => false
    t.integer  "created_by",                          :null => false
    t.integer  "modified_by",                         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "complainttypes", :force => true do |t|
    t.string   "complaint_type"
    t.text     "description"
    t.integer  "created_by",     :null => false
    t.integer  "modified_by",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "connectiontypes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "amount"
    t.integer  "created_by",  :null => false
    t.integer  "modified_by", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "das", :force => true do |t|
    t.float    "da_amount"
    t.text     "description"
    t.integer  "created_by",  :null => false
    t.integer  "modified_by", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deaths", :force => true do |t|
    t.date     "death_date",                                               :null => false
    t.string   "first_name",             :limit => 50
    t.string   "middle_name",            :limit => 50
    t.string   "last_name",              :limit => 50
    t.string   "father_name",            :limit => 100,                    :null => false
    t.integer  "gender_id",                                                :null => false
    t.integer  "age",                    :limit => 3,                      :null => false
    t.text     "address"
    t.string   "death_place",            :limit => 20,                     :null => false
    t.integer  "hospital_id",                                              :null => false
    t.string   "city",                   :limit => 50
    t.string   "tehsil",                 :limit => 50
    t.string   "district",               :limit => 50
    t.string   "applicant",              :limit => 100,                    :null => false
    t.integer  "religion_id",                                              :null => false
    t.integer  "caste_id",                                                 :null => false
    t.string   "death_before_treatment", :limit => 50
    t.string   "death_with_illness",     :limit => 5
    t.string   "desease_name",           :limit => 50
    t.string   "death_delivery",         :limit => 5
    t.string   "death_cause_smoke",      :limit => 5
    t.integer  "death_smoke_age",        :limit => 2
    t.string   "death_cause_supari",     :limit => 5
    t.integer  "death_supari_age",       :limit => 2
    t.string   "death_cause_drink",      :limit => 5
    t.integer  "death_drink_age",        :limit => 2
    t.integer  "register_id",                                              :null => false
    t.date     "register_date",                                            :null => false
    t.string   "remarks",                :limit => 100
    t.float    "amount"
    t.integer  "copies"
    t.integer  "employee_id",                                              :null => false
    t.integer  "approved_by"
    t.date     "approved_on"
    t.integer  "created_by",                                               :null => false
    t.integer  "modified_by",                                              :null => false
    t.boolean  "approved",                              :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliverymethods", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.string   "short_code",  :limit => 50, :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "designations", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employeecategories", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.integer  "employee_id",                        :default => 10001, :null => false
    t.string   "name",                :limit => 100,                    :null => false
    t.integer  "gender_id",                                             :null => false
    t.string   "father_name",         :limit => 50,                     :null => false
    t.date     "dob",                                                   :null => false
    t.date     "date_join",                                             :null => false
    t.integer  "religion_id",                                           :null => false
    t.integer  "caste_id",                                              :null => false
    t.integer  "marital_id",                                            :null => false
    t.string   "education",           :limit => 50,                     :null => false
    t.string   "blood_group",         :limit => 5,                      :null => false
    t.string   "nationality",         :limit => 20,                     :null => false
    t.text     "address",                                               :null => false
    t.string   "phone",               :limit => 11,                     :null => false
    t.string   "mobile",              :limit => 11,                     :null => false
    t.string   "email",               :limit => 100,                    :null => false
    t.string   "photo",               :limit => 100,                    :null => false
    t.string   "pan",                 :limit => 11
    t.string   "pf_number",           :limit => 10,                     :null => false
    t.string   "bank_account_number", :limit => 20,                     :null => false
    t.integer  "bank_id",                                               :null => false
    t.integer  "employeetype_id",                                       :null => false
    t.integer  "employeecategory_id"
    t.integer  "designation_id",                                        :null => false
    t.integer  "department_id"
    t.string   "UID",                 :limit => 15,                     :null => false
    t.integer  "created_by",                                            :null => false
    t.integer  "modified_by",                                           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employeetypes", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genders", :force => true do |t|
    t.string   "name",        :limit => 10, :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goodsreceives", :force => true do |t|
    t.integer  "itemmaster_id"
    t.integer  "quantity"
    t.float    "amount"
    t.date     "received_date"
    t.text     "description"
    t.integer  "created_by",    :null => false
    t.integer  "modified_by",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goodsreturns", :force => true do |t|
    t.integer  "itemmaster_id"
    t.integer  "quantity"
    t.float    "amount"
    t.date     "return_date"
    t.text     "description"
    t.integer  "created_by",    :null => false
    t.integer  "modified_by",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospitals", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.text     "address",                   :null => false
    t.string   "city",        :limit => 50, :null => false
    t.string   "tehsil",      :limit => 50, :null => false
    t.string   "district",    :limit => 50, :null => false
    t.string   "phone1",      :limit => 11, :null => false
    t.string   "phone2",      :limit => 11, :null => false
    t.string   "doctor",      :limit => 50, :null => false
    t.string   "education",   :limit => 50, :null => false
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hras", :force => true do |t|
    t.integer  "department_id"
    t.integer  "designation_id"
    t.float    "hra_amount"
    t.text     "description"
    t.integer  "created_by",     :null => false
    t.integer  "modified_by",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itemcategories", :force => true do |t|
    t.string   "category_name"
    t.text     "short_description"
    t.text     "description"
    t.integer  "created_by",        :null => false
    t.integer  "modified_by",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itemmasters", :force => true do |t|
    t.integer  "itemcategory_id"
    t.string   "item_name"
    t.integer  "quantity"
    t.text     "description"
    t.integer  "created_by",      :null => false
    t.integer  "modified_by",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", :force => true do |t|
    t.integer  "license_number"
    t.string   "first_name",     :limit => 50
    t.string   "last_name",      :limit => 50
    t.string   "father_name",    :limit => 50
    t.string   "shop_name",      :limit => 50
    t.string   "shop_address1",  :limit => 50
    t.integer  "street_id"
    t.integer  "ward_id"
    t.integer  "licensetype_id"
    t.integer  "period_from"
    t.integer  "period_to"
    t.text     "description"
    t.integer  "created_by",                   :null => false
    t.integer  "modified_by",                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licensetypes", :force => true do |t|
    t.string   "lic_type"
    t.integer  "amount"
    t.text     "description"
    t.integer  "created_by",  :null => false
    t.integer  "modified_by", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loanaccounts", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "loanaccountno"
    t.float    "loan_amount"
    t.float    "interest"
    t.integer  "emi"
    t.float    "total"
    t.float    "paid_amount"
    t.float    "balance_amount"
    t.integer  "created_by",     :null => false
    t.integer  "modified_by",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maritals", :force => true do |t|
    t.string   "status",      :limit => 20, :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marriages", :force => true do |t|
    t.integer  "marriage_reg_number"
    t.string   "groom_name",                             :null => false
    t.string   "groom_father",                           :null => false
    t.string   "groom_mother",                           :null => false
    t.date     "groom_birth_date"
    t.string   "groom_photo"
    t.text     "groom_address"
    t.string   "groom_district"
    t.string   "groom_state"
    t.string   "groom_country"
    t.string   "bride_name",                             :null => false
    t.string   "bride_father",                           :null => false
    t.string   "bride_mother",                           :null => false
    t.date     "bride_birth_date"
    t.string   "bride_photo"
    t.text     "bride_address"
    t.string   "bride_district"
    t.string   "bride_state"
    t.string   "bride_country"
    t.date     "marriage_date"
    t.string   "marriage_place"
    t.boolean  "approved",            :default => false
    t.integer  "created_by",                             :null => false
    t.integer  "modified_by",                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "occupancyfactors", :force => true do |t|
    t.string   "name",        :limit => 100, :null => false
    t.float    "factor",                     :null => false
    t.text     "description"
    t.integer  "created_by",                 :null => false
    t.integer  "modified_by",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.string   "long_name",           :limit => 50, :null => false
    t.string   "short_name",          :limit => 50, :null => false
    t.integer  "organizationtype_id", :limit => 3
    t.text     "address",                           :null => false
    t.string   "city",                :limit => 50, :null => false
    t.string   "tehsil",              :limit => 50, :null => false
    t.string   "district",            :limit => 50, :null => false
    t.string   "state",               :limit => 50, :null => false
    t.string   "country",             :limit => 50, :null => false
    t.integer  "pin",                               :null => false
    t.string   "phone_number1",       :limit => 11, :null => false
    t.string   "phone_number2",       :limit => 11
    t.string   "phone_number3",       :limit => 11
    t.string   "fax_number1",         :limit => 11, :null => false
    t.string   "fax_number2",         :limit => 11
    t.string   "toll_free1",          :limit => 15
    t.string   "toll_free2",          :limit => 15
    t.string   "service_line",        :limit => 15
    t.string   "email",               :limit => 75, :null => false
    t.string   "web",                 :limit => 50, :null => false
    t.text     "about"
    t.text     "info"
    t.string   "coordinates",         :limit => 50
    t.integer  "created_by",                        :null => false
    t.integer  "modified_by",                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizationtypes", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.string   "name",            :limit => 100, :null => false
    t.integer  "propertytype_id",                :null => false
    t.text     "description"
    t.integer  "created_by",                     :null => false
    t.integer  "modified_by",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "propertytypes", :force => true do |t|
    t.string   "name",        :limit => 100, :null => false
    t.text     "description"
    t.integer  "created_by",                 :null => false
    t.integer  "modified_by",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ptaxes", :force => true do |t|
    t.integer  "assessment_number"
    t.integer  "ptaxregistration_id"
    t.date     "invoice_date"
    t.integer  "start_year"
    t.integer  "end_year"
    t.float    "total_area"
    t.float    "build_area"
    t.integer  "propertytype_id"
    t.integer  "taxcategory_id"
    t.integer  "occupancyfactor_id"
    t.integer  "structurefactor_id"
    t.integer  "unitvalue_id"
    t.float    "total"
    t.integer  "created_by",          :null => false
    t.integer  "modified_by",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ptaxpayments", :force => true do |t|
    t.integer  "ptax_id"
    t.float    "total_amount"
    t.float    "paid_amount"
    t.float    "balance_amount"
    t.string   "paymentmode"
    t.string   "bank_name"
    t.string   "cheque_number"
    t.text     "remark"
    t.integer  "created_by",     :null => false
    t.integer  "modified_by",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ptaxregistrations", :force => true do |t|
    t.date     "register_date"
    t.integer  "number",            :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "area"
    t.string   "door_number"
    t.string   "apartment_name"
    t.string   "email"
    t.integer  "phone"
    t.integer  "mobile"
    t.text     "description"
    t.integer  "zone_id"
    t.integer  "ward_id"
    t.integer  "street_id"
    t.integer  "floors"
    t.integer  "waterconnection"
    t.integer  "connectiontype_id"
    t.integer  "created_by",        :null => false
    t.integer  "modified_by",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rationcards", :force => true do |t|
    t.integer  "rationcardtype_id"
    t.integer  "rationcard_number"
    t.string   "owner_name"
    t.string   "owner_photo"
    t.date     "owner_birth_date"
    t.integer  "gender_id"
    t.text     "owner_address"
    t.string   "memeber_name1"
    t.date     "memeber1_birth_date"
    t.string   "relation1"
    t.string   "memeber_name2"
    t.date     "memeber2_birth_date"
    t.string   "relation2"
    t.string   "memeber_name3"
    t.date     "memeber3_birth_date"
    t.string   "relation3"
    t.string   "memeber_name4"
    t.date     "memeber4_birth_date"
    t.string   "relation4"
    t.string   "memeber_name5"
    t.date     "memeber5_birth_date"
    t.string   "relation5"
    t.string   "memeber_name6"
    t.date     "memeber6_birth_date"
    t.string   "relation6"
    t.date     "card_reg_date"
    t.integer  "created_by",          :null => false
    t.integer  "modified_by",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rationcardtypes", :force => true do |t|
    t.string   "card_type"
    t.text     "description"
    t.integer  "created_by",  :null => false
    t.integer  "modified_by", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "religions", :force => true do |t|
    t.string   "name",        :limit => 20, :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rentals", :force => true do |t|
    t.integer  "rental_number"
    t.string   "first_name",    :limit => 50
    t.string   "last_name",     :limit => 50
    t.string   "father_name",   :limit => 50
    t.integer  "rentaltype_id"
    t.integer  "street_id"
    t.integer  "ward_id"
    t.integer  "period_from"
    t.integer  "period_to"
    t.text     "description"
    t.integer  "created_by",                  :null => false
    t.integer  "modified_by",                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rentaltypes", :force => true do |t|
    t.string   "rental_type"
    t.integer  "amount"
    t.text     "description"
    t.integer  "created_by",  :null => false
    t.integer  "modified_by", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salaries", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "bpay_id"
    t.float    "pf_amount"
    t.float    "tax_amount"
    t.float    "allowences"
    t.float    "deductions"
    t.float    "gross_salary"
    t.float    "net_salary"
    t.integer  "created_by",   :null => false
    t.integer  "modified_by",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasonallicenses", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender_id"
    t.text     "address"
    t.string   "shop_name"
    t.integer  "shop_number"
    t.text     "shop_address"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "amount"
    t.integer  "created_by",   :null => false
    t.integer  "modified_by",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spensions", :force => true do |t|
    t.integer  "spension_number"
    t.integer  "ssccategory_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender_id"
    t.date     "date_of_birth"
    t.string   "photo"
    t.date     "reg_date"
    t.integer  "age"
    t.text     "address"
    t.text     "description"
    t.boolean  "approved",        :default => false
    t.integer  "created_by",                         :null => false
    t.integer  "modified_by",                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ssccategories", :force => true do |t|
    t.string   "name"
    t.float    "amount"
    t.string   "description"
    t.integer  "created_by",  :null => false
    t.integer  "modified_by", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storecunsumptions", :force => true do |t|
    t.integer  "itemmaster_id"
    t.integer  "department_id"
    t.integer  "quantity"
    t.text     "description"
    t.integer  "created_by",    :null => false
    t.integer  "modified_by",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streets", :force => true do |t|
    t.string   "name",        :limit => 100, :null => false
    t.integer  "ward_id",                    :null => false
    t.text     "description"
    t.integer  "created_by",                 :null => false
    t.integer  "modified_by",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "structurefactors", :force => true do |t|
    t.string   "name",        :limit => 100, :null => false
    t.float    "factor",                     :null => false
    t.text     "description"
    t.integer  "created_by",                 :null => false
    t.integer  "modified_by",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tas", :force => true do |t|
    t.float    "ta_percentage"
    t.text     "description"
    t.integer  "created_by",    :null => false
    t.integer  "modified_by",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxcategories", :force => true do |t|
    t.string   "category",    :limit => 25, :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxes", :force => true do |t|
    t.string   "name",        :null => false
    t.float    "amount",      :null => false
    t.text     "description"
    t.integer  "created_by",  :null => false
    t.integer  "modified_by", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unitvalues", :force => true do |t|
    t.integer  "taxcategory_id", :null => false
    t.float    "amount",         :null => false
    t.text     "description"
    t.integer  "created_by",     :null => false
    t.integer  "modified_by",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wards", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.integer  "zone_id",                   :null => false
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wtaxes", :force => true do |t|
    t.date     "register_date"
    t.integer  "wtax_number"
    t.string   "name"
    t.string   "door_number"
    t.string   "address"
    t.integer  "phone"
    t.string   "email"
    t.integer  "mobile"
    t.integer  "connectiontype_id"
    t.date     "start_year"
    t.date     "end_year"
    t.integer  "created_by",        :null => false
    t.integer  "modified_by",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zones", :force => true do |t|
    t.string   "name",        :limit => 25
    t.text     "description"
    t.integer  "created_by",                :null => false
    t.integer  "modified_by",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
