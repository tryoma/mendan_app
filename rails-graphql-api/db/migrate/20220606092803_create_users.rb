class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, comment: 'ユーザーを管理するテーブル' do |t|
      t.string :nickname, null: false, comment: 'ニックネーム'
      t.string :uuid, null: false, comment: 'UUID'
      t.datetime :signup_at, null: false, comment: 'サインアップ日'

      t.timestamps
    end
  end
end
