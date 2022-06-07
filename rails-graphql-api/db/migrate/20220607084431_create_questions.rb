class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions, comment: 'プロジェクトのインタビューでの質問を管理するテーブル' do |t|
      t.references :interview, null: false, foreign_key: true, comment: 'インタビューID'
      t.text :question_text, null: false, comment: '質問内容'
      t.text :answer_text, null: false, comment: '回答内容'
      t.integer :reaction, null: true, comment: '反応'
      t.boolean :complete_flag, default: false, null: false, comment: '公開フラグ'

      t.timestamps
    end
  end
end
