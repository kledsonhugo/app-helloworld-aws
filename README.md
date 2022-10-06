# Terraform Hello World


## Introdução

O [Terraform](https://www.terraform.io/) é uma ferramenta para construir, alterar e controlar a infraestrutura de forma segura e eficiente.

O Terraform pode gerenciar provedores de serviços existentes e populares como OpenStack, Azure, AWS, Digital Ocean, entre outras, bem como soluções internas personalizadas.

Os arquivos de configuração do Terraform descrevem os componentes necessários para executar um único aplicativo ou todo o *datacenter*, gerando um plano de execução que descreve o que será feito para alcançar o estado desejado e, em seguida, executá-lo para construir a infraestrutura descrita. À medida que a configuração muda, o Terraform é capaz de determinar o que mudou e criar planos de execução incrementais que podem ser aplicados.

A infraestrutura que o Terraform pode gerenciar inclui componentes de baixo nível, como instâncias de computação, armazenamento e redes, bem como componentes de alto nível, como entradas DNS, recursos SaaS, etc.


## Pre-req: Instalar/Configurar Terraform client

1. Fazer o *download* do Terraform em [https://www.terraform.io/downloads](https://www.terraform.io/downloads).
    
2. Descompactar o arquivo baixado no diretório *C:\Windows\System32*.
   
3. Testar a instalação, abrindo o terminal de comando e digitando *terraform -h* como no exemplo abaixo.

    ```
    $ terraform -h
    Usage: terraform [global options] <subcommand> [args]

    The available commands for execution are listed below.
    The primary workflow commands are given first, followed by
    less common or more advanced commands.

    Main commands:
      init          Prepare your working directory for other commands
      validate      Check whether the configuration is valid
      plan          Show changes required by the current configuration
      apply         Create or update infrastructure
      destroy       Destroy previously-created infrastructure

    All other commands:
      console       Try Terraform expressions at an interactive command prompt
      fmt           Reformat your configuration in the standard style
      force-unlock  Release a stuck lock on the current workspace
      get           Install or upgrade remote Terraform modules
      graph         Generate a Graphviz graph of the steps in an operation
      import        Associate existing infrastructure with a Terraform resource
      login         Obtain and save credentials for a remote host
      logout        Remove locally-stored credentials for a remote host
      output        Show output values from your root module
      providers     Show the providers required for this configuration
      refresh       Update the state to match remote systems
      show          Show the current state or a saved plan
      state         Advanced state management
      taint         Mark a resource instance as not fully functional
      test          Experimental support for module integration testing
      untaint       Remove the 'tainted' state from a resource instance
      version       Show the current Terraform version
      workspace     Workspace management

    Global options (use these before the subcommand, if any):
      -chdir=DIR    Switch to a different working directory before executing the
                    given subcommand.
      -help         Show this help output, or the help for a specified subcommand.
      -version      An alias for the "version" subcommand.
    ```


## Pre-req: Clonar do GitHub o código Terraform de exemplo *Hello World*

1. Caso o Git client não esteja instalado, baixar e configurar conforme instruções em [https://git-scm.com/downloads](https://git-scm.com/downloads).

2. Testar o Git client, abrindo o terminal de comando e digitando *git* como no exemplo abaixo.

    ```
    $ git
    usage: git [--version] [--help] [-C <path>] [-c <name>=<value>]
               [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
               [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]      
               [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
               [--super-prefix=<path>] [--config-env=<name>=<envvar>]
               <command> [<args>]

    These are common Git commands used in various situations:

    start a working area (see also: git help tutorial)
       clone             Clone a repository into a new directory
       init              Create an empty Git repository or reinitialize an existing one 

    work on the current change (see also: git help everyday)
       add               Add file contents to the index
       mv                Move or rename a file, a directory, or a symlink
       restore           Restore working tree files
       rm                Remove files from the working tree and from the index
       sparse-checkout   Initialize and modify the sparse-checkout

    examine the history and state (see also: git help revisions)
       bisect            Use binary search to find the commit that introduced a bug     
       diff              Show changes between commits, commit and working tree, etc     
       grep              Print lines matching a pattern
       log               Show commit logs
       show              Show various types of objects
       status            Show the working tree status

    grow, mark and tweak your common history
       branch            List, create, or delete branches
       commit            Record changes to the repository
       merge             Join two or more development histories together
       rebase            Reapply commits on top of another base tip
       reset             Reset current HEAD to the specified state
       switch            Switch branches
       tag               Create, list, delete or verify a tag object signed with GPG    

    collaborate (see also: git help workflows)
       fetch             Download objects and refs from another repository
       pull              Fetch from and integrate with another repository or a local branch
       push              Update remote refs along with associated objects

    'git help -a' and 'git help -g' list available subcommands and some
    concept guides. See 'git help <command>' or 'git help <concept>'
    to read about a specific subcommand or concept.
    See 'git help git' for an overview of the system.
    $
    ```

3. Clonar repositório https://github.com/kledsonhugo/terraform-hello-world

   - Pelo Visual Studio Code:
    ![Clone Repository](/images/clone-repository.png)

   - Pelo terminal:
    ```
    $ git clone [https://github.com/kledsonhugo/terraform-hello-world](https://github.com/kledsonhugo/terraform-hello-world)
    Cloning into 'iac'...
    remote: Enumerating objects: 10, done.
    remote: Counting objects: 100% (10/10), done.
    remote: Compressing objects: 100% (10/10), done.
    remote: Total 3716 (delta 4), reused 0 (delta 0), pack-reused 3706
    Receiving objects: 100% (3716/3716), 44.63 MiB | 3.88 MiB/s, done.
    Resolving deltas: 100% (1862/1862), done.
    Checking connectivity... done.
    $
    ```


## Pre-req: Configurar credencial de acesso à conta AWS

1. Configurar no diretório *hello* as credenciais de acesso para conexão com a conta AWS.

   - De dentro do diretório onde está seu código Terraform, criar arquivo *credentials* dentro do diretório *.aws*, contendo as credenciais de acesso conforme exemplo.

    ```
    $ mkdir .aws/
    $ touch .aws/credentials
    ```
    
    - Colar as credenciais de acesso no arquivo *.aws/credentials*. O arquivo deverá ficar conforme abaixo.

    ```
    [default]
    aws_access_key_id = ASIAV2XAOBJRRVNBXJL2
    aws_secret_access_key = ew0xROrRLYino1QRx9ds1UXM7iJUjwnx9E3T
    aws_session_token = FwoGZXIvYXdzEKv//////////wEaDF0S2MnqCAf5Z8Ov6yK9AaQG4G7B/TiV4VCqyJqJr9YA3n7802QTr92WYxKppnODY8d/8efpvPbU55555555555555555oqW7fqIh00s/lJTwbQ0HZRboKjNnoEXF5+c+8soOUfKEXjtuU8BLKi73Hq1GEiubqHdHbxTUgWL5nwF9222222222222222229Pn1z/6t46wUofOmHZu8qO37qfNh1K9G9qZjTQ/dvGSSnoSzk93uzbOgw4/KPnSjd0uSRBjIt3NiZ7TlpR/ie4GLu3r4k3YPBB3u4UoYbe3VBzxZ/OhBp1bVvH9FaCi4R8sN1
    ```


## Inicializar e executar o Terraform na conta AWS.

1. Inicializar o Terraform.

    ```
    $ terraform init

    Initializing the backend...

    Initializing provider plugins...
    - Finding hashicorp/aws versions matching "~> 3.27"...
    - Installing hashicorp/aws v3.58.0...
    - Installed hashicorp/aws v3.58.0 (signed by HashiCorp)

    Terraform has created a lock file .terraform.lock.hcl to record the provider
    selections it made above. Include this file in your version control repository
    so that Terraform can guarantee to make the same selections by default when
    you run "terraform init" in the future.

    Terraform has been successfully initialized!

    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.

    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.
    ```
    
2. Validar o template:

    ```
    $ terraform validate
    Success! The configuration is valid.
    ```

3. Planejar a execução do código Terraform. Executar *terraform plan*.

    ```
    $ terraform plan

    Terraform used the selected providers to generate the following execution plan. Resource actions are
    indicated with the following symbols:
      + create

    Terraform will perform the following actions:

      # aws_instance.hello-isntance will be created
      + resource "aws_instance" "hello-isntance" {
          + ami                                  = "ami-0c02fb55956c7d316"
          + arn                                  = (known after apply)
          + associate_public_ip_address          = (known after apply)
          + availability_zone                    = (known after apply)
          + cpu_core_count                       = (known after apply)
          + cpu_threads_per_core                 = (known after apply)
          + disable_api_termination              = (known after apply)
          + ebs_optimized                        = (known after apply)
          + get_password_data                    = false
          + host_id                              = (known after apply)
          + id                                   = (known after apply)
          + instance_initiated_shutdown_behavior = (known after apply)
          + instance_state                       = (known after apply)
          + instance_type                        = "t2.micro"
          + ipv6_address_count                   = (known after apply)
          + ipv6_addresses                       = (known after apply)
          + key_name                             = (known after apply)
          + monitoring                           = (known after apply)
          + outpost_arn                          = (known after apply)
          + password_data                        = (known after apply)
          + placement_group                      = (known after apply)
          + placement_partition_number           = (known after apply)
          + primary_network_interface_id         = (known after apply)
          + private_dns                          = (known after apply)
          + private_ip                           = (known after apply)
          + public_dns                           = (known after apply)
          + public_ip                            = (known after apply)
          + secondary_private_ips                = (known after apply)
          + security_groups                      = (known after apply)
          + source_dest_check                    = true
          + subnet_id                            = (known after apply)
          + tags                                 = {
              + "Name" = "hellow-isntance"
            }
          + tags_all                             = {
              + "Name" = "hellow-isntance"
            }
          + tenancy                              = (known after apply)
          + user_data                            = (known after apply)
          + user_data_base64                     = (known after apply)
          + vpc_security_group_ids               = (known after apply)

          + capacity_reservation_specification {
              + capacity_reservation_preference = (known after apply)

              + capacity_reservation_target {
                  + capacity_reservation_id = (known after apply)
                }
            }

          + ebs_block_device {
              + delete_on_termination = (known after apply)
              + device_name           = (known after apply)
              + encrypted             = (known after apply)
              + iops                  = (known after apply)
              + kms_key_id            = (known after apply)
              + snapshot_id           = (known after apply)
              + tags                  = (known after apply)
              + throughput            = (known after apply)
              + volume_id             = (known after apply)
              + volume_size           = (known after apply)
              + volume_type           = (known after apply)
            }

          + enclave_options {
              + enabled = (known after apply)
            }

          + ephemeral_block_device {
              + device_name  = (known after apply)
              + no_device    = (known after apply)
              + virtual_name = (known after apply)
            }

          + metadata_options {
              + http_endpoint               = (known after apply)
              + http_put_response_hop_limit = (known after apply)
              + http_tokens                 = (known after apply)
              + instance_metadata_tags      = (known after apply)
            }

          + network_interface {
              + delete_on_termination = (known after apply)
              + device_index          = (known after apply)
              + network_interface_id  = (known after apply)
            }

          + root_block_device {
              + delete_on_termination = (known after apply)
              + device_name           = (known after apply)
              + encrypted             = (known after apply)
              + iops                  = (known after apply)
              + kms_key_id            = (known after apply)
              + tags                  = (known after apply)
              + throughput            = (known after apply)
              + volume_id             = (known after apply)
              + volume_size           = (known after apply)
              + volume_type           = (known after apply)
            }
        }

    Plan: 7 to add, 0 to change, 0 to destroy.

    ────────────────────────────────────────────────────────────────────────────────────────────────────────── 

    Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these 
    actions if you run "terraform apply" now.    
    ```

4. Aplicar a execução do código Terraform. Executar *terraform apply* para criar os recursos.

    ```
    $ terraform apply
    ```

5. Validar na console AWS a configuração dos recursos.


## Clean-up dos recursos criados pelo código Terraform na conta AWS

1. Destruir os recursos criados na conta AWS do SandBox.

    ```
    $ terraform destroy
    aws_vpc.Hello_VPC: Refreshing state... [id=vpc-05c18fa79e3cf13bb]
    aws_internet_gateway.Hello_IGW: Refreshing state... [id=igw-0594754f298c08708]
    aws_subnet.Hello_Public_Subnet: Refreshing state... [id=subnet-04fb9d1a931453e7b]
    aws_security_group.Hello_Security_Group: Refreshing state... [id=sg-086216425404b38ee]
    aws_route_table.Hello_Public_Route_Table: Refreshing state... [id=rtb-0dc2d40297c7c76b1]
    aws_instance.hello-isntance: Refreshing state... [id=i-0f2dceb998f47c054]
    aws_route_table_association.a: Refreshing state... [id=rtbassoc-01d3e3f930046f5bc]

    Terraform used the selected providers to generate the following execution plan. Resource actions are
    indicated with the following symbols:
      - destroy

    Terraform will perform the following actions:

      # aws_instance.hello-isntance will be destroyed
      - resource "aws_instance" "hello-isntance" {
          - ami                                  = "ami-0c02fb55956c7d316" -> null
          - arn                                  = "arn:aws:ec2:us-east-1:095383030489:instance/i-0f2dceb998f47c054" -> null
          - associate_public_ip_address          = true -> null
          - availability_zone                    = "us-east-1a" -> null
          - cpu_core_count                       = 1 -> null
          - cpu_threads_per_core                 = 1 -> null
          - disable_api_termination              = false -> null
          - ebs_optimized                        = false -> null
          - get_password_data                    = false -> null
          - hibernation                          = false -> null
          - id                                   = "i-0f2dceb998f47c054" -> null
          - instance_initiated_shutdown_behavior = "stop" -> null
          - instance_state                       = "running" -> null
          - instance_type                        = "t2.micro" -> null
          - ipv6_address_count                   = 0 -> null
          - ipv6_addresses                       = [] -> null
          - monitoring                           = false -> null
          - primary_network_interface_id         = "eni-04eec5d87133cb44a" -> null
          - private_dns                          = "ip-10-0-0-47.ec2.internal" -> null
          - private_ip                           = "10.0.0.47" -> null
          - public_dns                           = "ec2-52-73-114-9.compute-1.amazonaws.com" -> null
          - public_ip                            = "52.73.114.9" -> null
          - secondary_private_ips                = [] -> null
          - security_groups                      = [] -> null
          - source_dest_check                    = true -> null
          - subnet_id                            = "subnet-04fb9d1a931453e7b" -> null
          - tags                                 = {
              - "Name" = "hellow-isntance"
            } -> null
          - tags_all                             = {
              - "Name" = "hellow-isntance"
            } -> null
          - tenancy                              = "default" -> null
          - vpc_security_group_ids               = [
              - "sg-086216425404b38ee",
            ] -> null

          - capacity_reservation_specification {
              - capacity_reservation_preference = "open" -> null
            }

          - credit_specification {
              - cpu_credits = "standard" -> null
            }

          - enclave_options {
              - enabled = false -> null
            }

          - metadata_options {
              - http_endpoint               = "enabled" -> null
              - http_put_response_hop_limit = 1 -> null
              - http_tokens                 = "optional" -> null
              - instance_metadata_tags      = "disabled" -> null
            }

          - root_block_device {
              - delete_on_termination = true -> null
              - device_name           = "/dev/xvda" -> null
              - encrypted             = false -> null
              - iops                  = 100 -> null
              - tags                  = {} -> null
              - throughput            = 0 -> null
              - volume_id             = "vol-04e49c1ed6699c838" -> null
              - volume_size           = 8 -> null
              - volume_type           = "gp2" -> null
            }
        }

    Plan: 0 to add, 0 to change, 7 to destroy.

    Do you really want to destroy all resources?
      Terraform will destroy all your managed infrastructure, as shown above.
      There is no undo. Only 'yes' will be accepted to confirm.

      Enter a value: yes

    aws_route_table_association.a: Destroying... [id=rtbassoc-01d3e3f930046f5bc]
    aws_instance.hello-isntance: Destroying... [id=i-0f2dceb998f47c054]
    aws_route_table_association.a: Destruction complete after 2s
    aws_route_table.Hello_Public_Route_Table: Destroying... [id=rtb-0dc2d40297c7c76b1]
    aws_route_table.Hello_Public_Route_Table: Destruction complete after 2s
    aws_internet_gateway.Hello_IGW: Destroying... [id=igw-0594754f298c08708]
    aws_instance.hello-isntance: Still destroying... [id=i-0f2dceb998f47c054, 10s elapsed]
    aws_internet_gateway.Hello_IGW: Still destroying... [id=igw-0594754f298c08708, 10s elapsed]
    aws_instance.hello-isntance: Still destroying... [id=i-0f2dceb998f47c054, 20s elapsed]
    aws_internet_gateway.Hello_IGW: Still destroying... [id=igw-0594754f298c08708, 20s elapsed]
    aws_internet_gateway.Hello_IGW: Destruction complete after 23s
    aws_instance.hello-isntance: Still destroying... [id=i-0f2dceb998f47c054, 30s elapsed]
    aws_instance.hello-isntance: Destruction complete after 35s
    aws_subnet.Hello_Public_Subnet: Destroying... [id=subnet-04fb9d1a931453e7b]
    aws_security_group.Hello_Security_Group: Destroying... [id=sg-086216425404b38ee]
    aws_security_group.Hello_Security_Group: Destruction complete after 2s
    aws_subnet.Hello_Public_Subnet: Destruction complete after 2s
    aws_vpc.Hello_VPC: Destroying... [id=vpc-05c18fa79e3cf13bb]
    aws_vpc.Hello_VPC: Destruction complete after 1s

    Destroy complete! Resources: 7 destroyed.
    ```

## Demo do autor

[Vídeo com a demonstração do Hello World](https://youtu.be/tP8png215tE)
