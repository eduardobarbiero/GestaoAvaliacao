# Gestão Avaliação
Portal de Gestão de Avaliação para candidatos.

Instalar/Utilizar versão 1.9.3 do Ruby:

    http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-1.9.3-p551.exe

Baixar DevKit e extrair para uma pasta(pode ser a pasta que foi instalada o Ruby):

    http://dl.bintray.com/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe
  
Ir até o diretório do DevKit extraido e executar:
  
    ruby dk.rb init
    
    ruby dk.rb install
    
Ir até o diretório do projeto e executar:

    gem install bundler
    
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
  
  
  
