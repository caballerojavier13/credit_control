class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :show_json, :edit, :update, :delete]
  before_filter :authorize, except: [:index_json,:show_json]

  # GET /sales
  # GET /sales.json
  def index_json
    @people = Person.all
  end

  def index
    @people = Person.all
    if params[:filter_person].nil?
      @sales = Sale.all
    else
      if params[:filter_payment] == 'paid'
        if params[:filter_person] == 'all'
          @sales = Sale.where.not(id:(Quote.where(is_paid: false ).select('sale_id')))
        else
          @sales = Sale.where.not(id:(Quote.where(is_paid: false ).select('sale_id'))).where(:person_id => params[:filter_person])
        end
      else
        if params[:filter_payment] == 'not_paid'
          if params[:filter_person] == 'all'
            @sales = Sale.where(id: (Quote.where(is_paid: false ).select('sale_id')))
          else
            @sales = Sale.where(id: (Quote.where(is_paid: false ).select('sale_id')),:person_id => params[:filter_person])
          end
        else
          if params[:filter_person] != 'all'
            @sales = Sale.where(:person_id => params[:filter_person])
          else
            @sales = Sale.all
          end

        end
      end
    end

  end

  # GET /sales/1
  # GET /sales/1.json
  def show_json
  end

  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    respond_to do |format|
      if @sale.save
        quantity = params[:quotes_quantity].gsub(/[^\d^\.]/, '').to_i

        for i in 1..quantity
          @quote = Quote.new
          @quote.amount = (params[:amount]).gsub(/[^\d^\.]/, '').to_f
          @quote.is_paid = false
          @quote.number = i
          @quote.total = quantity
          @quote.mounth = (@sale.date + i.month).month
          @quote.year = (@sale.date + i.month).year
          @quote.sale = @sale
          @quote.save
        end

        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sale }
      else
        format.html { render action: 'new' }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    quotes = Quote.where(:sale_id =>  @sale.id)

    quotes.each { |q| q.destroy }

    respond_to do |format|
      if @sale.update(sale_params)
        quantity = params[:quotes_quantity].gsub(/[^\d^\.]/, '').to_i

        for i in 1..quantity
          @quote = Quote.new
          @quote.amount = (params[:amount]).gsub(/[^\d^\.]/, '').to_f
          @quote.is_paid = false
          @quote.number = i
          @quote.total = quantity
          @quote.mounth = (@sale.date + i.month).month
          @quote.year = (@sale.date + i.month).year
          @quote.sale = @sale
          @quote.save
        end
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def delete
    @sale.destroy
    quotes = Quote.where(sale_id:  @sale.id)

    quotes.each { |q| q.destroy }
    message = "The sale: \"#{@sale.description.to_s.capitalize } \" was successfully deleted."
    respond_to do |format|
      format.html { redirect_to sales_url, notice: message }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sale_params
    params.require(:sale).permit(:person_id, :date, :description)
  end

  def quotes_params
    params.permit(:person_id, :date, :description)
  end
end
