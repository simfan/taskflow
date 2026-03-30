class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true

  enum :status, { todo: 0, in_progress: 1, done: 2 }

  validates :title, presence: true
end
