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

  # List all plants.
  def index
    plants = Plant.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'Successfully listed plants.', data: plants}, status: :ok
  end

  # Updated a plant.
  def update
    plant = Plant.find(params[:id])

    if plant.update_attributes(plants_params)
      render json: {status: 'SUCCESS', message: 'Updated plant', data: plant}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Plant not updated', data: plant.errors}, status: :unprocessable_entity
    end
  end

  # Parameters accepts
  def plants_params
    params.permit(:name, :description)
  end
end
