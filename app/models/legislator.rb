require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  validates :title, :length => { :maximum => 3 } 
  validates :state, :length => { :maximum => 2 }
  # validates :website, :format => { :with => /http:\/\//, :message => "Invalid" }
  # validates :webform, :format => { :with => /http:\/\//, :message => "Invalid" }
  # validate :check_phone_number
  # validate :check_fax_number

  belongs_to :senator
  belongs_to :representative

  def check_phone_number
    if phone.gsub(/[^\d]/,'').length < 10
      errors.add(:phone, "Invalid")
    end
  end

  def check_fax_number
    if fax.gsub(/[^\d]/,'').length < 10
      errors.add(:fax, "Invalid")
    end
  end
end

class Senator < ActiveRecord::Base
  has_many :legislators
end

class Representative < ActiveRecord::Base
  has_many :legislators
end


# validations

# title == Sen/Rep
# state == two all caps letters
# phone/fax number validate
# email validate
# website/form validate
