
helpers do
    def current_user
        User.find_by(id: session[:user_id])
    end
end

get '/' do
   
    @finstagram_posts = FinstagramPost.order(created_at: :desc)
    erb(:index)

end

get '/login' do

    erb(:login)

end

post '/login' do

    username = params[:username]
    password = params[:password]

    @user = User.find_by(username: username)

    if @user && @user.password == password
        session[:user_id] = @user.id
        redirect to('/')
    else
        @error_message = "Uh oh. Login failed. Try again"
        erb(:login)
    end

end

get '/logout' do

    session[:user_id] = nil
    redirect to('/')
end

get '/signup' do
    @user = User.new
    erb(:signup)

end

post '/signup' do

    email = params[:email]
    avatar_url = params[:avatar_url]
    username = params[:username]
    password = params[:password]



    @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
    
    if @user.save

        redirect to('/login') 
    else    
        erb(:signup)
    end

end


=begin
get '/' do
    File.read(File.join('app/views','index.html'))
end


get '/' do
    "Hello world!"
end




def humanized_time_ago (minutes_var)
    if minutes_var == 60
        "an hour ago"
    elsif minutes_var > 60
        "#{minutes_var/60} hours ago"
    else
        "#{minutes_var} minutes ago"
    end
end         


get '/' do

    @finstagram_post_avatar_airb = {
        user_name: "avatar_airb",
        avatar_url: "http://naserca.com/images/sharky_j.jpg",
        photo_url: "http://naserca.com/images/shark.png",
        #time_ago_in_minutes: 15,
        humanized_time_ago: humanized_time_ago(15),
        like_count: 0,
        comment_count: 1,
        # comments: [
        #     "avatar_airb: Out for the day...In Lighthouse Labs Training"
        # ]  
        comments: [{
            username: "avatar_airb",
            comment_text: "Out for the day...In Lighthouse Labs Training"
        }]
    }

    @finstagram_post_whale = {
        user_name: "kirk_whalum",
        avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
        photo_url: "http://naserca.com/images/whale.jpg",
        #time_ago_in_minutes: 15,
        humanized_time_ago: humanized_time_ago(65),
        like_count: 0,
        comment_count: 1,
        comments: [{
            username: "kirk_whalum",
            comment_text: "#weekendvibes"
        }]
    }

    @finstagram_post_marlin = {
        user_name: "marlin_peppa",
        avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
        photo_url: "http://naserca.com/images/marlin.jpg",
        #time_ago_in_minutes: 15,
        humanized_time_ago: humanized_time_ago(190),
        like_count: 0,
        comment_count: 1,
        comments: [{
            username: "marlin_peppa",
            comment_text: "lunchtime! :D"
        }]
    }


    @finstagram_posts = [@finstagram_post_avatar_airb, @finstagram_post_whale, @finstagram_post_marlin]

    erb(:index)
end

=end

