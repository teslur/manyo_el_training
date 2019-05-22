# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  priority    :integer          not null
#  status      :integer          default("not_yet_started"), not null
#  name        :string(255)      not null
#  description :text(65535)
#  limit_date  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tasks_on_limit_date  (limit_date)
#  index_tasks_on_priority    (priority)
#  index_tasks_on_status      (status)
#

class Task < ApplicationRecord
  has_many :labels

  validates :priority, presence: true, numericality: true
  validates :status, presence: true
  validates :name, presence: true

  enum status: { not_yet_started: 0, processing: 1, finished: 9 }
end
