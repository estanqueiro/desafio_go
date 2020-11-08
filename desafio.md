### Desafio Técnico Go Contact

A minha implementação do desafio levou em consideração o perfil da vaga (características do QA tester):
- Desenvolvimento de testes funcionais e de sanidade dos vários serviços e funcionalidades, através de tecnologias 
  como selenium para testes funcionais à interface web, quer através de simulação de chamadas telefónicas, para 
  garantir as funcionalidades dependentes da interface de voz.

Levando estes ponto em consideração, implementei os testes utilizando o framework de testes automatizados 
RobotFramework e sua livraria selenium, utilizando-me de uma abordagem mista (keyword-driven e data-driven). 
Separei as suítes de teste por funcionalidades e inseri tags Smoke e Regression.

  - Desenvolvimento e manutenção do pipeline de continuous integration da solução com recurso a jenkins e
    tecnologia de containerização / virtualização. Criação de imagens, instanciação da imagem num servidor
    de staging, execução de bateria de testes automáticos para garantir a qualidade da imagem criada,
    que poderá ser depois instanciada nos servidores de produção.

Não houve tempo hábil para criar para este desafio containers para o ambiente de execução (linux, python, 
chrome browser, chromedriver, firefox, geckodriver) e para o servidor de continuous integration (jenkins, por exemplo), 
mas a solução proposta atende perfeitamente a inclusão nesse tipo de ambiente, bastando para isso a criação dos 
scripts de geração e a adequação de alguns ficheiros (dockerfile, requirements.txt, etc.).

No planejamento dos testes, tencionava desenvolver 13 testes. Os testes escolhidos foram:
- Successful login. O teste de login bem sucedido que consta desta suíte foi escolhido para demonstrar o uso da tag 
  Smoke, por se tratar do mais básico Smoke test. Se o login não funcionar, nem adianta executar os outros testes.


- Failed Login. Os quatro testes desta suíte foram escolhidos para demonstrar o uso da abordagem data-driven:
    - Login With Invalid Credentials (Template)
        - Invalid password
        - Invalid username
        - Empty username
        - Empty password

- Repository. Os testes desta suite foram escolhidos por representar as funcionalidades mais utilizadas
              do git por um desenvolvedor. Além disso, as keywords criadas auxiliam no tratamento 
              do setup e teardown dos testes:
    - Create a basic private repository
    - Delete a public repository owned by yourself
    - Import a public repository
    - Create a branch from master
    - Delete branch from repository
    - Add new file into a repository (TODO: não houve tempo para a implementação) 
    - Commit into a repository (TODO: não houve tempo para a implementação) 
    - Merge repositories (TODO: não houve tempo para a implementação) 
