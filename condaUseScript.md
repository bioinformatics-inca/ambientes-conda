# Utilizando programas do ambiente CONDA em seus scripts de submissão do SLURM

Estes comandos devem ser incluídos em seus scripts de submissão do SLURM.

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


4 - Registre onde os executáveis são encontrados

~~~
which fastqc
~~~

5 - Execute o programa com os argumentos necessários. Por exemplo:

~~~
fastqc -t $THREADS $FASTQ
~~~

PS: as variáveis (ex: ``$THREADS $FASTQ``) devem ser definidas anteriormente no seu script. 



6 - Desative o seu ambiente conda
~~~
conda deactivate
~~~


