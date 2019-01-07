class CreateWxSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :wx_settings do |t|
      t.string :app_id
      t.string :app_secret
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
