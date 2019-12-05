Rails.application.routes.draw do
  root :to => "hotels#index"
  # Routes for the Restaurant review resource:

  # CREATE
  get("/restaurant_reviews/new", { :controller => "restaurant_reviews", :action => "new_form" })
  post("/create_restaurant_review", { :controller => "restaurant_reviews", :action => "create_row" })

  # READ
  get("/restaurant_reviews", { :controller => "restaurant_reviews", :action => "index" })
  get("/restaurant_reviews/:id_to_display", { :controller => "restaurant_reviews", :action => "show" })

  # UPDATE
  get("/restaurant_reviews/:prefill_with_id/edit", { :controller => "restaurant_reviews", :action => "edit_form" })
  post("/update_restaurant_review/:id_to_modify", { :controller => "restaurant_reviews", :action => "update_row" })

  # DELETE
  get("/delete_restaurant_review/:id_to_remove", { :controller => "restaurant_reviews", :action => "destroy_row" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  get("/restaurants/new", { :controller => "restaurants", :action => "new_form" })
  post("/create_restaurant", { :controller => "restaurants", :action => "create_row" })

  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  get("/restaurants/:id_to_display", { :controller => "restaurants", :action => "show" })

  # UPDATE
  get("/restaurants/:prefill_with_id/edit", { :controller => "restaurants", :action => "edit_form" })
  post("/update_restaurant/:id_to_modify", { :controller => "restaurants", :action => "update_row" })

  # DELETE
  get("/delete_restaurant/:id_to_remove", { :controller => "restaurants", :action => "destroy_row" })

  #------------------------------

  # Routes for the Hotel review resource:

  # CREATE
  get("/hotel_reviews/new", { :controller => "hotel_reviews", :action => "new_form" })
  post("/create_hotel_review", { :controller => "hotel_reviews", :action => "create_row" })

  # READ
  get("/hotel_reviews", { :controller => "hotel_reviews", :action => "index" })
  get("/hotel_reviews/:id_to_display", { :controller => "hotel_reviews", :action => "show" })

  # UPDATE
  get("/hotel_reviews/:prefill_with_id/edit", { :controller => "hotel_reviews", :action => "edit_form" })
  post("/update_hotel_review/:id_to_modify", { :controller => "hotel_reviews", :action => "update_row" })

  # DELETE
  get("/delete_hotel_review/:id_to_remove", { :controller => "hotel_reviews", :action => "destroy_row" })

  #------------------------------

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
