class CreateDispatches < ActiveRecord::Migration[6.0]
  def change
    create_table :dispatches do |t|

      t.timestamps
    end
  end
end
