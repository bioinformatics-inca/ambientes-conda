# Utilizando programas de forma interativa no ambiente CONDA

Estes comandos devem ser executados para usar interativamente o ambiente com seus programas instalados.


0 - Antes de executar suas análises, inicie uma sessão interativa através do SLURM:
~~~
srun --pty bash -i
~~~

PS: a diretiva ``--exclusive=user`` solicita ao SLURM uma sessão em nó compartilhado apenas com sessões do mesmo usuário. Importante quando a tarefa exige muitos recursos computacionais, evitando que as tarefas de outros usuários sejam prejudicadas. Não usar esta diretiva no shark.

.


1 - Carregue o módulo do miniconda3

~~~
module load miniconda3
~~~

2 - Informe o sistema onde encontrar as ferramentas de ativação do conda

~~~
eval "$(conda shell.bash hook)"
~~~

3 - Carregue o ambiente onde foi instalado o programa

~~~
conda activate /ENDERECO-DO-SEU-PROJETO/lib/conda_envs/meuenvironment
~~~


4 - Teste seu ambiente verificando onde os executáveis são encontrados e se eles funcionam

~~~
which fastqc

fastqc --help
~~~

5 - Execute o programa com os argumentos necessários

~~~
fastqc seqfile1 seqfile2 seqfileN
~~~


6 - Desative o seu ambiente conda
~~~
conda deactivate
~~~



