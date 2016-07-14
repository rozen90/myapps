class ExpensesController < ApplicationController
  before_action :set_expensesbasis, only: [:show, :edit, :update, :destroy]
  before_filter :set_expenses!

  # GET /expensesbases
  # GET /expensesbases.json
  def index
    @expensesbases = @post.expensesbasis.all
  end

  # GET /expensesbases/1
  # GET /expensesbases/1.json
  def show
  end

  # GET /expensesbases/new
  def new
    @expensesbasis = Expensesbase.new
  end

  # GET /expensesbases/1/edit
  def edit
  end

  # POST /expensesbases
  # POST /expensesbases.json
  def create
    @expensesbasis = @post.expensesbases.new(expensesbasis_params)

    respond_to do |format|
      if @expensesbasis.save
        format.html { redirect_to [@post, @expensesbasis], notice: 'Expensesbase was successfully created.' }
        format.json { render :show, status: :created, location: @expensesbasis }
      else
        format.html { render :new }
        format.json { render json: @expensesbasis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expensesbases/1
  # PATCH/PUT /expensesbases/1.json
  def update
    respond_to do |format|
      if @expensesbasis.update(expensesbasis_params)
        format.html { redirect_to [@post, @expensesbasis], notice: 'Expensesbase was successfully updated.' }
        format.json { render :show, status: :ok, location: @expensesbasis }
      else
        format.html { render :edit }
        format.json { render json: @expensesbasis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expensesbases/1
  # DELETE /expensesbases/1.json
  def destroy
    @expensesbasis.destroy
    respond_to do |format|
      format.html { redirect_to [@post, @expensesbasis], notice: 'Expensesbase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expensesbasis
      @expensesbasis = Expensesbase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expensesbasis_params
      params.require(:expensesbasis).permit(:date, :sum, :post_id)
    end

    def set_expenses!
      @post = Post.find(params[:post_id]) rescue nil
      if !@post
        redirect_to root_path, :alert => "Post not found!"
      end
    end
end