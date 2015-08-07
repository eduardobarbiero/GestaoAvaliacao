class Email < ActiveRecord::Base
  has_many :emails_conhecimentos, dependent: :destroy
  has_many :candidatos_emails, dependent: :destroy

  scope :pesquisa_email, ->(procura) do
    where("upper(titulo) like upper('%#{procura}%') or upper(corpo) like upper('%#{procura}%')")
  end

  scope :pesquisa_candidatos_emails, ->(conhecimento_id, conhecimento_voto) do
    joins(:emails_conhecimentos).where('emails_conhecimentos.conhecimento_id = ? and (? between emails.minima and emails.maxima) and generico <> 1', conhecimento_id, conhecimento_voto)
  end

  scope :nao_generico, ->() do
    where('generico <> 1')
  end

end
