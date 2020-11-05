# desafio_go
Desafio Técnico Go Contact

Este projeto foi desenvolvido utilizando RobotFramework. Para executá-lo, é necessário o seguinte ambiente:

Ambiente:
Python 3.4+ (o python tem que estar configurado no PATH)
As seguintes libraries a serem instaladas através do pip (sendo recomendada a última versão estável):
robotframework
robotframework-seleniumlibrary
Navegador Chrome ou Firefox e respectivos webdrives (atenção à lista de compatibilidades e o webdriver deve estar incluído no PATH)

Repositório:
Fazer um clone do repositório em um diretório local

Execução:
A execução deve ser feita executando-se no diretório onde foi instalado o repositório o seguinte comando:
robot -d results /tests

Este comando executará todos os testes e colocará o relatório de testes no diretório results do projeto

Por default a execução será no navegador Chrome, podendo ser alterada utilizando-se -v BROWSER:firefox. O comando então ficaria assim:
robot -d results -v BROWSER:firefox /tests

Também é possível executar os testes por suite (os arquivos com extensão .robot) ou por tags.
As tags utilizadas foram Smoke (para os smoke tests) e Regression (para os testes de regressão).

robot -d results /tests/login.robot
robot -d results /tests/failed_login.robot
robot -d results /tests/repository.robot

robot -d results -i Regression /tests
robot -d results -i Smoke /tests

Observação: não existem dependências entre os testes e estes recompõem o ambiente ao estado inicial. O
que significa que os testes podem ser executados em qualquer ordem e a execução pode ser repetida sem
necessidade de intervir no ambiente.