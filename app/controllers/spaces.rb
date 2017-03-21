class MakersBnB < Sinatra::Base

  get '/hosts' do
    erb :list_space
  end

  post '/submit-listing' do
    @space = Space.create(title: params[:title],
                        description: params[:description],
                        price: params[:price],
                        date_from: params[:date_from],
                        date_to: params[:date_to])
    redirect '/confirmation'
  end

  get '/confirmation' do
    erb :confirmation
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end


  # run! if app_file == $0
end
