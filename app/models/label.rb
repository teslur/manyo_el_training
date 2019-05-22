# == Schema Information
#
# Table name: labels
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  task_id    :bigint           not null
#
# Indexes
#
#  index_labels_on_task_id  (task_id)
#

class Label < ApplicationRecord
  belongs_to :task

  validates :name, presence: true
  validates :name, uniqueness: { scope: :task_id }
end
