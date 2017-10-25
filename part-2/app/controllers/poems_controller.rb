get "/poems" do
  @poems = Poem.recent
  erb :"/poems/index"
end

post "/poems" do
  @poem = Poem.new(params[:poem])
  if request.xhr?
    if @poem.save
      status 200
      erb :"poems/_poem", layout: false, locals: {poem: @poem}
    else
      status 422
      @errors = @poem.errors.full_messages
      erb :"_errors", layout: false
    end
  else
    if @poem.save
        redirect "/poems/#{@poem.id}"
    else
      @errors = @poem.errors.values.flatten
      erb :"/poems/new"
    end
  end
end

put "/poems/:id/applauses" do
  @poem = find_and_ensure_poem(params[:id])
  @poem.increment!(:applauses)
  if request.xhr?
    status 200
    erb :"poems/_likes", layout: false, locals: {poem: @poem}
  else
    redirect "/poems/#{@poem.id}"
  end
end

get "/poems/new" do
  erb :"/poems/new"
end

get "/poems/:id" do
  @poem = Poem.find(params[:id])
  erb :"/poems/show"
end
