require 'sinatra'

get "/" do
    erb :index
end

get "/store" do
    erb :store
end

get "/gallery" do
    erb :gallery
end

get "/faq" do
    erb :faq
end

get "/about" do
    erb :about
end

get "/success" do
    erb :success
end

get "/cancel" do
    erb :cancel
end
