require './bond_data.rb'
  # requiring a local file

# puts Bond::MOVIE_DATA
  # accessing the array inside the module

# puts Bond::MOVIE_DATA[0]
  #=> {:title=>"Skyfall", :year=>2012, :actor=>"Daniel Craig", :gross=>"$1,108,561,008"}

# puts Bond:: MOVIE_DATA.first
  #=> {:title=>"Skyfall", :year=>2012, :actor=>"Daniel Craig", :gross=>"$1,108,561,008"}

# puts Bond::MOVIE_DATA.first[:title]
  #=> Skyfall

def get_gross_for(title, movies)
  movie = movies.find { |movie| movie[:title] == title }
    # everything returns something
  parse_gross movie[:gross]
    # the last line is implicitly returned
end
puts get_gross_for('Skyfall', Bond::MOVIE_DATA) #=> $1,108,561,008
# puts get_gross_for('Goldeneye', Bond::MOVIE_DATA) #=> $529,548,711

def gross_sum(gross)
  gross.gsub(/[$,]/, '').to_f
end

def bond_names(movies)
  movies.map { |movie| movie[:actor] }.uniq
end

def get_odd(movies)
  movies.select { |movie| movie[:year].odd? }
end

def worst_grossing(movies)
  movies.min { |a, b| parse_gross(a[:gross]) <=> parse_gross(b[:gross])}
end

def movies_per_actor(movies)
  groups = movies.group_by { |movie| movie[:actor] }
  groups.each { |key, value| groups[key] = value.count }
end

def movies_sorted(movies)
  movies.sort { |a, b| a[:year] }
end

