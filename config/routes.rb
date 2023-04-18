Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/forex", {:controller => "currency", :action => "first_currency"})
  get("/forex/:from_currency", {:controller => "currency", :action => "other_currency"})
  get("/forex/:from_currency/:to_currency", {:controller => "currency", :action => "convert_currency"})
end
