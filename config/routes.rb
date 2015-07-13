Rails.application.routes.draw do

  resources :people
  root 'people#index'
  get 'people-backend' => 'people#backend_index', :as => "backend_people_index"
  post '/ajax_upload_person_attributes' => 'person_attributes#upload_columns', :as => "upload_person_attributes"

end
