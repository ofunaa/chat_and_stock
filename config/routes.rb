Rails.application.routes.draw do
  root    'top#index'
  post    'post'         =>  'top#create'
  get     'new'          =>  'top#new'
  post    'new/post'     =>  'top#new_tag'
  post    'tag'          =>  'top#tag'
  get     'tag_delete'   =>  'top#tag_delete'
  post    'users_name'   =>  'top#users_name'
  get 	  'all' 		=>	'top#all'
  post 	  'all_post' 		=>	'top#all_post'
  delete  'all_delete'     => 'top#all_delete'


  get     'takahiro'   =>    'top#takahiro'
  post    'takahiro/post'    =>  'top#takahiro_create'
  
end
