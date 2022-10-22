import numpy as np
import scipy.signal as signal



def conv(a,b):
    # zeros_add = np.zeros(len(b))
    # embedded_a = np.array([zeros_add, a,zeros_add])
    # for i in range(len(a)):
    #     for j in range(len(b)):
    #
    return np.convolve(a,b)


random_bit = np.where(np.random.normal(size = (20))<0,0,1)
GWNS =np.random.normal(size=(random_bit.shape))

recieved_input = GWNS+ random_bit

filter = np.flip(np.array([0,0,1,0,0]))
print(f"random_bit: {random_bit}")
print(f"GWNS+ random_bit : {GWNS+ random_bit}")

print(f"reverse: {filter}")

print(f"convolve : {conv(recieved_input, filter)}")

