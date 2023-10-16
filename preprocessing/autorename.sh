#!/bin/bash

images_dir="C:/Users/kalzm/Documents/dataset/masques"     # Remplacez par le chemin du répertoire d'images
masks_dir="C:/Users/kalzm/Documents/dataset/images"       # Remplacez par le chemin du répertoire de masques
output_images_dir="C:/Users/kalzm/Documents/dataset/renamed_masks"    # Répertoire de sortie pour les images
output_masks_dir="C:/Users/kalzm/Documents/dataset/renamed_images"      # Répertoire de sortie pour les masques

# Créez les répertoires de sortie s'ils n'existent pas
mkdir -p "$output_images_dir"
mkdir -p "$output_masks_dir"

# Compteur initial
compteur=1
image_counter=0

# Boucle pour renommer les fichiers
for image_file in "$images_dir"/*; do
    if [ -f "$image_file" ]; then
        if [ $image_counter -ge 1500 ]; then
            break  # Arrêtez le processus après avoir renommé 1500 images
        fi

        mask_file="$masks_dir/$(basename "$image_file")"  # Obtenez le nom du masque correspondant
        extension="${image_file##*.}"
        
        # Créez un nouveau nom de fichier avec le compteur
        nouveau_nom="$compteur.$extension"
        
        # Copiez les fichiers dans les répertoires de sortie respectifs
        cp "$image_file" "$output_images_dir/$nouveau_nom"
        cp "$mask_file" "$output_masks_dir/$nouveau_nom"
        
        compteur=$((compteur + 1))
        image_counter=$((image_counter + 1))
    fi
done

echo "Renommage terminé. Les fichiers renommés se trouvent dans $output_images_dir (images) et $output_masks_dir (masques)."
