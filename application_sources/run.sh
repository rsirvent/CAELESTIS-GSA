rm -rf compss* ./results ./SIMULATIONS ./tmp.*
NAMEFILE=GSA_OHT_Validation_D2_symm.yaml
WORKFLOW_FOLDER=$PWD/../inputs/
EXECUTION_FOLDER=$PWD
NUM_NODES=28
EXEC_TIME=30
PROJECT_NAME=bsc19
QOS=gp_debug
INSTALL_DIR=$PWD/../Workflows/
DATA_DIR=$PWD/../inputs/

export ALYA_BIN=/apps/GPP/COMPSs/TUTORIALS/CAELESTIS-GSA/alya/Alya_mn5gccv3.x
export ALYA_PROCS=28
export ALYA_PPN=112

module purge
# python and COMPSs modules
export COMPSS_PYTHON_VERSION=3.12.1
module load COMPSs/3.4

module unload intel impi
# alya modules
module load gcc/13.2.0 openmpi/4.1.5-gcc
# gmsh modules
module load intel gmsh/4.12.2

export COMPSS_MPIRUN_TYPE=ompi
export PYTHONPATH=/apps/GPP/COMPSs/TUTORIALS/CAELESTIS-GSA/site-packages:$INSTALL_DIR:$PYTHONPATH

# shellcheck disable=SC2164
enqueue_compss -z --provenance=CAELESTIS-GSA.yaml --provenance_folder=FINAL_CAELESTIS-GSA_28_NODES_MN5 --project_name=$PROJECT_NAME --job_name=PROV_CAELESTIS-GSA --output_profile=$EXECUTION_FOLDER/results/time --worker_working_dir=$PWD --scheduler=es.bsc.compss.scheduler.orderstrict.fifo.FifoTS --job_execution_dir=$EXECUTION_FOLDER --qos=$QOS --exec_time=$EXEC_TIME --pythonpath=$PYTHONPATH --num_nodes=$NUM_NODES --worker_in_master_cpus=112 $INSTALL_DIR/WORKFLOWS/api.py $WORKFLOW_FOLDER/$NAMEFILE $EXECUTION_FOLDER $DATA_DIR

echo DONE

