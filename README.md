import os
import pandas as pd
from datetime import datetime

# Define the shared path and today's folder name
share_path = "\\Mumchfn\tech"
today_folder = datetime.now().strftime("%d-%m-%Y")
today_path = os.path.join(share_path, today_folder)

# Check if today's folder exists
if not os.path.exists(today_path):
    print(f"Folder for today ({today_folder}) does not exist at {share_path}.")
else:
    print(f"Checking files in folder: {today_path}\n")

    # Iterate through Excel files in the folder
    for file_name in os.listdir(today_path):
        if file_name.endswith(".xlsx"):
            file_path = os.path.join(today_path, file_name)
            try:
                # Read the Excel file
                df = pd.read_excel(file_path)

                # Count non-empty values in Column A
                if 'A' in df.columns:
                    count = df['A'].count()
                else:
                    count = 0

                print(f"File: {file_name} | Count in Column A: {count}")
            except Exception as e:
                print(f"Failed to process file: {file_name}. Error: {str(e)}")
