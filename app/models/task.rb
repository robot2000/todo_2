class Task < ActiveRecord::Base
  validates :title, :project_id, presence: true

   after_create do
    self.update(priority: self.project.tasks.count - 1 )
  end

  belongs_to :project
end
