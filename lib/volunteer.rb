class Volunteer < ActiveRecord::Base
  validates(:name, {:presence => true, :length => { :maximum => 30 }})
  # before_save(:format_date)
  #
  # def format_date
  #   date = self.date.split("-")
  #   self.date = date.rotate(1).join("-")
  # end
end
