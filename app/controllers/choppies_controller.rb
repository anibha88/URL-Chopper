class ChoppiesController < ApplicationController
  before_action :set_choppy, only: [:show, :edit, :update, :destroy]

  def index
    @choppies = Choppy.all
  end

  def show
  end

  def new
    @choppy = Choppy.new
  end

  def edit
  end

  def create
    @choppy = Choppy.find_by_actual_url(params[:choppy][:actual_url])
    @choppy = Choppy.new(choppy_params)

    begin
      choppy_key = SecureRandom.hex(KEY_LENGTH)  
    end while Choppy.exists?(shortened_url: choppy_key)

    @choppy.shortened_url = choppy_key
    @choppy.http_status = 301

    respond_to do |format|
      if @choppy.save
        format.html { redirect_to @choppy, notice: 'Choppy was successfully created.' }
        format.json { render :show, status: :created, location: @choppy }
      else
        format.html { render :new }
        format.json { render json: @choppy.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @choppy.update(choppy_params)
        format.html { redirect_to @choppy, notice: 'Choppy was successfully updated.' }
        format.json { render :show, status: :ok, location: @choppy }
      else
        format.html { render :edit }
        format.json { render json: @choppy.errors, status: :unprocessable_entity }
      end
    end
  end

  def redirect
    @choppy = Choppy.where(shortened_url: params[:link]).first || not_found
    @choppy.update_attributes(updated_at: Time.now)
    redirect_to @choppy.actual_url, :status => @choppy.http_status and return
  end


  def destroy
    @choppy.destroy
    respond_to do |format|
      format.html { redirect_to choppies_url, notice: 'Choppy was successfully destroyed.' }
      format.json { render json: {success:"Request implemented successfully"},status: :created}
    end
  end

  private
    
    def set_choppy
      @choppy = Choppy.find(params[:id])
    end

    def choppy_params
      params.require(:choppy).permit(:actual_url)
    end
end
