class CandidatosController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:avaliacao, :create, :thank_you, :show]

  # GET /candidatos
  # GET /candidatos.json
  def index
    @candidatos = Candidato.all
  end

  def avaliacao
    @candidato = Candidato.new
    @conhecimentos = Conhecimento.all
    respond_to do |format|
      format.html
    end
  end

  # GET /candidatos/1
  # GET /candidatos/1.json
  def show
    render 'candidatos/thank_you'
  end

  # GET /candidatos/new
  def new
    @candidato = Candidato.new
  end

  # GET /candidatos/1/edit
  def edit
  end

  # POST /candidatos
  # POST /candidatos.json
  def create
    if !candidato_params[:nome].blank? and !candidato_params[:email].blank?
      @candidato = Candidato.new(candidato_params)
      if @candidato.save
        trabalha_candidatos @candidato.id
        thank_you @candidato.nome
      end
    else
      render 'candidatos/avaliacao'
    end
  end

  def thank_you candidato
    respond_to do |format|
      format.html { redirect_to candidatos_thank_you_path :params => { :candidato => candidato } }
    end
  end

  # PATCH/PUT /candidatos/1
  # PATCH/PUT /candidatos/1.json
  def update
    respond_to do |format|
      if @candidato.update(candidato_params)
        format.html { redirect_to @candidato, notice: 'Candidato was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidato }
      else
        format.html { render :edit }
        format.json { render json: @candidato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidatos/1
  # DELETE /candidatos/1.json
  def destroy
    @candidato.destroy
    respond_to do |format|
      format.html { redirect_to candidatos_url, notice: 'Candidato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def trabalha_candidatos candidato_id
      maiorMedia = []
      if !params[:conhecimento].nil?
        params[:conhecimento].each { |conhecimento|
          if !conhecimento.blank?
            @emails = Email.pesquisa_candidatos_emails(conhecimento[0].to_i, conhecimento[1].to_i)
            if !@emails.blank?
              maiorMedia.push conhecimento[0].to_i
            end
          end
        }
        @media = Email.nao_generico
        enviado = 0
        @media.each { |email|
          enviado = enviado + media_conhecimento(email.id, maiorMedia, email.corpo, email.titulo, candidato_id).to_i
        }
        if enviado == 0
          @emailGenerico = Email.find_by_generico(1)
          if !@emailGenerico.nil?
            notificar(candidato_params[:email].to_s, @emailGenerico.titulo, @emailGenerico.corpo)
          end
        end
      end
    end


    def media_conhecimento email_id, maiorMedia, corpo, titulo, candidato_id
      maiorMedia = maiorMedia
      @mediaConhecimento = EmailsConhecimento.buscar_ativos(email_id)
      if !@mediaConhecimento.blank?
        @mediaConhecimento.each { |mediaCon|
          if !maiorMedia.include? mediaCon.conhecimento_id
            return 0
          end
        }
        notificar(candidato_params[:email].to_s, titulo, corpo)
        @candidatos_email = CandidatosEmail.create(email_id: email_id, candidato_id: candidato_id)
        return 1
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_candidato
      @candidato = Candidato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidato_params
      params.require(:candidato).permit(:nome, :email, :conhecimento)
    end
end
