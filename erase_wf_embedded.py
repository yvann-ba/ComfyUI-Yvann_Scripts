import os
import ffmpeg
from PIL import Image

def process_mp4(file_path):
    temp_file_path = f"{file_path}.tmp.mp4"
    try:
        (
            ffmpeg
            .input(file_path)
            .output(temp_file_path, map_metadata=-1, c='copy')
            .run(overwrite_output=True)
        )
        os.replace(temp_file_path, file_path)
        print(f"Processed: {file_path}")
    except ffmpeg.Error as e:
        print(f"Error processing {file_path}: {e}")
        if os.path.exists(temp_file_path):
            os.remove(temp_file_path)

def process_png(file_path):
    try:
        image = Image.open(file_path)
        data = list(image.getdata())
        image_without_metadata = Image.new(image.mode, image.size)
        image_without_metadata.putdata(data)
        image_without_metadata.save(file_path, format='PNG')
        print(f"Processed: {file_path}")
    except Exception as e:
        print(f"Error processing {file_path}: {e}")

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            file_path = os.path.join(root, file)
            if file.lower().endswith('.mp4'):
                process_mp4(file_path)
            elif file.lower().endswith('.png'):
                process_png(file_path)

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python remove_metadata.py <directory>")
        sys.exit(1)
    
    directory = sys.argv[1]
    process_directory(directory)
