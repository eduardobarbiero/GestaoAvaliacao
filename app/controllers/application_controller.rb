class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :except => ['candidatos/avaliacao', 'candidatos/thank_you']
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :authenticate_user!

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def notificar(para, assunto, corpo)
    begin
      Notifier.notification(para, assunto, corpo).deliver
    rescue
      puts 'ocorreu um problema ao enviar'
    end
  end
end
