class AvailableSchedule < ActiveRecord::Base
	belongs_to :program_leader
	belongs_to :site
end
