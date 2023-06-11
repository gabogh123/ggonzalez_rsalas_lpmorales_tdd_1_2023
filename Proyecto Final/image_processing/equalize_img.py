
import cv2
import numpy as np

RGB_MAX = 256

FILE0 = './original_data_asm.txt'
FILE1 = './original_data_bytecode.txt'
FILE2 = './new_data.txt'

def dist_freq(values : np.array, pixels : np.array):
    """
    Compute distribution frecuencies of the colors present
    """
    frequencies = []
    for value in values:
        freq = np.count_nonzero(pixels == value)
        frequencies.append(freq)
    return frequencies

def dist_cum_freq(cum_freq: list):
    """
    Distrubute the cummulative frequency along all the list of colors
    """
    dist = cum_freq[-1] // RGB_MAX
    res = cum_freq[-1] % RGB_MAX
    dist_cum = np.ones(len(cum_freq)) * dist
    dist_cum[:res] += 1
    return dist_cum

def map_pixels(colors, cuf, cu_feq):
    mapped = []
    for color in colors:
        value = cuf[color]
        # mapped_value = cu_feq[np.abs(cu_feq-value).argmin()]
        mapped_value = np.abs(cu_feq-value).argmin()
        mapped.append(mapped_value)
    return mapped

def create_new_img(img, mapped_pixels):
    new_img = img
    rows = img.shape[0]
    cols = img.shape[1]
    for i in range(rows):
        for j in range(cols):
            current_color = img[i][j][0]
            c = mapped_pixels[current_color] # new color
            new_img[i][j] = [c, c, c]
    return new_img

def write_original_data_asm(data):
    content = 'original:\n\t.word '
    for pixel in data:
        content += str(pixel) + ", "
    content = content[:-2:]
    with open(FILE0, 'w') as file:
        file.write(content)

def write_original_data_b(data):
    content = ''
    for pixel in data:
        content += str(hex(pixel)) + "\n"
    content = content[:-1:]
    with open(FILE1, 'w') as file:
        file.write(content)

def write_new_data(data):
    content = ''
    for pixel in data:
        content += str(hex(pixel)) + "\n"
    content = content[:-1:]
    with open(FILE2, 'w') as file:
        file.write(content)

if __name__ == "__main__":

    img = cv2.imread('original.jpeg')
    print(img.shape)

    pixels = np.concatenate(img, axis=0)
    pixels = pixels[:,0] # use only one integer to describe RGB pixel

    write_original_data_asm(pixels)
    write_original_data_b(pixels)
    print(len(pixels))

    i = np.arange(RGB_MAX)
    f_i = dist_freq(i, pixels) # frequency distribution of each color
    cuf = np.cumsum(f_i, axis=0) # cummulative frequency
    feq = dist_cum_freq(cuf) #distribute uniformly the cummulative frequency
    cu_feq = np.cumsum(feq, axis = 0) # cummulative frequency
    
    mapped_pixels = map_pixels(i, cuf, cu_feq)
    new_img = create_new_img(img, mapped_pixels)
    # print(new_img)

    n_pixels = np.concatenate(new_img, axis=0)
    n_pixels = n_pixels[:,0] # use only one integer to describe RGB pixel

    write_new_data(n_pixels)

    # display image
    cv2.imshow("output", new_img)
    cv2.imwrite("output.png", new_img)