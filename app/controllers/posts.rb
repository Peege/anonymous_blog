
get '/post' do
  # Goes to a page where you can write a post
  erb :create_post
end

# puts "Create new post"
post '/post/create' do

  @post = Post.create(title: params[:post][:title],content:params[:post][:content],author:params[:post][:author])
  params[:tag][:name].split(", ").each do |tag|
    @tag = Tag.find_or_create_by_name(tag)
    @post.tags << @tag
    @post.save
  end

  erb :success
end

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



