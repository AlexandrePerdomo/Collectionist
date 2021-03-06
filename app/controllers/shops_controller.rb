# frozen_string_literal: true

class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]

  def index
    @shops = Shop.all
  end

  def show
    @open_hours = @shop.generate_open_hours
  end

  def new
    @shop = Shop.new
  end

  def edit; end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to @shop, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @shop.update(shop_params)
      redirect_to @shop, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_url, notice: t('.success')
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, open_hours_attributes: %i[id day opens closes _destroy])
  end
end
