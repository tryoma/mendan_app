# frozen_string_literal: true

module Mutations
  # graphql-rubyが生成した共通クラス
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    include GraphqlClassUtil
    # include GraphqlAuthentication
    # include GraphqlLogging

    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    class << self
      def field_name
        @field_name ||= name.split('::')
                            .last
                            .underscore
      end
    end

    # def perform(**args)
    #   # 認証が不要の場合は同期処理はしない
    #   if disable_authentication?
    #     # Transactionを貼る
    #     DailyScore.transaction do
    #       super
    #     end
    #   else
    #     # Unity側とWebview側でほぼ同時に更新がくるケースがあるので
    #     # その場合は処理を待ってから実行させる
    #     RedisSynchronizer.sync(current_user.id, interval: 0.1, timeout: 60 * 2) do
    #       DailyScore.transaction do
    #         super
    #       end
    #     end
    #   end
    # end
  end
end
