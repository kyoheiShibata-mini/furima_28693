class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string    :name          , null: false
      t.integer   :price         , null: false
      t.string    :explain       , null: false
      t.references   :user       , foreign_key: true

      t.integer   :category_id   , null: false
      t.integer   :state_id      , null: false
      t.integer   :fee_id        , null: false
      t.integer   :place_id      , null: false
      t.integer   :dispatch_id   , null: false
      
      t.timestamps
    end
  end
end
