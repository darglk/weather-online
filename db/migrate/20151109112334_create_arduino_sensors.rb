class CreateArduinoSensors < ActiveRecord::Migration
  def change
    create_table :arduino_sensors do |t|
      t.decimal :ground_humidity
      t.decimal :temperature
      t.integer :pressure
      t.decimal :nonrelative_asl
      t.decimal :relative_asl
      t.decimal :shakes
      t.boolean :israining
      t.decimal :air_humidity

      t.timestamps null: false
    end
  end
end
