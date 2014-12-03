post '/searchtag' do
  # @tag = Tag.find(params[:name])
  @tags = Tag.where(name: params[:name]).first.id
  p @tags


  erb :posts_tags
end