class StuffsController < ApplicationController
  before_action :set_stuff, only: %i[ show edit update destroy ]

  # GET /stuffs or /stuffs.json
  def index
    if params[:q].present?
      @stuffs = Stuff.name_filter(params[:q][:name_cont]).desc_filter(params[:q][:desc_cont])
    else
      @stuffs = Stuff
    end #if
    
    @pagy, @stuffs = pagy(@stuffs.order('created_at DESC'))
    @q = params[:q] || {}
  end

  # GET /stuffs/1 or /stuffs/1.json
  def show
  end

  # GET /stuffs/new
  def new
    @stuff = Stuff.new
  end

  # GET /stuffs/1/edit
  def edit
  end

  # POST /stuffs or /stuffs.json
  def create
    @stuff = Stuff.new(stuff_params)

    respond_to do |format|
      if @stuff.save
        format.html { redirect_to stuff_url(@stuff), notice: "Stuff was successfully created." }
        format.json { render :show, status: :created, location: @stuff }
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('stuffs', partial: 'stuffs/stuff', locals: {stuff: @stuff})}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stuffs/1 or /stuffs/1.json
  def update
    respond_to do |format|
      if @stuff.update(stuff_params)
        format.html { redirect_to stuff_url(@stuff), notice: "Stuff was successfully updated." }
        format.json { render :show, status: :ok, location: @stuff }
        format.turbo_stream {render turbo_stream: turbo_stream.replace(@stuff)}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stuffs/1 or /stuffs/1.json
  def destroy
    @stuff.destroy!

    respond_to do |format|
      format.html { redirect_to stuffs_url, notice: "Stuff was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream {render turbo_stream: turbo_stream.remove(@stuff)}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stuff
      @stuff = Stuff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stuff_params
      params.require(:stuff).permit(:name, :desc, :category_id, :amount)
    end
end
