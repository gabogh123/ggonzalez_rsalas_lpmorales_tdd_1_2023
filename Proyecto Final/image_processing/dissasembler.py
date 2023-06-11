file_path = './bytecode.txt'  # Replace with the actual file path
HEX = 16
BYTES = 4 #bytes in word
lines = []  # Empty list to store the lines

def format_addr(line):
    return '0x' + line[0].upper()

def format_word(line):
    word = line[1]
    word = word.split(' ')
    return word[0]
    
def split_word(addr, word):
    splited_word = []
    addr = int(addr, HEX)
    for i in range(BYTES):
        addr_i = addr + i
        addr_i = hex(addr_i)
        addr_i = addr_i[2:]
        addr_i = addr_i.zfill(5)
        start = i * 2
        end = start + 2
        byte_i = word[start:end]
        byte_i = byte_i.upper()
        splited_word.append([addr_i, byte_i])
    return splited_word

# Print the lines
# for line in lines:
#     print(line)

# print(len(lines))

if __name__ == "__main__":
    # Read the file line by line
    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()  # Remove leading/trailing whitespace and newlines
            line = line.split(':\t')
            if (len(line) > 1):
                addr = format_addr(line)
                word = format_word(line)
                splitted_word = split_word(addr, word)
                lines += splitted_word
    
    for line in lines:
        print(line)