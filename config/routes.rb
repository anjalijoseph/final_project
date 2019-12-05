Rails.application.routes.draw do
  # Routes for the Hotel resource:

  # CREATE
  get("/hotels/new", { :controller => "hotels", :action => "new_form" })
  post("/create_hotel", { :controller => "hotels", :action => "create_row" })

  # READ
  get("/hotels", { :controller => "hotels", :action => "index" })
  get("/hotels/:id_to_display", { :controller => "hotels", :action => "show" })

  # UPDATE
  get("/hotels/:prefill_with_id/edit", { :controller => "hotels", :action => "edit_form" })
  post("/update_hotel/:id_to_modify", { :controller => "hotels", :action => "update_row" })

  # DELETE
  get("/delete_hotel/:id_to_remove", { :controller => "hotels", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
