class Notifier < ActionMailer::Base
  default :from => "meustestepedidos@gmail.com"

  def notification(para, subject, descricao)
    @descricao = descricao
    @subject = subject
    mail(:to => para, :subject => subject)
  end

end
