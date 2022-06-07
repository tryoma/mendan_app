# frozen_string_literal: true

# Resolvers下を先に読み込む
Dir.glob(Rails.root.join('app', 'graphql', 'resolvers', '*.rb')).each do |f|
  require f
end

# GraphQLのQueryを定義するクラス
class QueryType < Types::BaseObject
  include GraphqlClassUtil

  description 'GreenPontaActionのGraphQLのQueryの一覧'

  # Queryの登録
  Resolvers::BaseResolver.latest_subclasses.each do |klass|
    field klass.field_name, resolver: klass, description: klass.description
  end
end
