Rails.application.routes.draw do
  resources :artists do
    resources :songs, module: :artists
  end

  resources :songs
end
