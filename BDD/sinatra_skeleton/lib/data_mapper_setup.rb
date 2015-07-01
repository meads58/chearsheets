env = ENV["RACK_ENV"] || 'development'

require './models/user'

DataMapper.setup(:default, "postgres://postgres@localhost/fx_convert_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!