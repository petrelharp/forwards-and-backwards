#!/usr/bin/env python3
import os, sys
import tskit, pyslim
import json
import numpy as np
import matplotlib
from matplotlib import pyplot as plt

usage = """
Plots the 1D density.

Usage:
    plot_wave.py [name of treefile] [(start time) (end time) (number of steps)]
"""

if len(sys.argv) != 2 and len(sys.argv) != 5:
    raise ValueError(usage)

output_type = "pdf"

treefile = sys.argv[1]
assert treefile[-6:] == ".trees"
outbase = treefile[:-6]

input_times = (len(sys.argv) > 2)

if input_times:
    start_time = float(sys.argv[2])
    end_time = float(sys.argv[3])
    num_steps = int(sys.argv[4])

ts = tskit.load(treefile)
params = ts.metadata['SLiM']['user_metadata']
for n in params:
    if len(params[n]) == 1:
        params[n] = params[n][0]


dx = 0.8
T = params['RUNTIME']
dt = params["DT"]
max_gen = ts.metadata["SLiM"]["tick"] - 1
y_bins = [0, params['HEIGHT']]
x_bins = np.arange(0, params['WIDTH'] + dx, dx)
x_mids = x_bins[1:] - np.diff(x_bins)/2
t_bins = np.arange(0, max_gen + 1)

# Population sizes for each time step within each x bin
popsize = pyslim.population_size(ts, x_bins, y_bins, t_bins)

# "Observed" values of u
uhat = np.sum(popsize, axis=1) / (params["K"] * dx)
assert uhat.shape[0] == len(x_bins) - 1
assert uhat.shape[1] == len(t_bins) - 1

def plot_times(ax, times):
    cm = matplotlib.cm.cool
    steps = np.searchsorted(t_bins, max_gen - times / dt) - 1
    legend_steps = list(range(0, len(steps) + 1, int((len(steps) + 1) / 4)))
    for m, (j, t) in enumerate(zip(steps, times)):
        ax.plot(x_mids, uhat[:, j], c=cm(m / len(steps)),
                label=f"t={t:0.2f}" if m in legend_steps else None)
    ax.set_title(f"{min(times)} < t < {max(times)}")
    ax.set_xlabel("location")
    ax.set_ylabel("density")
    ax.legend()
    ax.axhline(0.0, ls=":")
    ax.axhline(1.0, ls=":")
    return

output_times = np.linspace(start_time, end_time, num_steps)
fig, ax = plt.subplots(1, 1, figsize=(15, 5))
plot_times(ax, output_times)

fig.savefig(f"{outbase}.steps.{output_type}")
