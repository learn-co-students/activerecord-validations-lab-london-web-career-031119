class Author < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :phone_number, length: {is: 10}, format: {with: /[0-9]/, message: "only allows numbers"}
end
