# frozen_string_literal: true

# Mutations下を先に読み込む
Dir.glob(Rails.root.join('app', 'graphql', 'mutations', '*.rb')).each do |f|
  require f
end

# Mutationを定義するクラス
class MutationType < Types::BaseObject
  description 'GreenPontaActionのGraphQLのMutationの一覧'

  # Mutationの登録
  Mutations::BaseMutation.latest_subclasses.each do |klass|
    field klass.field_name, mutation: klass, description: klass.description
  end
end
