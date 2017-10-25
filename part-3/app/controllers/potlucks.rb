get '/potlucks' do
  @upcoming_potlucks = Potluck.order(:starts_at)
  @potlucks = @upcoming_potlucks.current_potlucks
  erb :'potlucks/index'
end

get '/potlucks/new' do
  authenticate!
  @potluck = Potluck.new
  erb :'potlucks/new'
end

post '/potlucks' do
  authenticate!
  @potluck = Potluck.new(params[:potluck])

  if @potluck.save
    current_user.potlucks << @potluck
    redirect "/potlucks/#{@potluck.id}"
  else
    @errors = @potluck.errors.full_messages
    erb :'potlucks/new'
  end
end

get '/potlucks/:id' do
  @message = params[:message]
  @potluck = find_and_ensure_potluck(params[:id])
  erb :'potlucks/show'
end

get '/potlucks/:id/edit' do
  authenticate!
  @potluck = find_and_ensure_potluck(params[:id])
  authorize!(@potluck.host)
  erb :'potlucks/edit'
end


put '/potlucks/:id' do
  authenticate!
  @potluck = find_and_ensure_potluck(params[:id])
  authorize!(@potluck.host)

  if @potluck.update(params[:potluck])
    redirect "/potlucks/#{@potluck.id}"
  else
    @errors = @potluck.errors.full_messages
    erb :'potlucks/edit'
  end
end

delete '/potlucks/:id' do
  authenticate!
  @potluck = find_and_ensure_potluck(params[:id])
  authorize!(@potluck.host)
  @potluck.destroy
  redirect '/'
end

post '/potlucks/:id/contributions' do
  authenticate!
  @potluck = find_and_ensure_potluck(params[:id])
  @signup = Contribution.new(food_item: params[:food_item].downcase, attendee: current_user, potluck: @potluck)

  if @signup.save
    @message = "You signed up to bring #{@signup.food_item}!"
    redirect "/potlucks/#{@potluck.id}?message=#{@message}"
  else
    @errors = @signup.errors.full_messages
    erb :'potlucks/show'
  end
end

