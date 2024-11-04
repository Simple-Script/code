import os
import requests
import zipfile

# Define the URL of the file to download
url = 'http://example.com/file.zip'
# Define the path to save the downloaded file
download_path = os.path.join(os.path.expanduser('~'), 'Downloads', 'file.zip')
# Define the path to extract the contents
extract_path = os.path.join(os.path.expanduser('~'), 'Desktop', 'extracted_files')

# Download the file
response = requests.get(url)
with open(download_path, 'wb') as file:
    file.write(response.content)

# Unzip the file
with zipfile.ZipFile(download_path, 'r') as zip_ref:
    os.makedirs(extract_path, exist_ok=True)
    zip_ref.extractall(extract_path)

# Optionally, remove the downloaded zip file
os.remove(download_path)
