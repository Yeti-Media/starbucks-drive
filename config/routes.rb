StarbucksDrive::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.


  match '/tweets' , to: 'tweets#save_tweet'
  match '/test', to: 'welcome#test'
 
 
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
