Rails.application.routes.draw do

  resources :mycometer_coc_samples
  resources :mycometer_cocs
  get 'xrf_cocs/reports/reload/:id' => 'xrf_cocs#reload', :as => :reload_reports
  resources :all_reports
  resources :lead_report_negs
  resources :lead_reports
  resources :spore_type_counts
  resources :tape_bulk_coc_samples
  resources :tape_bulk_cocs
  resources :xrf_coc_samples
  resources :xrf_cocs
  resources :jobsite_contacts do
    get :autocomplete_jobsite_contact_name, :on => :collection
  end
  resources :jobsites do
    get :autocomplete_jobsite_name, :on => :collection
  end
  resources :subcontractor_contacts do
    get :autocomplete_subcontractor_contact_name, :on => :collection
  end
  resources :subcontractors do
    get :autocomplete_subcontractor_name, :on => :collection
  end
  resources :company_contacts do 
    get :autocomplete_company_contact_name, :on => :collection
  end
  resources :companies do
    get :autocomplete_company_name, :on => :collection
  end
  resources :jobs
    
  # devise_for :users
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  root 'home#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
