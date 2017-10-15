class Genre
	include HTTParty

	key_value = "35d2dc2f27ea1b822e51dfa3b27486f6";

	base_uri "http://api.themoviedb.org"
	default_params api_key: key_value, language: "en-US"
	format :json

	def self.for()
		@genres = get("/3/genre/movie/list", query: {})["genres"]
	end

	def self.getGenreId(genre)
		genres_array = self.for()
		genres_liste = {}
		genres_array.each { |g| genres_liste[g["name"]] = g["id"]}
		return genres_liste[genre]
	end

	def self.getIDtoGenre()
		id_to_genre = {}
		@genres.each { |g| id_to_genre[g["id"]] = g["name"]}
		return id_to_genre
	end

end