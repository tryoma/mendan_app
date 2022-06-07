class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects, comment: 'プロジェクトを管理するテーブル' do |t|
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーID'
      t.string :name, null: false, comment: '案件名'
      t.text :message, null: false, comment: '概要'
      t.string :agent, null: false, comment: 'エージェント'
      t.integer :unit_price, null: true, comment: '単価'
      t.datetime :start_at, null: false, comment: '活動開始日'
      t.datetime :end_at, null: true, comment: '活動終了日'
      t.integer :status, default: 1, null: false, comment: 'ステータス'
      t.boolean :public_flag, default: false, null: false, comment: '公開フラグ'

      t.timestamps
    end
  end
end
