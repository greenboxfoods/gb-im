class ItemsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json
  # GET /items
  # GET /items.json
  def index
    @items = Item.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    # @item.build_note

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        respond_with(@items)
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    Rails.logger.debug params.inspect
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update_attributes(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        respond_with(@items)
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
  def item_params
    params.require(:item).permit( :description, :name, :picture, :quantity, :unit_value, :vendor_url, :value,
                                      :vendor_name, :category, :unit_type, :brand_name, :location_id, :restock_lead_time,
                                      :payment_terms, :spoilage_date, :cooked, :note)
  end

  # def note_params
  #   params.require(:note).permit!
  # end
end
