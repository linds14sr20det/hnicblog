class Cohort < ApplicationRecord
  has_many :submissions
  #TODO: Create the pivot table for this many to many relation
  #has_many :categories
  #TODO: validate start is before end
  before_save :switch_active

  private

  def switch_active
    
  end
end
