
get '/post' do
  # Goes to a page where you can write a post
  erb :create_post
end

# puts "Create new post"
post '/post/create' do
  @posts = Post.create(title:params[:title],content:params[:content],author:params[:author])
  puts @posts
  # @tags = Tag.create(name: params[:name])
  # puts @tags

  erb :success
end

# #search by tag and shows post page
# post '/search' do
#   @post = Post.where(title: params[:title]).first

#   erb :show_post
# end


#shows post page
get '/posts/:id/show' do
  @post = Post.find(params[:id])

  erb :show_post
end

# delete
delete '/posts/:id/delete' do
  Post.find(params[:id]).destroy
  redirect to('/')
end

# edit
get '/posts/:id/edit' do
  @post = Post.find(params[:id])

  erb :edit
end

post '/posts/:id/update' do
  @post = Post.find(params[:id])
  @post.title = params[:title]
  @post.tags = params[:tags]
  @post.content = params[:content]
  @post.save
  erb :success
end



