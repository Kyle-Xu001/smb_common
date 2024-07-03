import pandas as pd
import sys

# Ensure the correct number of arguments
if len(sys.argv) != 2:
    print("Usage: python drop_last_col.py <csv_file>")
    sys.exit(1)

# Get the CSV file name from command-line arguments
csv_file = sys.argv[1]

# Read the CSV file
df = pd.read_csv(csv_file)

# Drop the last column
df = df.iloc[:, :-1]

# Save the modified DataFrame to a new CSV file
output_file = 'team1_detected_artifacts.csv'

df.to_csv(output_file, index=False)

print(f"Modified CSV saved as {output_file}")
