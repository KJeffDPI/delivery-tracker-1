# == Schema Information
#
# Table name: packages
#
#  id           :integer          not null, primary key
#  arrival_date :date
#  content      :string
#  date         :date
#  details      :string
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
class Package < ActiveRecord::Base
  # ...
  def date=(value)
    # Set the value of the date attribute here
    # For example:
    write_attribute(:date, value&.to_date)
  end
end
