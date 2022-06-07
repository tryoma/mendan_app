# frozen_string_literal: true

# GraphQLのクラス周りのUtil
module GraphqlClassUtil
  extend ActiveSupport::Concern

  # ClassMethod
  module ClassMethods
    def latest_subclasses
      search_type_classes(root_class: self)
    end

    def search_type_classes(root_class:, ary: [])
      subclasses = root_class.subclasses

      if subclasses.blank?
        ary << root_class
        return ary
      end

      subclasses.each do |klass|
        search_type_classes(root_class: klass, ary: ary)
      end

      ary
    end
  end
end
