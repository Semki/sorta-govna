GovnoRf::Application.routes.draw do
  # TODO: Make all this shit more RESTful

  devise_for :users

  root :to => "main#index"

  resources :synonyms
  resources :shits

  get 'info/:shit_id' => 'info#shit_info', :as => :shit_info
  get 'synonyms/autocomplete_synonym_name' => 'synonyms#autocomplete_synonym_name'
  get "/topshit" => "main#topshit", :as => :topshit

  match 'shit_it' => 'main#shit_it', :as => 'shit_it'
  get "/shit_by_id" => "main#shit_by_id"

  match "/create_shit" => "main#create_shit", :as => :create_shit
  get "/compare" => "main#compare", :as => :compare
  get 'main/autocomplete_shit_name' => 'main#autocomplete_shit_name'
  get "timeline/index" => "timeline#index"
  get "timeline/show_by_shit/:shit_id" => "timeline#show_by_shit"
  get "timeline/show_by_shit_by_week/:shit_id" => "timeline#show_by_shit_by_week", :as => :week_timeline_by_shit
  get "timeline/weekrating" => "timeline#weekrating", :as => :weekrating

end
