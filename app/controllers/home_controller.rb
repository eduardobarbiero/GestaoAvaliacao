class HomeController < ApplicationController
  def index
    if params[:procura].blank?
      @candidatos_emails = CandidatosEmail.page(params[:page]).per(5).order('created_at desc')
    else
      @candidatos_emails = CandidatosEmail.pesquisa_candidatos(params[:procura]).page(params[:page]).per(5).order('created_at desc')
    end
  end
end
