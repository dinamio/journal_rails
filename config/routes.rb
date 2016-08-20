Rails.application.routes.draw do
  
  #get 'journal/index'
  get '/parents' => "parents#index", as: :parents
  get '/parents/:subject_id' => "parents#show", as: :parents_subject
  resources :subjects
  resources :class_journal do
    resources :lessons
    get '/journal_details' => 'class_journal#journal_table', as: :table
    post '/journal_details' => 'class_journal#journal_change', as: :table_change
  end


  #get '/journal' => 'journal#index', as: :journal
  #get '/journal_details' => 'journal#details', as: :journal_details
  resources :forms do
    resources :pupils
    get '/subjects' => 'forms#edit_subjects', as: :edit_subjects
    patch 'subjects' => 'forms#save_subjects', as: :update_subjects
  end
  get 'welcome/index'
  

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
