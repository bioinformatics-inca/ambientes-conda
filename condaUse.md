Utilizando programas no ambiente CONDA

Estes comandos devem ser incluídos em seus scripts de submissão do slurm
module load miniconda3
# Carregue o ambiente conda
eval "$(conda shell.bash hook)"
# Carregue o ambiente onde foi instalado o programa
conda activate /path/to/your/environment
# Execute o programa e depois desative o ambiente
conda deactivate
