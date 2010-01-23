ActionController::Routing::Routes.draw do |map|
  map.resources :questions, :as => 'reports' do |question|
    question.resources :votes
    question.resources :answers, :as => 'responses' do |answer|
      answer.resources :votes
    end
  end
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.resources :sessions
  map.resources :users
  map.root :controller => "questions", :action => "index"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end