class ProgramLeader < User
  has_many :available_schedule, foreign_key: "program_leader_id", dependent: :destroy
  
  def admin?
    false
  end
  
  def program_leader?
    true
  end
  
  def program_organizer?
    false 
  end

end