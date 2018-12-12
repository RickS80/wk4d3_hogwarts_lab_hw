require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/hogwarts/students' do
  @students = Student.all()
  @houses = House.all()
  erb(:index)
end
# new
get '/hogwarts/students/new' do  # new
  erb( :new )
end

# show
get '/hogwarts/students/:id' do
  @student = Student.find( params[:id] )
  erb( :show )
end

# create
post '/hogwarts/students' do # create
  @student = Student.new( params )
  @student.save()
  erb( :create )
end
# edit
get '/hogwarts/students/:id/edit' do # edit
  @student = Student.find( params[:id] )
  erb( :edit )
end
# update
post '/hogwarts/students/:id' do # update
  Student.new( params ).update
  redirect to '/hogwarts/students'
end

# destroy
post '/hogwarts/students/:id/delete' do # delete
  student = Student.find( params[:id] )
  student.delete()
  redirect to '/hogwarts/students'
end
