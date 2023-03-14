# Terraform Hello World


## Introdução

O [Terraform](https://www.terraform.io/) é uma ferramenta para construir, alterar e controlar a infraestrutura de forma segura e eficiente.

O Terraform pode gerenciar provedores de serviços existentes e populares como OpenStack, Azure, AWS, Digital Ocean, entre outras, bem como soluções internas personalizadas.

Os arquivos de configuração do Terraform descrevem os componentes necessários para executar um único aplicativo ou todo o *datacenter*, gerando um plano de execução que descreve o que será feito para alcançar o estado desejado e, em seguida, executá-lo para construir a infraestrutura descrita. À medida que a configuração muda, o Terraform é capaz de determinar o que mudou e criar planos de execução incrementais que podem ser aplicados.

A infraestrutura que o Terraform pode gerenciar inclui componentes de baixo nível, como instâncias de computação, armazenamento e redes, bem como componentes de alto nível, como entradas DNS, recursos SaaS, etc.


## Pre-req: Instalar/Configurar o Terraform

1. Fazer o *download* em [https://www.terraform.io/downloads](https://www.terraform.io/downloads).
    
2. Descompactar o arquivo baixado no diretório *C:\Windows\System32*.
   
3. Testar a instalação, abrindo o terminal de comando e digitando *terraform -h* como no exemplo abaixo.

   ```
   terraform --version
   ```


## Pre-req: Clonar do GitHub o código Terraform de exemplo *Hello World*

1. Caso o Git client não esteja instalado, baixar e configurar conforme instruções em [https://git-scm.com/downloads](https://git-scm.com/downloads).

2. Testar o Git client, abrindo o terminal de comando e digitando *git* como no exemplo abaixo.

   ```
   git --version
   ```

3. Clonar repositório https://github.com/kledsonhugo/terraform-hello-world

   - Pelo terminal:
     ```
     git clone https://github.com/kledsonhugo/terraform-hello-world
     ```

   - Pelo Visual Studio Code:
     ![Clone Repository](/images/clone-repository.png)


## Pre-req: Configurar credencial de acesso à conta AWS

1. Configurar no diretório *terraform/.aws/* o arquivo *credentials* contendo a credencial de acesso para conectar na conta AWS.

   - Dentro do diretório *terraform/* onde está seu código IaC, criar o diretório *.aws/* e dentro dele criar o arquivo *credentials* contendo as credenciais de acesso, conforme o exemplo abaixo.

     ```
     cd terraform-hello-world/terraform
     mkdir .aws/
     touch .aws/credentials
     code .aws/credentials
     ```
    
   - Incluir as credenciais de acesso no arquivo *.aws/credentials*. O arquivo deverá conter o conteúdo conforme o exemplo abaixo.

     ```
     [fiap-iac]
     aws_access_key_id = ASIAV2XAOBJRRVNBXJL2
     aws_secret_access_key = ew0xROrRLYino1QRx9ds1UXM7iJUjwnx9E3T
     aws_session_token = FwoGZXIvYXdzEKv//////////wEaDF0S2MnqCAf5Z8Ov6yK9AaQG4G7B/TiV4VCqyJqJr9YA3n7802QTr92WYxKppnODY8d/8efpvPbU55555555555555555oqW7fqIh00s/lJTwbQ0HZRboKjNnoEXF5+c+8soOUfKEXjtuU8BLKi73Hq1GEiubqHdHbxTUgWL5nwF9222222222222222229Pn1z/6t46wUofOmHZu8qO37qfNh1K9G9qZjTQ/dvGSSnoSzk93uzbOgw4/KPnSjd0uSRBjIt3NiZ7TlpR/ie4GLu3r4k3YPBB3u4UoYbe3VBzxZ/OhBp1bVvH9FaCi4R8sN1
     ```

2. Configurar no diretório *terraform/.aws/* o arquivo *config* contendo as informações abaixo.

   ```
   touch .aws/config
   code .aws/config
   ```
    
   - O arquivo deverá conter o conteúdo conforme o exemplo abaixo.

     ```
     [profile fiap-iac]
     region = us-east-1
     output = json
     ```

## Inicializar o Terraform.

```
terraform init
```

## Executar o Terraform na conta AWS.

1. Validar o template:

   ```
   terraform validate -json
   ```

2. Planejar a execução do código Terraform. Executar *terraform plan*.

   ```
   terraform plan -input=false -out tfplan  
   ```

3. Executar o plano do código Terraform. Executar *terraform apply* para criar os recursos.

   ```
   terraform apply -auto-approve -input=false tfplan
   ```

4. Verificar as configurações dos recursos criados.

   ```
   terraform show
   ```


## Validar na console de gerenciamento AWS a configuração desejada dos recursos.

Abrir a console de gerenciamento AWS, selecionar o serviço correspondente a cada recurso criado e validar se a configuração desejada foi satisfeita.

   - Validar se a VPC foi criada com as configurações desejadas.
   - Validar se o Internet Gateway foi criado com as configurações desejadas.
   - Validar se a Sub-rede foi criada com as configurações desejadas.
   - Validar se a Tabela de Roteamento foi criada com as configurações desejadas.
   - Validar se a Tabela de Roteamento foi associada à Sub-rede desejada.
   - Validar se o Security Group foi criado com as configurações desejadas.
   - Validar se a instância EC2 foi criada com as configurações desejadas.


## Clean-up dos recursos criados na conta AWS

Destruir os recursos criados na conta AWS do SandBox.

```
terraform plan -input=false -out tfplan -destroy
terraform apply -auto-approve -input=false tfplan
```


## Demo do autor

[Vídeo com a demonstração do Hello World](https://youtu.be/tP8png215tE)
