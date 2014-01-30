Eatmuch::Application.routes.draw do

  get '/add_review/:restaurant_id', :to => "review#edit", :as => 'add_edit_review'
  get '/restaurant_suggestions', :to => "restaurants#restaurant_suggestions", :as => 'restaurant_suggestions'
  post '/update/:restaurant_id', :to => "review#update", :as => 'update_review'
  devise_for :users
  resources :restaurants
  root :to => "restaurants#index"
end
