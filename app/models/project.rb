class Project < ActiveRecord::Base
  validates :title, presence: true

  has_many :tasks, -> {order "priority" }, dependent: :destroy
end
