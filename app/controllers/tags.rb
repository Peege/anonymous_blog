get '/searchtag/:id' do
  # @tag = Tag.find(params[:name])
  @tag = Tag.find(params[:id])

  erb :post_tags
end

#search by tag and shows post page
post '/searchtag' do
  @tag = Tag.where(name: params[:name]).first

  erb :post_tags
end
