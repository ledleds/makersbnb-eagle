class MakersBnB < Sinatra::Base

  get '/hosts' do
    erb :list_space
  end

  post '/submit-listing' do
    @space = Space.create(title: params[:title],
                        description: params[:description],
                        price: params[:price],
                        date_from: params[:date_from],
                        date_to: params[:date_to],
                        user_id: current_user.id)
                        p current_user

    p @space.date_from
    p @space.date_to
    redirect '/confirmation'
  end

  get '/confirmation' do
    erb :confirmation
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  # get '/request' do
  #   erb :request
  # end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    erb :space
  end

end
