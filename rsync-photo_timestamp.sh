#!/bin/bash
rsync -ae ssh --progress --ignore-existing  edzob@192.168.0.135:/home/edzob/Projects/photo_scale_timestamp_script/photo_timestamp/ photo_timestamp/
