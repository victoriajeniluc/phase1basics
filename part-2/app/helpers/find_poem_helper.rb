helpers do
  def find_and_ensure_poem(id)
    poem = Poem.find_by(id: id)
    halt(404, erb(:"404")) if poem.nil?
    poem
  end
end
