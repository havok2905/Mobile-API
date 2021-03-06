MobileApi::Application.routes.draw do

  namespace :games do
    match 'game_by_location/:latitude/:longitude/:range', to: 'game#get_by_location', as: 'game_by_location', via: 'get'
    resources :game
  end


  namespace :checkpoints do
    match 'checkpoints_by_game/:game_id', to: 'checkpoint#get_checkpoints_by_game', as: 'checkpoints_by_game', via: 'get'
    match 'checkpoints_by_location/:latitude/:longitude', to: 'checkpoint#get_checkpoints_by_location', as: 'checkpoints_by_location', via: 'get'
    match 'possible_next_checkpoints/:id', to: 'checkpoint#get_possible_next_checkpoints', as: 'possible_next_checkpoints', via: 'get'
    match 'previous_checkpoint/:game_id', to: 'checkpoint#get_previous_checkpoint', as: 'previous_checkpoint', via: 'get'

    resources :checkpoint
    resources :checkpoint_association
    resources :checkpoint_condition
  end

  namespace :items do
    match 'weapons', to: 'item#weapons', as: 'weapons', via: 'get'
    match 'health', to: 'item#health', as: 'health', via: 'get'
    match 'stories', to: 'item#stories', as: 'stories', via: 'get'
    match 'create_child_item', to: 'item#create_child_item', as: 'create_child_item', via: 'post'
    resources :item
  end

  namespace :stories do
    resources :story
  end

end
