class ProgramOrganizer < User


  def admin?
    false
  end
  
  def program_leader?
    false
  end
  
  def program_organizer?
    true 
  end

end
