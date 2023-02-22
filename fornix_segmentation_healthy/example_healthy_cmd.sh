SEG_DIR=$(dirname ${BASH_SOURCE[0]})
OUT_PREFIX=${1}

antsRegistrationSyN.sh -d 3 -m ${SEG_DIR}/template_fa.nii.gz -f fa.nii.gz -o output_h
antsApplyTransforms -d 3 -i ${SEG_DIR}/fornix_roi_atlas_healthy.nii.gz -r fa.nii.gz -n NearestNeighbor \
	-o fornix_roi_atlas_healthy_warped.nii.gz -t output_h1Warp.nii.gz output_h0GenericAffine.mat -u char
# If -u char does not exist, use scil_image_math.py convert ${IMG} ${IMG} --data_type uint8 -f

scil_filter_tractogram.py tracking.trk ${OUT_PREFIX}_FX.trk --atlas_roi fornix_roi_atlas_healthy_warped.nii.gz 1 any include \
	--atlas_roi fornix_roi_atlas_healthy_warped.nii.gz  "2 3" either_end include \
	--atlas_roi fornix_roi_atlas_healthy_warped.nii.gz 4 either_end include \
	--atlas_roi fornix_roi_atlas_healthy_warped.nii.gz  "5 6 7 8" any exclude -f

scil_filter_tractogram.py ${OUT_PREFIX}_FX.trk ${OUT_PREFIX}_FX_L.trk \
	--atlas_roi fornix_roi_atlas_healthy_warped.nii.gz  2 either_end include

scil_filter_tractogram.py ${OUT_PREFIX}_FX.trk ${OUT_PREFIX}_FX_R.trk \
	--atlas_roi fornix_roi_atlas_healthy_warped.nii.gz  3 either_end include

rm output_h*.*

