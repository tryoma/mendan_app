class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos, comment: 'プロジェクトのTODOを管理するテーブル' do |t|
      t.references :project, null: false, foreign_key: true, comment: 'プロジェクトID'
      t.string :todo_text, null: false, comment: 'TODO内容'
      t.text :note, null: true, comment: '詳細'
      t.datetime :time_limit, null: false, comment: '期限日'
      t.boolean :complete_flag, default: false, null: false, comment: '完了フラグ'

      t.timestamps
    end
  end
end
