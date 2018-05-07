class Api::BenchesController < ApplicationController

  def index
    @benches = Bench.all
    render 'api/benches/index'
  end

  def create
    @bench = Bench.new(bench_params)
    if @bench.save
      render 'apt/benches/show'
    else
      render json: @bench.errors.full_messages, status: 422
    end
  end

  private

  def bench_params
    params.require(:bench).permit(:description, :lat, :lng)
  end
end
