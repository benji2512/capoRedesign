require 'stripe'
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

# This is your real test secret API key.
Stripe.api_key = 'sk_test_51HXRUPJQBIZrH8yyQLsDsjFYctrNHRftaBIeEs4UQ6rnM5OY0jRTX5AaYSPlFEmAM5tI1ag3NFiHFCkqFfhwSNm800IbjU851m'
set :static, true
set :port, ENV['PORT']

YOUR_DOMAIN = "http://capo-redesign.herokuapp.com:#{ENV['PORT']}"

post '/create-checkout-session-white' do
    content_type 'application/json'
    session = Stripe::Checkout::Session.create({
      line_items: [{
        # TODO: replace this with the `price` of the product you want to sell
        price: 'price_1Ji6QvJQBIZrH8yyJaNdcwdv',
        quantity: 1,
      }],
      shipping_rates: ["shr_1Ji6ZPJQBIZrH8yy6UABTSvF"],
      shipping_address_collection: {
        allowed_countries: ['GB'],
      },
      payment_method_types: [
        'card',
      ],
      mode: 'payment',
      success_url: YOUR_DOMAIN + '/success',
      cancel_url: YOUR_DOMAIN + '/cancel',
    })
    redirect session.url, 303
  end

post '/create-checkout-session-charcoal' do
  content_type 'application/json'
  session = Stripe::Checkout::Session.create({
    line_items: [{
      # TODO: replace this with the `price` of the product you want to sell
      price: 'price_1Ji6XIJQBIZrH8yyWiu2ObD0',
      quantity: 2,
    }],
    shipping_rates: ["shr_1Ji6ZPJQBIZrH8yy6UABTSvF"],
    shipping_address_collection: {
      allowed_countries: ['GB'],
    },
    payment_method_types: [
      'card',
    ],
    mode: 'payment',
    success_url: YOUR_DOMAIN + '/success',
    cancel_url: YOUR_DOMAIN + '/cancel',
  })
  redirect session.url, 303
end