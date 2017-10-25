helpers do
  def find_and_ensure_potluck(id)
    potluck = Potluck.find_by(id: id)
    halt(404, erb(:'404')) if potluck.nil?
    potluck
  end
end
