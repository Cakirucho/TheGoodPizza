Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Default homepage.
  get '/' => 'homepage#index', as: :homepage

  resources :pizzas, only: [:new, :create, :show, :update] do
    get :new, as: :new_pizza
  end

  resources :ingredients, only: [:new, :create] do
    get :new, as: :new_ingredient
  end

  resources :pizza_ingredients, only: [:update, :destroy]
end
