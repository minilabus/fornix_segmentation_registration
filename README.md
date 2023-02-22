# fornix_segmentation_registration
Simple template based segmentation of the fornix (aging and healthy template)

Both aging and healthy commands works the same. The bash script requires you to naviguate to a folder with the data, the filename used in the example are placeholder (fa.nii.gz and tracking.trk) and then you call the script with:
```
bash ${PATH_TO_HEALTHY_DIR}/example_healthy_cmd.sh ${YOUR_PREFIX} and should output the Fornix as a whole, and the left/right version.
```

The folders both contains an FX template (Recobundles Style) linked to the original data/project, could be useful to keep around if needed.