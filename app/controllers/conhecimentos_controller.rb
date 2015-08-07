class ConhecimentosController < ApplicationController
  before_action :set_conhecimento, only: [:show, :edit, :update, :destroy]

  # GET /conhecimentos
  # GET /conhecimentos.json
  def index
    if params[:procura].blank?
      @conhecimentos = Conhecimento.page(params[:page]).per(5).order('created_at desc')
    else
      @conhecimentos = Conhecimento.pesquisa_conhecimento(params[:procura]).page(params[:page]).per(5).order('created_at desc')
    end

  end

  # GET /conhecimentos/1
  # GET /conhecimentos/1.json
  def show
  end

  # GET /conhecimentos/new
  def new
    @conhecimento = Conhecimento.new
  end

  # GET /conhecimentos/1/edit
  def edit
  end

  # POST /conhecimentos
  # POST /conhecimentos.json
  def create
    @conhecimento = Conhecimento.new(conhecimento_params)


    respond_to do |format|
      if @conhecimento.save
        format.html { redirect_to conhecimentos_path, notice: 'Conhecimento criado!' }
        format.json { render :show, status: :created, location: @conhecimento }
      else
        format.html { render :new }
        format.json { render json: @conhecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conhecimentos/1
  # PATCH/PUT /conhecimentos/1.json
  def update
    respond_to do |format|
      if @conhecimento.update(conhecimento_params)
        format.html { redirect_to conhecimentos_path, notice: 'Conhecimento atualizado!' }
        format.json { render :show, status: :ok, location: @conhecimento }
      else
        format.html { render :edit }
        format.json { render json: @conhecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conhecimentos/1
  # DELETE /conhecimentos/1.json
  def destroy
    @conhecimento.destroy
    respond_to do |format|
      format.html { redirect_to conhecimentos_url, notice: 'Conhecimento foi deletado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conhecimento
      @conhecimento = Conhecimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conhecimento_params
      params.require(:conhecimento).permit(:nome)
    end
end
