get '/potlucks' do

  @upcoming_events = Potluck.order(:starts_at)
  @potlucks = @upcoming_events.only_current_potlucks

  erb :"potlucks/index"
end

get '/potlucks/new' do
  authenticate!
  @potluck = Potluck.new
  erb :"potlucks/new"
end

post '/potlucks' do
  authenticate!
  @potluck = Potluck.new(params[:potluck])

  if @potluck.save
    current_user.potlucks << @potluck
    redirect "/potlucks/#{@potluck.id}"
  else
    @errors = @potluck.errors.full_messages
    erb :"potlucks/new"
  end
end

get '/potlucks/:id' do
  @potluck = find_and_ensure_potluck(params[:id])
  erb :"potlucks/show"
end

get '/potlucks/:id/edit' do
  authenticate!
  @potluck = find_and_ensure_potluck(params[:id])
  authorize!(@potluck.host)
  erb :"potlucks/edit"
end


put '/potlucks/:id' do
  authenticate!
  @potluck = find_and_ensure_potluck(params[:id])
  authorize!(@potluck.host)

  if @potluck.update(params[:potluck])
    redirect "/potlucks/#{@potluck.id}"
  else
    @errors = @potluck.errors.full_messages
    erb :"potlucks/edit"
  end
end

delete '/potlucks/:id' do
  authenticate!
  @potluck = find_and_ensure_potluck(params[:id])
  authorize!(@potluck.host)
  @potluck.destroy
  redirect '/'
end

