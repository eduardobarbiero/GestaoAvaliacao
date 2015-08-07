# GestaoAvaliacao
Portal de Gestão de Avaliação para candidatos.

Utilizar versão 1.9.3 do Ruby!

  Ir até o diretório do projeto
  
    bundle install
    
    bundle exec rake db:migrate rails_env=development  
    
    bundle exec rake db:seed
    
    rails s -e development -p 3000
	
Para efetuar uma Avaliação basta acessar:

  http://localhost:3000/avaliacao/
  
Para acessar diretamente o portal de Gestão acessar:

  http://localhost:3000/
  
Para envio de email, está configurada a conta:

  login: meustestepedidos@gmail.com  
  
  senha: gestaoavaliacao
  
Usuário padrão:

  login: teste@teste.com.br
  
  senha: teste
  
  
  
