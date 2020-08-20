class CreateBuyLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_logs do |t|

      t.timestamps
    end
  end
end
