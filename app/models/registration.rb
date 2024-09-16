class Registration < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A0\d{9,14}\z/

  validate :first_and_last_name_is_valid
  validate :first_and_last_name_presence
  validate :date_of_birth_and_gender_presence
  validate :email_and_phone_presence
  validate :subject_presence

  private

  # def email_format
  #   if email.present?
      
  #   end
  # end
  def subject_presence
    if subject.blank?
      errors.add(:subject, "Subject should be selected")
    end
  end

  def email_and_phone_presence
    if email.blank? && phone.blank?
      errors.add(:row3, "Email and phone can't be blank")
      errors.add(:email, "Please fill your email")
      errors.add(:phone, "Please fill your phone number")
    elsif email.blank?
      errors.add(:email, "Please fill your email")
      errors.add(:row3, "Please fill your email")
    elsif !email.match?(VALID_EMAIL_REGEX)
      errors.add(:email, "is not a valid email")
    elsif phone.blank?
      errors.add(:phone, "Please fill your phone number")
      errors.add(:row3, "Please fill your phone number")
    elsif !phone.match?(VALID_PHONE_REGEX)
      errors.add(:phone, "must start with 0 and be 10 to 15 digits long")
    end
  end
  def date_of_birth_and_gender_presence
    if dob.blank? && gender.blank?
      errors.add(:row2, "Date of birth and gender can't be blank")
      errors.add(:dob, "Date of birth can't be blank")
      errors.add(:gender, "Gender can't be blank")
    elsif dob.blank?
      errors.add(:dob, "Date of birth can't be blank")
      errors.add(:row2, "Date of birth can't be blank")
    elsif gender.blank?
      errors.add(:gender, "Gender can't be blank")
      errors.add(:row2, "Gender can't be blank")
    end
  end

  def first_and_last_name_presence
    if first_name.blank? && last_name.blank?
      errors.add(:name, "First name and last name can't be blank")
      errors.add(:first_name, "First name can't be blank")
      errors.add(:last_name, "Last name can't be blank")
    elsif first_name.blank?
      errors.add(:first_name, "First name can't be blank")
      errors.add(:name, "First name can't be blank")
    elsif last_name.blank?
      errors.add(:last_name, "Last name can't be blank")
      errors.add(:name, "Last name can't be blank")
    end
  end
  
  def first_and_last_name_is_valid
    if !first_name.match(/^[a-zA-Z\s]*$/) && !last_name.match(/^[a-zA-Z\s]*$/)
      errors.add(:name, "Invalid first and last name")
      errors.add(:first_name, "Invalid first name")
      errors.add(:last_name, "Invalid first name")
    elsif !first_name.match(/^[a-zA-Z\s]*$/)
      errors.add(:first_name, "Invalid first name")
      errors.add(:name, "Invalid first name")
    elsif !last_name.match(/^[a-zA-Z\s]*$/)
      errors.add(:last_name, "Invalid last name")
      errors.add(:name, "Invalid last name")
    end
  end

end
