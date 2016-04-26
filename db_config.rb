require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'movie_database'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options)
