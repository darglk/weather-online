class Api::ArduinoSensorsController < ApplicationController
  #include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json
  #before_action :authenticate_user!, only: [:create]
  def index
    respond_with ArduinoSensor.all
  end

  def show
    respond_with ArduinoSensor.find(params[:id])
  end

  def create
    arduino_sensor = ArduinoSensor.new(arduino_sensor_params)

    if arduino_sensor.save
      render json: arduino_sensor, status: 201, location: [:api, arduino_sensor]
    else
      render json: { errors: arduino_sensor.errors }, status: 422
    end

  end

  private

  def arduino_sensor_params
    params.require(:arduino_sensor).permit(:ground_humidity, :israining, :shakes, :nonrelative_asl, :relative_asl, :temperature,
                                           :pressure, :air_humidity)
  end
end

# POST save record curl -X POST  -H "Accept: Application/json" -H "Content-Type: application/json" https://weather-online-dk.herokuapp.com/api/some_model -d '{"name":"somename","number":"1"}'
# GET single record curl -i -H "Accept: application/json" https://weather-online-dk.herokuapp.com/api/some_model/1