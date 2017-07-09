Rails.application.routes.draw do

  resources :topics do
    resources :sponsored_posts, except: [:index]
    resources :posts, except: [:index]
  end
  
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
