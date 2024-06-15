Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  post("/update_user/:input_username", { :controller => "users", :action => "show" })
  post("/add_user", { :controller => "users", :action => "create" })
  
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete" })
  post("/add_photo", { :controller => "photos", :action => "create" })
end
