module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :input, Types::UserAttributes, required: true

    field :success, Boolean, null: false
    field :errors, String, null: false

    def resolve(input:)
      user = User.new(input.to_h)
      if user.save
        {
          success: true,
          errors: ""
        }
      else
        {
          success: false,
          errors: user.errors.messages.to_json.to_s
        }
      end
    end
  end
end