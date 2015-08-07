class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  # GET /emails
  # GET /emails.json
  def index
    if params[:procura].blank?
      @emails = Email.page(params[:page]).per(5).order('created_at desc')
    else
      @emails = Email.pesquisa_email(params[:procura]).page(params[:page]).per(5).order('created_at desc')
    end
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
    @emails = EmailsConhecimento.buscar_ativos(params[:id])
  end

  # POST /emails
  # POST /emails.json
  def create
    conhecimento = email_params[:con].split(',')
    params[:email].delete :con
    @email = Email.new(email_params)

    respond_to do |format|
      if @email.save
        conhecimento.each { |con|
          if !con.blank?
            @email_opcoes = EmailsConhecimento.create(email_id: @email.id, conhecimento_id: con)
          end
        }
        format.html { redirect_to emails_path, notice: 'Email criado!' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      conhecimento = email_params[:con].split(',')
      conhecimentoDelete = []
      params[:email].delete :con
      if @email.update(email_params)
        conhecimento.each { |con|
          if !con.blank?
            @conhecimento = EmailsConhecimento.find_by(email_id: @email.id, conhecimento_id: con)
            if @conhecimento.blank?
              @email_opcoes = EmailsConhecimento.create(email_id: @email.id, conhecimento_id: con)
            end
            conhecimentoDelete.push con
          end
        }
        @deleteEmOp = EmailsConhecimento.delete_inativos(conhecimentoDelete, @email.id)
        if !@deleteEmOp.blank?
          @deleteEmOp.destroy_all
        end
        format.html { redirect_to emails_path, notice: 'Email atualizado!' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_path, notice: 'Email foi deletado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:titulo, :corpo, :con, :minima, :maxima, :generico)
    end
end
