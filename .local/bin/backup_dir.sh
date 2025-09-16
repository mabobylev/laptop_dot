#!/usr/bin/env  bash

SOURCE_DIR="/home/bma/Pictures/Wallpapers/"
BACKUO_DIR="/home/bma/Temp/"
TIMESTAMP=$(date +'%Y%m%d%H%M%S')
tar -czvf "$BACKUO_DIR/backup_$TIMESTAMP.tar.gz" "$SOURCE_DIR"
echo "Completes successfully!"
