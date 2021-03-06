SecondApp::Application.routes.draw do



  resources :roles


  devise_for :users
  

  
  resources :sub_categories


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
 
#match '/events/other_sub_category' => "events#other_sub_category", :format => :js
  
match "/events/other_sub_category" => "events#other_sub_category"
#match "/events/delete_file" =>"events#delete_file"
  resources :events do
       member do         
         get 'download_file'
         get 'delete_file'
         get 'search'   
         get 'remind_users'     
       end
       # collection do
       #  get "/events/other_sub_category", :to => "events#other_sub_category"
       # end
  end
  resources :users do
    member do
      get 'delete_pic'
      get 'change_pic'
    end
  end

 


     resources :sub_categories do
      member do
        get 'list_events_for_category'

      end
    end


  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "sub_categories#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
