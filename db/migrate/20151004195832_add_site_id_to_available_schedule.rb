class AddSiteIdToAvailableSchedule < ActiveRecord::Migration
  def change
  	add_column :available_schedules, :site_id, :integer
  end
end
