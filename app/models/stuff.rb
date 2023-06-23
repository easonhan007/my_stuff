class Stuff < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validate :amount_should_more_than_zero
  
  scope :name_filter, ->(name) {where("name like ?", "%" + Stuff.sanitize_sql_like(name) + "%")} 
  scope :desc_filter, ->(desc) {where("desc like ?", "%" + Stuff.sanitize_sql_like(desc) + "%")} 

  def amount_should_more_than_zero
    if amount <= 0
      errors.add(:amount, "should be more than 0")
    end
  end

end
