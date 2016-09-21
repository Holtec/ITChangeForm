Rails.application.routes.draw do
  default_url_options :host => ENV['MACURL']
  root 'home#index'
  match 'mac', to: 'mac#index', via: 'get', as: 'mac_index'
  match 'mymac', to: 'mac#personal', via: 'get', as: 'personal_mac_index'
  match 'mac/new', to: 'mac#new', via: 'get', as: 'new_mac'
  match 'mac/create', to: 'mac#create', via: 'post', as: 'create_mac'
  match 'mac/:id', to: 'mac#details', via: 'get', as: 'mac_details'
  match 'mac/:id/edit', to: 'mac#edit', via: 'get', as: 'edit_mac'
  match 'mac/:id/approve', to: 'mac#approve', via: 'get', as: 'approve_mac'
  match 'mac/:id/deny', to: 'mac#deny', via: 'post', as: 'deny_mac'
  match 'mac/:id/change', to: 'mac#change', via: 'patch', as: 'change_mac'
  match 'mac/:id/delete', to: 'mac#delete', via: 'delete', as: 'delete_mac'
  match 'mac/:id/comment', to: 'mac#createcomment', via: 'post', as: 'create_comment'
  match 'mac/:id/succeeded', to: 'mac#succeeded', via: 'post', as: 'succeeded_mac'
  match 'mac/:id/failed', to: 'mac#failed', via: 'post', as: 'failed_mac'
  match 'api', to: 'mac#api', via: 'get', as: 'mac_api'
  match 'mac/myapi', to: 'mac#personal_api', via: 'post', as: 'personal_mac_api'
  match 'analytics', to: 'analytics#index', via: 'get', as: 'analytics'
  match 'email', to: 'home#email', via: 'get', as: 'add_email'
  match 'email', to: 'home#emailsave', via: 'post', as: 'save_email'
end