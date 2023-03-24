#!/bin/bash

mkdir -p prompts
# Loop through all JSON files in the folder
for json_file in *.json; do
  description=$(jq -r '.description_for_model' "$json_file")

  # Get the filename without the .json extension
  base_filename=$(basename "$json_file" .json)

  # Construct the output filename
  output_filename="prompts/$base_filename-description_for_model.txt"

  # Write the extracted description to the output file
  echo "$description" > "$output_filename"
done
