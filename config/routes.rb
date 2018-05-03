Rails.application.routes.draw do

  # root
  root to: 'static_pages#home'

  # destroy as get requests
  get '/ponds/:id/destroy', to: 'ponds#destroy'
  get '/frogs/:id/destroy', to: 'frogs#destroy'

  # code your post to  '/tadpoles/:id/metamorphose' here
  # it should direct to the tadpoles controller, the metamorphose action
  post 'tadpoles/:id/metamorphose', to: 'tadpoles#metamorphose', as: "metamorphose"

  # resources
  resources :ponds

  resources :tadpoles, :only => [:index, :show, :new, :edit, :update, :destroy, :create]

  # nested resources
  resources :frogs do
    resources :tadpoles, :only => [:new]
  end
  get '/tadpoles/:id/destroy', to: 'tadpoles#destroy'


end
