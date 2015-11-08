class Api::SomeModelController < ApplicationController
  respond_to :json
  def index
    respond_with SomeModel.all
  end

  def show
    respond_with SomeModel.find(params[:id])
  end

  def create
    some_model = SomeModel.new(some_model_params)

    if some_model.save
      render json: some_model, status: 201, location: [:api, some_model]
    else
      render json: { errors: some_model.errors }, status: 422
    end

  end

  private

  def some_model_params
    params.require(:some_model).permit(:name, :number)
  end
end

# POST save record curl -X POST  -H "Accept: Application/json" -H "Content-Type: application/json" http://localhost:3000/api/some_model -d '{"name":"somename","number":"1"}'
# GET single record curl -i -H "Accept: application/json" http://localhost:3000/api/some_model/1