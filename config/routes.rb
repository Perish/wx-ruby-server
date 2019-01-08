Rails.application.routes.draw do
  get 'wx/:id/recieve', to: 'wx#recieve'
  post "/graphql", to: "graphql#execute"
end
