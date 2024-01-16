# Instalando programas com CONDA package manager no cluster HPC

0 - Antes de iniciar qualquer procedimento, sugerimos que o usuário inicie uma sessão interativa através do SLURM:

~~~
srun --pty bash -i
~~~

Estando em um nó computacional, você pode instalar e testar seus pacotes no mesmo ambiente em que serão executados os scripts.


## Miniconda

Utilize o módulo do Miniconda para criar um ambiente virtual exclusivo para o programa ou pipeline completo

1 - Carregue o módulo do miniconda3
~~~
module load miniconda3
~~~

2 - Informe o sistema onde encontrar as ferramentas de ativação do conda 
~~~
eval "$(conda shell.bash hook)"
~~~

3 - Crie o ambiente (estrutura de diretórios e arquivos de configuração) onde serão instalados os pacotes usando o comando ``conda create``
~~~
conda create --prefix /ENDERECO-DO-SEU-PROJETO/lib/conda_envs/meuenvironment
~~~

4 - Ative este ambiente usando o comando ``conda activate`` e informando o endereço do ambiente
~~~
conda activate /ENDERECO-DO-SEU-PROJETO/lib/conda_envs/meuenvironment
~~~

5 - Instale os pacotes usando o comando ``conda install``
~~~
conda install bwa samtools bedtools
~~~

6 - Teste seu ambiente verificando onde os executáveis são encontrados e se eles funcionam
~~~
which bwa

bwa --help
~~~

7 - Desative o seu ambiente conda
~~~
conda deactivate
~~~






## Programas de bioinformática

### Bioconda

Veja se o programa está disponível no repositório Bioconda

https://bioconda.github.io/conda-package_index.html

Obs: A configuração padrão de usuários da plataforma já inclui o repositório bioconda na busca por pacotes. (Está configurado no arquivo ~/.condarc )
Você pode verificar se o canal bioconda está configurado no seu perfil usando o comando:
~~~
conda config --show channels
~~~

Estando lá, basta instalar o programa conforme descrito no passo 5 acima.


### Arquivo YML

Outra forma de instalação de pacotes conda é informando um arquivo descritivo do ambiente. Alguns grupos de desenvolvedores de programas de bioinformática distribuem as receitas de seus ambientes em arquivos **.yml**

Exemplo de arquivo do pacote QIIME (https://docs.qiime2.org/2023.9/install/native/)
~~~
$ head -20 qiime2-amplicon-2023.9-py38-linux-conda.yml 
channels:
- https://packages.qiime2.org/qiime2/2023.9/amplicon/released
- bioconda
- conda-forge
- defaults
dependencies:
- _libgcc_mutex=0.1
- _openmp_mutex=4.5
- _r-mutex=1.0.1
- alsa-lib=1.2.8
- altair=5.1.2
- anyio=4.0.0
- appdirs=1.4.4
- argcomplete=3.1.2
- argon2-cffi=23.1.0
- argon2-cffi-bindings=21.2.0
- arrow=1.3.0
- astor=0.8.1
- asttokens=2.4.0
- atpublic=3.0.1
[...]
~~~



Considerando que você já tenha recebido o arquivo yml, você pode criar um novo ambiente e já instalar todas as dependências em um único comando:
~~~
conda env create --prefix /ENDERECO-DO-SEU-PROJETO/lib/conda_envs/qiime2-amplicon-2023.9 --file qiime2-amplicon-2023.9-py38-linux-conda.yml 
~~~



## Mamba

Uma ferramenta derivada do conda chamada mamba foi aperfeiçoada para acelerar a instalação de pacotes. 
Caso esteja observando que o conda demora muito até encontrar os pacotes para serem instalados, você pode instalar o mamba pelo conda dentro do seu ambiente e usá-lo para instalar seus pacotes.

1 - Siga os passos de 0 a 4 da sessão miniconda

5 - Agora instale o mamba no seu ambiente conda
~~~
conda install mamba
~~~

6 - Verifique a instalação
~~~
which mamba

mamba --help
~~~

7 - Use o mamba para instalar os programas
~~~
mamba install star
~~~

.

E seja feliz!
