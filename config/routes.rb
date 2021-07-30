Rails.application.routes.draw do
  get 'health_interviews/index'
  get 'health_interviews/new'
  get 'health_interviews/show'
  get 'health_interviews/edit'
  get 'health_interviews/_each_list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
