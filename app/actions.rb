=begin
get '/' do
    File.read(File.join('app/views','index.html'))
end


get '/' do
    "Hello world!"
end

=end


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

    finstagram_post_avatar_airb = {
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

    finstagram_post_whale = {
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

    finstagram_post_marlin = {
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

    [finstagram_post_avatar_airb, finstagram_post_whale, finstagram_post_marlin].to_s

end