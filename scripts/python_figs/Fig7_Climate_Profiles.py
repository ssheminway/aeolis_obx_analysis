# -*- coding: utf-8 -*-
"""
Created on Tue Dec  5 15:24:14 2023

@author: sshem
"""

import os
import numpy as np
import pandas as pd
import netCDF4 as nc
import matplotlib.pyplot as plt
from matplotlib import colors
from scipy.interpolate import interp2d

baseFolder = r'C:\\Users\sshem\\\Downloads\\Thesis_Data'
os.chdir(baseFolder)

#--- Load Data ----------------------------------------------------------------

simFolder1 = r"C:\Users\sshem\Downloads\Thesis_Data\ModDay_Veg_Baseline\simulation00033"
os.chdir(simFolder1)

run1 = 'aeolis.nc'
fnA = run1

dsA = nc.Dataset(fnA)
zbA = np.squeeze(dsA['zb'][:])
xA = np.squeeze(dsA['x'][:])
qsA = dsA['qs'][:]
dsA.close()

simFolder2 =r"C:\Users\sshem\Downloads\Thesis_Data\LowRisk_Veg_Baseline\simulation00033"
os.chdir(simFolder2)
run2 = 'aeolis.nc'
fnB = run2

dsB = nc.Dataset(fnB)
zbB = np.squeeze(dsB['zb'][:])
xB = np.squeeze(dsB['x'][:])
qsB = dsB['qs'][:]
dsB.close()
dx = 0.5

simFolder3 =r"C:\Users\sshem\Downloads\Thesis_Data\HighRisk_Veg_Baseline\simulation00033"
os.chdir(simFolder3)
run3 = 'aeolis.nc'
fnC = run3

dsC = nc.Dataset(fnC)
zbC = np.squeeze(dsC['zb'][:])
xC = np.squeeze(dsC['x'][:])
qsC = dsC['qs'][:]
dsC.close()
dx = 0.5

#----Plot Profiles -----------------------------------------------------------

import matplotlib as mpl
fig = plt.figure(figsize=(9,4))
mpl.rcParams['xtick.labelsize'] = 14
mpl.rcParams['ytick.labelsize'] = 14
ax1 = fig.add_subplot()

ztest = zbA[-1,:,:]
ztest1  = zbA[0,:,:]
ztest3 = zbB[-1,:,:]
ztest4 = zbC[-1,:,:]

ax1.plot(xA[1,:], zbA[0,1,:], linewidth=2.0, color = '#000000',linestyle = '--', label= 'Initial Profile')
ax1.plot(xA[1,:], zbA[-1,1,:], linewidth=2.0, color = '#000000', label='Modern Day Conditions')
ax1.plot(xA[1,:], zbB[-1,1,:], linewidth=2.0, color = '#EDB120', label='Low-Risk Climate')
ax1.plot(xA[1,:], zbC[-1,1,:], linewidth=2.0, color = 'r', label='High-Risk Climate')
ax1.set_xlabel('Cross-Shore Distance (m)', fontsize = 16, fontweight = 'bold')
ax1.set_ylabel('Elevation (m)',fontsize = 16, fontweight = 'bold')

plt.yticks(fontsize = 16, fontweight = 'bold')
plt.xticks(fontsize = 16, fontweight = 'bold')

plt.grid('True')
plt.xlim(0, 53)
plt.ylim(0, 7.1)
plt.subplots_adjust( bottom=0.1, left=0.1, right=0.95)
plt.tight_layout()

legend = plt.legend(loc='lower right', fontsize = 14)
for text in legend.get_texts():
    text.set_fontweight('bold')

os.chdir(baseFolder)
plt.savefig('Erosion_prof', dpi=300)
