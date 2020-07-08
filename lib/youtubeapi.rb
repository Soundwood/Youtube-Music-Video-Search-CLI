class YoutubeAPI
    API_KEY = ENV["YOUTUBE_API_KEY"]
    YOUTUBESEARCHURL1 = 'https://www.googleapis.com/youtube/v3/search?part=snippet'
    YOUTUBESEARCHURL2 = '&safeSearch=none&type=video&key='
    YOUTUBETOP_URL = 'https://www.googleapis.com/youtube/v3/search?part=snippet&order=rating&q=music%20video&safeSearch=none&type=video&videoDuration=short&key='
    YOUTUBELIVE_URL = 'https://www.googleapis.com/youtube/v3/search?part=snippet&eventType=live&order=rating&q=music&safeSearch=none&type=video&key='
    @@all = []
    attr_accessor :artist, :song_name, :response
    def initialize
        @@all << self
        @response = nil
    end 
    def search_request(artist, song_name)
        binding.pry
        @artist = artist
        @song_name = song_name
        injection_string = "&q=#{@artist}" + "%20" +"#{@song_name}" + "%20music%20video"
        #binding.pry
        injected_url = YOUTUBESEARCHURL1 + injection_string + YOUTUBESEARCHURL2 + API_KEY
        @response = HTTParty.get(injected_url)
    end
    def top_rank_request
        concat_url = YOUTUBETOP_URL + API_KEY
        @response = HTTParty.get(concat_url)
    end
    def live_music_search
        concat_url = YOUTUBELIVE_URL + API_KEY
        @response = HTTParty.get(concat_url)
    end
end
