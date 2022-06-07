# frozen_string_literal: true

module Types
  module Objects
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :nickname, String, null: false
      field :uuid, ID, null: false
      field :signup_at, GraphQL::Types::ISO8601DateTime, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
