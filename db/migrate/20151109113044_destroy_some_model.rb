class DestroySomeModel < ActiveRecord::Migration
  def change
    drop_table :some_models
  end
end
