class Admin < User

  def admin?
    true
  end
  
  def program_leader?
    false
  end
  
  def program_organizer?
    false 
  end

end