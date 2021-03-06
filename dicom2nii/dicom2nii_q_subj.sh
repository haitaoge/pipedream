# Wrapper script for sending dicom2nii.sh job to the queue
#
# args: ${DICOM2NIIDIR} ${INPUT_BASE_DIR} ${SUBJECT} ${TIME_POINT} ${PROTOCOL_LIST} ${OUTPUT_BASE_DIR} $HOME 
DICOM2NIIDIR=$1
INPUT_BASE_DIR=$2
SUBJECT=$3
TIME_POINT=$4
PROTOCOL_LIST=$5
OUTPUT_BASE_DIR=$6
HOME=$7
DELAY=$8

# Needed because voxbo doesn't know your home directory
# which wouldn't matter except that dcm2nii insists on writing there
export HOME

echo "Running on $HOSTNAME"

if [[ $DELAY -gt 0 ]]; then

  RANDOM=$JOB_ID

  delay="$((RANDOM%23)).$((RANDOM%10000))"

  echo "sleeping for $delay s to avoid file write collisions that crash dcm2nii"

  sleep $delay

fi
 
cmd="${DICOM2NIIDIR}/dicom2nii.sh ${INPUT_BASE_DIR} ${SUBJECT} ${TIME_POINT} ${PROTOCOL_LIST} ${OUTPUT_BASE_DIR}"

echo $cmd

$cmd

