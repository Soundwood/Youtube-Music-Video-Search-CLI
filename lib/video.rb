class Video
    attr_accessor :response, :index, :id, :title
    @@all = []

    def initialize(youtube_api_response, rank)
        @response = youtube_api_response
        @index = rank - 1
        @id = @response["items"][@index]["id"]["videoId"]
        @title = @response["items"][@index]["snippet"]["title"]
        @@all << self
    end
    def url_address
        url_address = "https://www.youtube.com/watch?v=" + @id
    end
end