# Terraform Hello World


## Introdução

O [Terraform](https://www.terraform.io/) é uma ferramenta para construir, alterar e controlar a infraestrutura de TI de forma segura e eficiente.

O Terraform pode gerenciar provedores de serviços existentes e populares como OpenStack, Azure, AWS, Digital Ocean, entre outros, bem como soluções internas personalizadas.

A infraestrutura que o Terraform pode gerenciar inclui componentes de baixo nível, como instâncias de computação, armazenamento e redes, bem como componentes de alto nível, como entradas DNS, recursos SaaS, etc.


## Instalar o Terraform CLI (Command Line Interface)

1. Siga o passo-a-passo da página [https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
    
2. Teste a instalação pelo terminal digitando o comando abaixo.

   ```
   terraform --version
   ```


## Configurar o acesso do Terraform à uma conta AWS

1. Dentro do diretório *terraform/*, crie o diretório *.aws/*.

2. Dentro do diretório *terraform/.aws/*, crie o arquivo *credentials*, inclua o conteúdo de exemplo abaixo e substitua pelas infos da sua conta AWS.
   
   ```
   [fiap-iac]
   aws_access_key_id = *********************
   aws_secret_access_key = *********************
   aws_session_token = *********************
   ```

3. Dentro do diretório *terraform/.aws/*, crie o arquivo *config* e inclua o conteúdo abaixo.

   ```
   [profile fiap-iac]
   region = us-east-1
   output = json
   ```


## Inicializar o Terraform

1. Abra o terminal e execute o comando abaixo.

   ```
   terraform -chdir=./terraform init
   ```

   - O texto em verde *Terraform has been successfully initialized!* será mostrado indicando que o Terraform inicializou corretamente.


## Criar os recursos de TI na AWS

1. Valide que não existem erros no código Terraform.

   ```
   terraform -chdir=./terraform validate
   ```

2. Planeje a criação dos recursos de TI na AWS.

   ```
   terraform -chdir=./terraform plan -out tfplan
   ```

3. Crie os recursos de TI na AWS.

   ```
   terraform -chdir=./terraform apply -auto-approve tfplan
   ```

4. Verifique as informações dos recursos de TI criados na AWS.

   ```
   terraform -chdir=./terraform show
   ```


## Validar pelo portal AWS os recursos de TI criados

1. Abra o portal AWS e valide a configuração dos recursos de TI criados (VPC, Internet Gateway, SubRede, Tabela de Roteamento, Security Group e EC2).


## Remover recursos de TI

1. Destruir os recursos de TI criados na AWS.

   ```
   terraform -chdir=./terraform plan -destroy -out tfplan
   terraform -chdir=./terraform apply -auto-approve tfplan
   ```