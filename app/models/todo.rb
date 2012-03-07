class Todo < ActiveRecord::Base
	belongs_to :user
	attr_accessible :title, :user_id, :content, :due_date, :complete, :icon, :fileset_id, :status

	validates :user_id, presence: true
	validates :due_date, presence: true
	validates :title, presence: true, length: { maximum: 100 }
	
	default_scope order: 'todos.created_at DESC'
end
