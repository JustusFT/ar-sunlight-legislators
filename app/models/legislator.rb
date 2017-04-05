require_relative '../../db/config'

# class PhoneValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     if value.gsub(/[^0-9]/, "").length < 10
#       record.errors[attribute] << (options[:message] || "is not a valid number")
#     end
#   end
# end

class Legislator < ActiveRecord::Base
  # validates :phone, :phone => true
  def name
    "#{firstname} #{middlename} #{lastname}".gsub(/\s+/, " ")
  end
end
