# frozen_string_literal: true

module Resolvers
  # ResolverのBaseクラス
  class BaseResolver < GraphQL::Schema::Resolver
    include GraphqlClassUtil
    # include GraphqlAuthentication
    # include GraphqlLogging
    # include ClassParameter

    # parameter :db_role, default: :reading

    class << self
      def field_name
        @field_name ||= name.split('::')
                            .last
                            .gsub('Resolver', '')
                            .underscore
                            .to_sym
      end
    end

    # Resolverはレプリカに接続するようにする
    # def authorized?(**_args)
    #   if replica?
    #     ActiveRecord::Base.connected_to(role: :reading) do
    #       super
    #     end
    #   else
    #     super
    #   end
    # end

    # def perform(**args)
    #   if replica?
    #     ActiveRecord::Base.connected_to(role: :reading) do
    #       super
    #     end
    #   else
    #     super
    #   end
    # end

    # # 接続先がレプリカにするか判定する
    # def replica?
    #   return false if RequestStore[:primary]

    #   self.class.db_role == :reading
    # end
  end
end
