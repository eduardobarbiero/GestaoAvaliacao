class Candidato < ActiveRecord::Base
  has_many :candidatos_emails, dependent: :destroy
end
