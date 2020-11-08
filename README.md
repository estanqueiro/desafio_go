# desafio_go
## **Desafio Técnico Go Contact**

Este projeto foi desenvolvido utilizando-se RobotFramework. Para executá-lo, é necessária a seguinte configuração:

**_Ambiente:_**
- Python 3.5+ (o python tem que estar configurado no PATH). Pode ser encontrado em https://www.python.org/downloads/

As seguintes libraries devem ser instaladas (através do comando pip, sendo recomendada a última versão estável):

    pip install robotframework
    pip install robotframework-seleniumlibrary

- Navegadores (_**Chrome e Firefox**_) e respectivos webdrives (atenção à lista de compatibilidades entre navegador e webdriver. 
O webdriver deve estar incluído no PATH): 
    - Chromedriver: https://chromedriver.chromium.org/downloads
    - Geckodriver: https://github.com/mozilla/geckodriver/releases

**_Repositório:_**

Fazer um clone do repositório **desafio_go** em um diretório local:
    
    git clone https://github.com/estanqueiro/desafio_go.git

**_Execução:_**

A execução deve ser feita à partir do diretório onde foi instalado o repositório através do seguinte comando 
(atenção à barra. Se estiver executando em uma máquina linux deve-se usar a barra invertida "\\" antes de tests):

    robot -d results/chrome /tests

Este comando executará todos os testes e colocará o relatório final de testes em results/chrome.

Por default a execução será no navegador Chrome, podendo ser alterada utilizando-se -v BROWSER:firefox. 
O comando então ficaria assim:

    robot -d results/firefox -v BROWSER:firefox /tests

Também é possível executar os testes por suite (os arquivos com extensão .robot) ou por tags. 

Neste projeto temos 3 suítes (exemplos de comando de execução no chrome: 
 - login:
 - failed_login
 - repository

    robot -d results/chrome /tests/login.robot
    robot -d results/chrome /tests/failed_login.robot  
    robot -d results/chrome /tests/repository.robot


As tags utilizadas foram (o comando adicional é -i <tag>. Os exemplos agora são para firefox):
- Smoke (para os smoke tests)
- Regression (para os testes de regressão)
    
    robot -d results/firefox -v BROWSER:firefox -i Smoke /tests
    robot -d results/firefox -v BROWSER:firefox -i Regression /tests

Observação: não existem dependências entre os testes e estes recompõem o ambiente ao estado inicial. O
que significa que os testes podem ser executados em qualquer ordem e a execução pode ser repetida sem
necessidade de intervir no ambiente.

Deixou-se, a título de exemplo, os relatórios de teste. Chrome em results/chrome e firefox em results/firefox.
