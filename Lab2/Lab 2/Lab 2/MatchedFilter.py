import numpy as np
import scipy.signal as signal
import matplotlib.pyplot as plt


def corr(a,b):
    zeros_add = np.zeros(len(b))
    embedded_a= np.concatenate((zeros_add, a,zeros_add), axis = 0)
    output = np.zeros(len(a)+ len(b)-1)
    for i in range(len(output)):
        for j in range(len(b)):
            val1= embedded_a[i+j]
            val2 = b[j]
            output[i] += embedded_a[i+j]* b[j]

    return output

def conv(a,b):
    zeros_add = np.zeros(len(b))
    embedded_a= np.concatenate((zeros_add, a,zeros_add), axis = 0)
    output = np.zeros(len(a)+ len(b)-1)
    #TODO: add flipping!
    for i in range(len(output)):
        for j in range(len(b)):
            val1= embedded_a[i+j]
            val2 = b[j]
            output[i] += embedded_a[i+j]* b[j]

    return output


def generate_seq(input, num =3):
    arr = np.array([input for _ in range(num)])

    return arr.flatten()

add_noise = True

random_bit = np.where(np.random.normal(size = (100))<0,0,1)
generated_sqeuence = generate_seq(random_bit)

GWNS =np.random.normal(size=(generated_sqeuence.shape)) if add_noise else np.zeros((generated_sqeuence.shape))


recieved_input = GWNS+ generated_sqeuence

filter = np.flip(np.array([0,0,1,0,0]))
print(f"random_bit: {random_bit}")
print(f"GWNS+ random_bit : {GWNS+ generated_sqeuence}")

print(f"reverse: {filter}")
convold = conv(recieved_input, random_bit)
print(f"convolve : {convold}")

plt.bar(np.arange(0,len(convold)),convold/convold.max())


plt.show()
