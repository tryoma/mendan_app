class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews, comment: 'プロジェクトのインタビューを管理するテーブル' do |t|
      t.references :project, null: false, foreign_key: true, comment: 'プロジェクトID'
      t.date :recorded_on, null: false, comment: '面談日'
      t.datetime :started_at, null: false, comment: '開始時間'
      t.datetime :end_at, null: true, comment: '終了時間'
      t.string :location_url, null: false, comment: '面談場所URL'
      t.string :interviewer_name, null: false, comment: '面談相手の名前'
      t.string :interviewer_tel, null: true, comment: '面談相手の電話番号'
      t.integer :status, default: 1, comment: 'ステータス'
      t.boolean :complete_flag, default: false, null: false, comment: '公開フラグ'

      t.timestamps
    end
  end
end
