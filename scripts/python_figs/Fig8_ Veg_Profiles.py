# -*- coding: utf-8 -*-
"""
Created on Thu Nov 16 11:22:18 2023

@author: sshem
"""

import os
import numpy as np
import netCDF4 as nc
import matplotlib.pyplot as plt

#--------------- Load Data ----------------------------------------------------

baseFolder = r'C:\\Users\sshem\\\Downloads\\Thesis_Data\\ModDay_Veg_Uniform'
os.chdir(baseFolder)
simFolder1 = os.path.join(baseFolder, 'simulation00010')
os.chdir(simFolder1)

run1 = 'run00010.nc'
fnA = run1

dsA = nc.Dataset(fnA)
zbA = np.squeeze(dsA['zb'][:])
xA = np.squeeze(dsA['x'][:])
qsA = dsA['qs'][:]
dsA.close()

simFolder2 =os.path.join(baseFolder, 'simulation00073')
os.chdir(simFolder2)
run2 = 'run00073.nc'
fnB = run2

dsB = nc.Dataset(fnB)
zbB = np.squeeze(dsB['zb'][:])
xB = np.squeeze(dsB['x'][:])
qsB = dsB['qs'][:]
dsB.close()
dx = 0.5

simFolder3 =os.path.join(baseFolder, 'simulation00136')
os.chdir(simFolder3)
run3 = 'run00136.nc'
fnC = 'C:/Users/sshem/Downloads/Thesis_Data/ModDay_Veg_Uniform/simulation00136/run00136.nc'

dsC = nc.Dataset(fnC)
zbC = np.squeeze(dsC['zb'][:])
xC = np.squeeze(dsC['x'][:])
qsC = dsC['qs'][:]
dsC.close()
dx = 0.5

os.chdir("..")

baseFolder2 = r'C:\\Users\sshem\\\Downloads\\Thesis_Data\\ModDay_Veg_Gradients'
simFolder4 = os.path.join(baseFolder2, 'simulation00010')
os.chdir(simFolder4)

run4 = 'run00010.nc'
fnD = run4

dsD = nc.Dataset(fnD)
zbD = np.squeeze(dsD['zb'][:])
xD = np.squeeze(dsD['x'][:])
qsD = dsD['qs'][:]
dsD.close()

simFolder5 =os.path.join(baseFolder2, 'simulation00073')
os.chdir(simFolder5)
run5 = 'run00073.nc'
fnE = run5

dsE = nc.Dataset(fnE)
zbE = np.squeeze(dsE['zb'][:])
xE = np.squeeze(dsE['x'][:])
qsE = dsE['qs'][:]
dsE.close()
dx = 0.5

simFolder6 =os.path.join(baseFolder2, 'simulation00136')
os.chdir(simFolder6)
run6 = 'run00136.nc'
fnF = run6

dsF = nc.Dataset(fnF)
zbF = np.squeeze(dsF['zb'][:])
xF = np.squeeze(dsF['x'][:])
qsF = dsF['qs'][:]
dsF.close()
dx = 0.5

# ----- Plot Profiles --------------------------------------------------------

import matplotlib as mpl

fig = plt.figure(figsize=(9,5))
mpl.rcParams['xtick.labelsize'] = 14
mpl.rcParams['ytick.labelsize'] = 14

ax1 = fig.add_subplot(2,1,1)
ax2 = fig.add_subplot(2,1,2)

ztest = zbA[-1,:,:]
ztest1  = zbA[0,:,:]
ztest3 = zbB[-1,:,:]
ztest4 = zbC[-1,:,:]

ztestB = zbD[-1,:,:]
ztestA  = zbD[0,:,:]
ztestC = zbE[-1,:,:]
ztestD = zbF[-1,:,:]

ax1.plot(xA[1,:], ztest1[0,:], linewidth=2.0, color = '#000000', linestyle = '--',label= 'Initial Profile')
ax1.plot(xA[1,:], ztest[-1,:], linewidth=2.0, color = 'g', label='10% Crest Cover')
ax1.plot(xA[1,:], ztest3[-1,:], linewidth=2.0, color = 'y', label='50% Crest Cover')
ax1.plot(xA[1,:], ztest4[-1,:], linewidth=2.0, color = 'b', label='90% Crest Cover')

legend = ax1.legend(loc='lower right', fontsize = 14)

for text in legend.get_texts():
    text.set_fontweight('bold')    

ax1.set_xlim(0, 56)
ax1.grid('True')
ax1.set_ylim(0,6.5)
ax1.set_xticklabels(['','','','','',''])
ax1.set_yticklabels(['0','2','4','6'], fontweight = 'bold')
ax1.set_ylabel(' ',fontsize = 14)

ax2.plot(xD[1,:], ztestA[0,:], linewidth=2.0, color = '#000000',linestyle = '--', label= 'Initial Profile')
ax2.plot(xD[1,:], ztestB[-1,:], linewidth=2.0, color = 'g', label='3% Crest Cover')
ax2.plot(xD[1,:], ztestC[-1,:], linewidth=2.0, color = 'y', label='35% Crest Cover')
ax2.plot(xD[1,:], ztestD[-1,:], linewidth=2.0, color = 'b', label='67% Crest Cover')

ax2.set_ylabel(' ',fontsize = 14)
ax2.set_xticklabels(['0','10','20','30','40','50'], fontweight = 'bold')
ax2.set_yticklabels(['0','2','4','6'], fontweight = 'bold')

ax2.set_xlim(0, 56)
ax2.set_ylim(0,6.5)
ax2.set_xlabel('Cross-Shore Distance (m)', fontsize = 14,fontweight = 'bold' )

fig.text(0.01, 0.55, 'Elevation (m)', va='center', rotation='vertical', fontsize = 14, fontweight= 'bold')
fig.text(0.093, 0.92, 'a.', va='center', fontsize = 14, fontweight = 'bold')
fig.text(0.093, 0.49, 'b.', va='center', fontsize = 14, fontweight= 'bold')

plt.grid('True')
plt.subplots_adjust( bottom=0.1, left=0.1, right=0.95)
plt.tight_layout()

legend2 = ax2.legend(loc='lower right', fontsize = 14)
for text in legend2.get_texts():
    text.set_fontweight('bold')

os.chdir(baseFolder)
plt.savefig('Cross-shore_veg_prof_final', dpi=300)
