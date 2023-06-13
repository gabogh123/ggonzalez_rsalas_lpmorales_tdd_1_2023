def hex_to_binary(hex_string):
    decimal = int(hex_string, 16)
    binary = bin(decimal)[2:]  # Remove the '0b' prefix
    return binary.zfill(8)  # Pad with leading zeros if necessary

file_path = "./hex_to_bin_mif.txt"  # Prompt for the file path
output_file = "new_mif_4.txt"  # Prompt for the output file name

output = []  # List to store the converted binary values

with open(file_path, 'r') as file:
    for line in file:
        line = line.strip()  # Remove leading/trailing whitespace
        if len(line) >= 7:  # Ensure the line has at least 7 characters
            sixth_char = line[6]
            seventh_char = line[7]
            hex_value = sixth_char + seventh_char
            binary_value = hex_to_binary(hex_value)
            output.append(binary_value)
            #print(binary_value)

# Write the binary values to the output file

while len(output) < 393216:
    output.append('10101010')



# Write the binary values to the output file
with open(output_file, 'w') as file:
    for binary in output:
        file.write(binary + '\n')



print(f"Binary values written to '{output_file}' successfully!")

