module Types
  class ErrorType < Types::BaseObject
    field :key, String, null: true
    field :value, String, null: true
  end
end