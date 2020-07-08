class Cli
    @@all = []
    def initialize
        @@all << self
        welcome_screen
        main_menu
    end
    def welcome_screen
        puts "Welcome to the Music Video Finder!"
        puts ""
    end
    def main_menu
        puts "What would you like to do? (Type 1-4)"
        puts "1. Search for a Music Video by Artist and Song Title"
        puts "2. Info on the current Top Ranked Music Video"
        puts "3. List of Currently Live Music Events"
        puts "4. Exit Program"
        user_input = nil
        user_input = gets.chomp
        case user_input
        when "1"
            video_search
        when "2"
            top_ranked
        when "3"
            current_live
        when "4"
            puts ""
            puts "Goodbye!"
        else
            system("clear")
            puts "You entered #{user_input}"
            puts "I'm sorry. I don't know that command. Please make another selection."
            puts ""
            main_menu 
        end
    end
    def video_search
        search_artist = nil
        search_song_title = nil
        puts "Enter the artist name."
        search_artist = gets.chomp
        puts "Enter the song name."
        search_song_title = gets.chomp
        api_query = YoutubeAPI.new
        api_query.search_request(search_artist, search_song_title)
        video_info = Video.new(api_query.response, 1)
        system("clear")
        puts "The top rated title for your search is: #{video_info.title}"
        puts "The top rated Video ID for your search is: #{video_info.id}"
        puts "Video Link: #{video_info.url_address}"
        puts ""
        main_menu
    end
    def top_ranked
        system("clear")
        top_rank = YoutubeAPI.new
        top_rank.top_rank_request
        count = 0
        puts "The following are the top ranked music videos right now!"
        while count < 3
            video_info = Video.new(top_rank.response, count)
            puts "#{count+1}. #{video_info.title}"
            puts video_info.url_address
            count += 1
        end

        # numberone_title = top_rank.response["items"][0]["snippet"]["title"]
        # numberone_url = "https://www.youtube.com/watch?v=" + top_rank.response["items"][0]["id"]["videoId"]
        # numbertwo_title = top_rank.response["items"][1]["snippet"]["title"]
        # numbertwo_url = "https://www.youtube.com/watch?v=" + top_rank.response["items"][1]["id"]["videoId"]
        # numberthree_title = top_rank.response["items"][2]["snippet"]["title"]
        # numberthree_url = "https://www.youtube.com/watch?v=" + top_rank.response["items"][2]["id"]["videoId"]
        # puts "The following are the top ranked music videos right now!"
        # puts "1. #{numberone_title}"
        # puts numberone_url
        # puts "2. #{numbertwo_title}"
        # puts numbertwo_url
        # puts "3. #{numberthree_title}"
        # puts numberthree_url
        puts ""
        main_menu
    end
    def current_live
        system("clear")
        current_live = YoutubeAPI.new
        current_live.live_music_search
        count = 0
        puts "The following are the top ranked live music streams right now!"
        while count < 3
            video_info = Video.new(current_live.response, count)
            puts "#{count+1}. #{video_info.title}"
            puts video_info.url_address
            count += 1
        end
        # numberone_title = current_live.response["items"][0]["snippet"]["title"]
        # numberone_url = "https://www.youtube.com/watch?v=" + current_live.response["items"][0]["id"]["videoId"]
        # numbertwo_title = current_live.response["items"][1]["snippet"]["title"]
        # numbertwo_url = "https://www.youtube.com/watch?v=" + current_live.response["items"][1]["id"]["videoId"]
        # numberthree_title = current_live.response["items"][2]["snippet"]["title"]
        # numberthree_url = "https://www.youtube.com/watch?v=" + current_live.response["items"][2]["id"]["videoId"]
        # puts "The following are the top ranked live music streams right now!"
        # puts "1. #{numberone_title}"
        # puts numberone_url
        # puts "2. #{numbertwo_title}"
        # puts numbertwo_url
        # puts "3. #{numberthree_title}"
        # puts numberthree_url
        puts ""
        main_menu
    end
end
