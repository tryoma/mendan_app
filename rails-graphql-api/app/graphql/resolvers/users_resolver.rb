# frozen_string_literal: true

module Resolvers
  # 会社コードの会社契約情報を返す
  class UsersResolver < Resolvers::BaseResolver
    description <<-DESC
      アバター情報を返却します。
    DESC

    # 認可を無効化
    # disable_authentication

    type [Types::Objects::UserType], null: true

    def resolve
      User.all
    end
  end
end
