file_bytes = './bytecode.txt'
file_data = './original_data_bytecode.txt'
mif_file = './mem.mif'
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

if __name__ == "__main__":
    # Read the file line by line
    with open(file_bytes, 'r') as bytecode:
        for line in bytecode:
            line = line.strip()  # Remove leading/trailing whitespace and newlines
            line = line.split(':\t')
            if (len(line) > 1):
                addr = format_addr(line)
                word = format_word(line)
                splitted_word = split_word(addr, word)
                lines += splitted_word
    
    with open(file_data, 'r') as data:
        for line in data:
            addr = lines[-1][0]
            addr = int(addr, HEX)
            addr += 1
            line = line.strip()
            line = line[2:]
            line = line.zfill(8)
            splitted_data = split_word(hex(addr), line)
            lines += splitted_data

    
    with open(mif_file, 'a') as mif:
        for line in lines:
            mif.write('\t' + line[0].upper() + "  :   " + line[1] + ";\n")
        
        next_addr = int(lines[-1][0], HEX) + 1
        next_addr = hex(next_addr)
        last_addr = '5FFFF'
        mif.write('\t[' + next_addr[2:].upper() + ".." + last_addr + "]  :   AA;\n")
        mif.write('END;')

