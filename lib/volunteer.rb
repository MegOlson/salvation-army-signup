class Volunteer < ActiveRecord::Base
  # before_save(:format_date)
  #
  # def format_date
  #   date = self.date.split("-")
  #   self.date = date.rotate(1).join("-")
  # end
end
