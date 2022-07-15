require 'stripe'
require 'sinatra'
require 'dotenv/load'
Dotenv.load

Stripe.api_key = 'sk_test_51HPnx0JZLfRwV14ivP3ggMyhM7YV739scvSZhQyxQCSd6DAbsg091yq5woBhs8OIqr3tZcDFGH9b2DP7ZYrL46Pf00V8hCcYe0'
# Stripe::Price.list(active: true)
# tshirt_price = Stripe::Price.retrieve(ENV['TSHIRT_PRICE'])
# hoodie_price = Stripe::Price.retrieve(ENV['HOODIE_PRICE'])
# puts tshirt_price
# puts hoodie_price

# tee_price = "%0.2f" % (tshirt_price["unit_amount_decimal"].to_i.to_f/100)
# hood_price = "%0.2f" % (hoodie_price["unit_amount_decimal"].to_i.to_f/100)
# currency = tshirt_price["currency"]

set :static, true

set :public_folder, File.join(File.dirname(__FILE__), ENV['STATIC_DIR'])
set :port, 4243

YOUR_DOMAIN = 'http://localhost:4243'

# get '/config' do
#   content_type 'application/json'
#   tshirt_price = Stripe::Price.retrieve(ENV['TSHIRT_PRICE'])

#   {
#     publicKey: ENV['STRIPE_PUBLISHABLE_KEY'],
#     unitAmount: price['unit_amount'],
#     currency: price['currency']
#   }.to_json
#   puts tshirt_price
# end

# Fetch the Checkout Session to display the JSON result on the success page
# get '/checkout-session' do
#   content_type 'application/json'
#   session_id = params[:sessionId]

#   session = Stripe::Checkout::Session.retrieve(session_id)
#   session.to_json
# end

# post '/create-checkout-session' do
#   content_type 'application/json'

#   session = Stripe::Checkout::Session.create({
#     line_items: [{
#       # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
#       price: ENV['TSHIRT_PRICE'],
#       quantity: 1,
#     }],
#     mode: 'payment',
#     success_url: YOUR_DOMAIN + '/success.html',
#     cancel_url: YOUR_DOMAIN + '/cancel.html',
#   })
#   redirect session.url, 303
# end

# post '/webhook' do
#   # You can use webhooks to receive information about asynchronous payment events.
#   # For more about our webhook events check out https://stripe.com/docs/webhooks.
#   webhook_secret = ENV['STRIPE_WEBHOOK_SECRET']
#   payload = request.body.read
#   if !webhook_secret.empty?
#     # Retrieve the event by verifying the signature using the raw body and secret if webhook signing is configured.
#     sig_header = request.env['HTTP_STRIPE_SIGNATURE']
#     event = nil

#     begin
#       event = Stripe::Webhook.construct_event(
#         payload, sig_header, webhook_secret
#       )
#     rescue JSON::ParserError => e
#       # Invalid payload
#       status 400
#       return
#     rescue Stripe::SignatureVerificationError => e
#       # Invalid signature
#       puts '⚠️  Webhook signature verification failed.'
#       status 400
#       return
#     end
#   else
#     data = JSON.parse(payload, symbolize_names: true)
#     event = Stripe::Event.construct_from(data)
#   end
#   # Get the type of webhook event sent - used to check the status of PaymentIntents.
#   event_type = event['type']
#   data = event['data']
#   data_object = data['object']

#   puts '🔔  Payment succeeded!' if event_type == 'checkout.session.completed'

#   content_type 'application/json'
#   {
#     status: 'success'
#   }.to_json
# end

get "/" do
  erb :index
end

get "/store" do
  # erb :store, :locals => {:tshirtPrice => tee_price, :hoodiePrice => hood_price}
  erb :storeshoprocket
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