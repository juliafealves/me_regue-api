class Api::V1::PlantsController < ApplicationController

  # Created a plant.
  def create
    plant = Plant.new(plants_params)
    if plant.save
      render json: {status: 'SUCCESS', message: 'Saved plant', data: plant}, status: :created
    else
      render json: {status: 'ERROR', message: 'Plant not saved', data: plant.errors}, status: :unprocessable_entity
    end
  end

  # Parameters accepts
  def plants_params
    params.permit(:name, :description)
  end
end
