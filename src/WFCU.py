import os, sys
from PIL import Image

file_path = sys.argv[1]  # Get file path and name
file_dir = os.path.dirname(file_path)  # Get the directory of the original file
file_name = os.path.splitext(os.path.basename(file_path))[0]  # Get the file name without extension
file_export_type = sys.argv[2]  # Get the file export type

img = Image.open(file_path)  # Open the file (to memory)

# Convert to RGB if exporting to a format that doesn't support transparency
if file_export_type.lower() in (".jpg", ".jpeg", ".bmp", ".tiff", ".tif", ".ico"):
    img = img.convert("RGB")

output_path = os.path.join(file_dir, f"{file_name}{file_export_type}")  # Save in the same folder as the original
img.save(output_path)  # Save the file