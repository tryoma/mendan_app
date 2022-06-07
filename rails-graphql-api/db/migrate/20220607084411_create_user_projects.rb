class CreateUserProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :user_projects, comment: 'ユーザーの参画プロジェクトを管理するテーブル' do |t|
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーID'
      t.references :project, null: false, foreign_key: true, comment: 'プロジェクトID'
      t.datetime :started_at, null: false, comment: '開始日'
      t.datetime :end_at, null: true, comment: '終了日'

      t.timestamps
    end
  end
end
