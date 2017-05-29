# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

get '/students/campus' do
  erb :search_by_campus
end

get '/students/results' do
  erb :search_results
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# view students by 
# campus
post '/students/campus' do
  @searched_campus = db.execute("SELECT * FROM students WHERE campus=?", [params['campus']])
  erb :search_results
end

# add static resources