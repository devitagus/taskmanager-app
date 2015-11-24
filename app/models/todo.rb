class Todo < ActiveRecord::Base

  validates :title, presence: true
  validates :title, length: { in: 3..200 }

end
