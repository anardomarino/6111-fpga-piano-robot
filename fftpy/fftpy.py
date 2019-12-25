# -*- coding: utf-8 -*-
"""
Created on Sat Nov  9 19:38:16 2019

@author: mhare
"""

import pyaudio
import wave
import numpy as np
import wav_utils
import pandas
from numpy.fft import fft as nfft
from numpy.fft import ifft as nifft
import time

import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from math import e, pi, sin, cos, log
j = 1j

def fft(x):
    return (nfft(x)/len(x)).tolist()

def ifft(x):
    return (nifft(x)*len(x)).tolist()

def mic_in(name,seconds,rate):
    FORMAT = pyaudio.paInt16
    CHANNELS = 1
    RATE = rate
    CHUNK = 1024
    RECORD_SECONDS = seconds
    WAVE_OUTPUT_FILENAME = name

    audio = pyaudio.PyAudio()

    # start Recording
    stream = audio.open(format=FORMAT, channels=CHANNELS,
                    rate=RATE, input=True,
                    frames_per_buffer=CHUNK)
    print("recording...")
    frames = []

    for i in range(0, int(RATE / CHUNK * RECORD_SECONDS)):
        data = stream.read(CHUNK)
        frames.append(data)
    print("finished recording")


    # stop Recording
    stream.stop_stream()
    stream.close()
    audio.terminate()

    waveFile = wave.open(WAVE_OUTPUT_FILENAME, 'wb')
    waveFile.setnchannels(CHANNELS)
    waveFile.setsampwidth(audio.get_sample_size(FORMAT))
    waveFile.setframerate(RATE)
    waveFile.writeframes(b''.join(frames))
    waveFile.close()

def read_in(name):
    file = Wave.from_file(name)
    file.plot()
    samples=file.samples
    return samples

def stft(x, window_size, step_size, sample_rate):
    nsteps = (len(x)-window_size)//step_size + 1
    return [fft([a*b for a,b in zip(x[i*step_size:i*step_size+window_size],np.hanning(window_size))]) for i in range(nsteps)]

def k_to_hz(k, window_size, step_size, sample_rate):
    # return the frequency in Hz associated with bin number k in an STFT with
    # the parameters given above.
    return k*sample_rate/(window_size)


def hz_to_k(freq, window_size, step_size, sample_rate):
    # return the k value associated with the given frequency in Hz, in an STFT
    # with the parameters given above, rounded to the nearest integer.
    return round(freq*window_size/(sample_rate))


def timestep_to_seconds(i, window_size, step_size, sample_rate):
    # return the real-world time in seconds associated with the center of the
    # ith window in an STFT using the parameters given above, rounded to the
    # nearest .01 seconds.
    return round(i*step_size/sample_rate,2)


def transpose(x):
    return [[i[j] for i in x] for j in range(len(x[0]))]

def spectrogram(X, window_size, step_size, sample_rate):
    return [[abs(i)**2 for i in j] for j in transpose(X)]


def plot_spectrogram(sgram, window_size, step_size, sample_rate):
    # the code below will uses matplotlib to display a spectrogram.  it uses
    # your k_to_hz and timestep_to_seconds functions to label the horizontal
    # and vertical axes of the plot.
    # amplitudes are plotted on a log scale, since human perception of loudness
    # is roughly logarithmic.
    width = len(sgram[0])
    height = len(sgram)//2+1  # only plot values up to N/2

    plt.imshow([[log(i) if i !=0 else -30 for i in j] for j in sgram[:height+1]], aspect=width/height)
    plt.axis([0, width-1, 0, height-1])

    ticks = ticker.FuncFormatter(lambda x, pos: '{0:.1f}'.format(timestep_to_seconds(x, window_size, step_size, sample_rate)))
    plt.axes().xaxis.set_major_formatter(ticks)
    ticks = ticker.FuncFormatter(lambda y, pos: '{0:.0f}'.format(k_to_hz(y, window_size, step_size, sample_rate)))
    plt.axes().yaxis.set_major_formatter(ticks)

    plt.xlabel('time [s]')
    plt.ylabel('frequency [Hz]')

    plt.colorbar()
    plt.show()

def H(x):
    return (x + abs(x))/2

def spectral_difference(X):
    N = len(X[0])
    out = []
    for ix in range(len(X)):
        o = 0
        for k in range(N):
            if ix == 0:
                o += abs(X[ix][k])**2
            else:
                o += H(abs(X[ix][k]) - abs(X[ix-1][k]))**2
        out.append(o)
    return out

def find_peaks(x, threshold, min_spacing):
    x = x[:]
    out = []
    while True:
        p = max(range(len(x)), key=lambda i: x[i])
        if x[p] <= threshold:
            break
        out.append(p)
        for i in range(min_spacing):
            for index in {p-i, p+i}:
                if 0 <= index < len(x):
                    x[index] = 0
    return sorted(out)

def k_at_time(X, n, music_dictionary):
    valids=[j[1] for j in music_dictionary.values()]
    return max([i for i in range(len(x[n])) if i in valids], key=lambda ix: abs(X[n][ix])**2)

def mode(x):
    return max(x, key=lambda i: x.count(i))

def k_for_note(X, n_start, n_stop, music_dictionary):
    return mode([k_at_time(X, i, music_dictionary) for i in range(n_start+1, n_stop)])


def notes_ref_table(window_size, step_size, sample_rate):
    ref_table=pandas.read_excel('C:\\Users\\mhare\\Desktop\\Life\\MIT\\Course 6\\6.111\\Musical_Frequencies.xlsx',sheet_name='Sheet1')
    frequencies=list(ref_table.iloc[:,4].dropna())[1:]
    names = list(ref_table.iloc[:,2].dropna())[1:]
    octaves = list(ref_table.iloc[:,3].dropna())[1:]
    simple_names = [i.split(' ')[0] for i in names]
    full_names=[simple_names[i]+str(octaves[i]) for i in range(len(octaves))]
    music_dictionary = dict(zip(full_names, frequencies))


    for i in music_dictionary.keys():
        k=hz_to_k(music_dictionary[i], window_size, step_size, sample_rate)
        music_dictionary[i]=[music_dictionary[i], k]

    return music_dictionary

def instructions(x, peaks, music_dictionary, window_size, step_size, sample_rate):
    notes=[]
    for i in peaks:
        try:
            notes.append(k_for_note(x, i, i+20, music_dictionary))
        except IndexError:
            cap=len(x)-i-1
            notes.append(k_for_note(x, i, i+cap, music_dictionary))

    instructions=[]
    for i in range(len(notes)):
        for j in music_dictionary.keys():
            if music_dictionary[j][1]==notes[i]:
                onset=timestep_to_seconds(peaks[i], window_size, step_size, sample_rate)
                instructions.append([j,onset])
    return instructions

def play_back(music_dictionary, ins, samples, name):
    sr=44100
    notes=[i[0] for i in ins]
    times=[i[1] for i in ins]
    freqs=[music_dictionary[i][0] for i in notes]
    ns=[int(sr*i) for i in times]
    ns.append(len(samples))
    amps=[]
    for i in range(0,len(ns)-1):
        t=np.arange(ns[i],ns[i+1])/44100
        amps.extend(np.cos(freqs[i]*t*2*np.pi))
    w=Wave(amps,sr)
    w.save(name)

    chunk=1024
    wf = wave.open('C:\\Users\\mhare\\Desktop\\Life\\MIT\\Course 6\\6.111\\'+name, 'rb')

    # create an audio object
    p = pyaudio.PyAudio()

    # open stream based on the wave object which has been input.
    stream = p.open(format =
                    p.get_format_from_width(wf.getsampwidth()),
                    channels = wf.getnchannels(),
                    rate = wf.getframerate(),
                    output = True)

    # read data (based on the chunk size)
    data = wf.readframes(chunk)

    # play stream (looping from beginning of file to the end)
    start=time.time()
    while data != '':
        # writing to the stream is what *actually* plays the sound.
        stream.write(data)
        data = wf.readframes(chunk)
        end=time.time()
        if (end-start>=5):
            break

    # cleanup stuff.
    stream.close()
    p.terminate()

def highest(y):
    m=0
    for i in y:
        for j in i:
            a=j
            if (a>m):
                m=a
    return m

def fundamentals(music_dictionary,y, window_size, step_size, sample_rate):
    m=highest(y)
    ks=[i[1] for i in music_dictionary.values()]
    ks=list(set(ks))
    ks.sort()
    all_notes=[]
    for k in ks:
        times=y[k]
        note=[]
        for t in times:
            if (t>=.02*m):
                note.append(1)
            else:
                note.append(0)
        all_notes.append(note)

    whole=[]
    for n in range(len(all_notes)):
        sub=[i for i in music_dictionary.keys() if ks[n]==music_dictionary[i][1]]
        note = all_notes[n]
        subsub=[]
        for i in range(1,len(note)):
            if note[i]-note[i-1]==1:
                subsub.append(timestep_to_seconds(i, window_size, step_size, sample_rate))
            elif note[i]-note[i-1]==-1:
                subsub.append(timestep_to_seconds(i, window_size, step_size, sample_rate))
            if len(subsub)==2:
                sub.append(subsub)
                subsub=[]
        whole.append(sub)

    return whole

def chords(music_dictionary,y, window_size, step_size, sample_rate, peaks):
    valids=[j[1] for j in music_dictionary.values()]
    for time in peaks:
        powers={}
        for k in valids:
            power=0
            for i in range(20):
                power = power+abs(x[time+i][k])**2
            powers[(time,k_to_letter(music_dictionary, k))]=power/20
        high=max(powers.values())
        for key in powers.keys():
            if powers[key]>=.1*high:
                print(key, powers[key])
        #print(sorted(powers.items(), key = lambda kv:(kv[1], kv[0])))
        print('************************')

def k_to_letter(music_dictionary, k):
    for i in music_dictionary.keys():
        if music_dictionary[i][1] == k:
            return i

window_size = 8192
step_size = 256
sample_rate = 44100
name = 'test20.wav'
mic_in(name,5,44100)
samples=read_in(name)
x=stft(samples, window_size, step_size, sample_rate)
y=spectrogram(x, window_size, step_size, sample_rate)
plot_spectrogram(y, window_size, step_size, sample_rate)

music_dictionary=notes_ref_table(window_size, step_size, sample_rate)


print(music_dictionary)

#ins2=fundamentals(music_dictionary,y, window_size, step_size, sample_rate)

dif=spectral_difference(x)
plt.plot(dif)
plt.show()
peaks=find_peaks(dif,.00005,40)
print(peaks)

ins=instructions(x, peaks, music_dictionary, window_size, step_size, sample_rate)

chords(music_dictionary,y, window_size, step_size, sample_rate, peaks)

#play_back(music_dictionary, ins, samples, 'testback20.wav')


#print(instructions)
print('done')
#
#def main():
#    window_size = 8192
#    step_size = 256
#    sample_rate = 44100
#    name = 'test10.wav'
#    mic_in(name,5,44100)
#    samples=read_in(name)
#    x=stft(samples, window_size, step_size, sample_rate)
#    y=spectrogram(x, window_size, step_size, sample_rate)
#    plot_spectrogram(y, window_size, step_size, sample_rate)
#
#    music_dictionary=notes_ref_table(window_size, step_size, sample_rate)
#
#
#    print(music_dictionary)
#
#    instructions=fundamentals(music_dictionary,y, window_size, step_size, sample_rate)
#    print(instructions)
#    print('done')
#
#if __name__=="__main__":
#    main()
