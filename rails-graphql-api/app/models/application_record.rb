# frozen_string_literal: true

# ActiveRecordの共通処理
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
