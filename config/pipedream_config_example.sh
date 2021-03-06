#
# This is an example config file - copy this to /path/to/pipedream/config/pipedream_config.sh
# and edit as needed
#

# === SOFTWARE DEPENDENCIES ===
#
# PipeDream depends on various open source software
#
# Not all dependencies are required at all stages of processing. 
#

# Fill in the variables below with the full path to the binaries

# ====== DICOM TOOLS =======
#
# dcm2nii is part of mricron by Chris Rorden
# http://www.nitrc.org/projects/mricron
#
# Directory where dcm2nii lives
export DCM2NIIPATH=""
#
# GDCM (Grassroots DiCoM) is a C++ library for DICOM medical files
# http://sourceforge.net/projects/gdcm/
#
# Directory where gdcmdump etc live
#
export GDCMPATH=""
#
# Path to directory containing XML files needed by GDCM (Part3.xml etc). Usually in gdcm/Source/InformationObjectDefinition
export GDCM_RESOURCES_PATH=""


# ====== IMAGE PROCESSING TOOLS ======
#
# ANTS contains advanced tools for image registration and segmentation. 
# 
# http://stnava.github.io/ANTs/
#
# ANTSPATH must end with a trailing /
export ANTSPATH=""
#
# Camino is a diffusion imaging toolkit
# 
# http://camino.org.uk
#
export CAMINOPATH=""
#
# Java is required by Camino
export JAVAPATH=""
#
# Control maximum memory usage by Camino, in Mb
export CAMINO_HEAP_SIZE=1100



#
# === GENERAL CONFIGURATION OPTIONS ===
#
# Maximum number of threads used by ITK programs (ie, ANTS).
# To avoid overloading cluster machines with multiple threads, set this to 1
# 
# Increasing this number will let ITK use more threads, which can make
# processing faster
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1


# === PARALLEL PROCESSING OPTIONS ===
#
# For SGE users
#
# The qsub commmand that will be invoked by pipedream. Include path information and
# options such as -q that may be necessary. Beware that some options, like -o or -S,
# may be set at run time by pipedream programs. Some recommended options:
#
# -q   Restrict submission to a particular queue, useful for limiting the number of
#      concurrent jobs
#
# -p   Set job priority, another way to avoid being a cluster hog
#
# -P   Set project for job, used on clusters where CPU time is controlled by project
#
# -v   Pass environment variable to the job.
#
# -V   Pass current environment (all variables) to the job.
#
# See the man page for qsub for more detail.
#
export PIPEDREAMQSUB="qsub"
#
# For Voxbo users
#
# The Voxbo vbbatch commmand that will be invoked by pipedream. Include path information 
# and options that may be necessary.
#
PIPEDREAMVBBATCH="vbbatch"

return 0
