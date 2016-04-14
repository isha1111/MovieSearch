require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'movie_database',
  username: 'isha'
}

ActiveRecord::Base.establish_connection(options)
