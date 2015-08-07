class Conhecimento < ActiveRecord::Base
  has_many :emails_conhecimentos, dependent: :destroy

  scope :pesquisa_conhecimento, ->(procura) do
    where("upper(nome) like upper('%#{procura}%')")
  end
end
