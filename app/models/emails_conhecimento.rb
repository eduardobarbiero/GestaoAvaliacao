class EmailsConhecimento < ActiveRecord::Base
  belongs_to :conhecimento, :foreign_key => :conhecimento_id, class_name: 'Conhecimento'
  belongs_to :email, :foreign_key => :email_id, class_name: 'Email'

  scope :delete_inativos, ->(conhecimentos, email_id) do
    where("conhecimento_id not in (#{conhecimentos.to_s.sub!("[", "").sub("]", "")}) and email_id = #{email_id}")
  end

  scope :buscar_ativos, ->(email_id) do
    where("email_id = #{email_id}")
  end
end
