Rails.application.routes.draw do
  root 'wx#index'
  get 'wx/:id/recieve', to: 'wx#recieve'
  post "/graphql", to: "graphql#execute"
end
