MobileApi::Application.routes.draw do

  namespace :games do
    resources :game do
      get 'game_by_location/:latitude/:longitude/:range', to: 'games#get_by_location', as: 'game_by_location'
    end
  end


  namespace :checkpoints do
    resources :checkpoint do
    end

    resources :checkpoint_association do
    end

    resources :checkpoint_condition do
    end
  end


  namespace :stories do
    resources :story do
    end
  end

end
