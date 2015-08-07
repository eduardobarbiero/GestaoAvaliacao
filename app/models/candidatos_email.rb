class CandidatosEmail < ActiveRecord::Base
  belongs_to :email, :foreign_key => :email_id, class_name: 'Email'
  belongs_to :candidato, :foreign_key => :candidato_id, class_name: 'Candidato'

  scope :pesquisa_candidatos, ->(procura) do
    joins(:candidato, :email).where("upper(candidatos.nome) like upper('%#{procura}%') or upper(emails.corpo) like upper('%#{procura}%') or upper(candidatos.email) like upper('%#{procura}%')")
  end
end
