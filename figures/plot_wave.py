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

ts = tskit.load(treefile)
params = ts.metadata['SLiM']['user_metadata']
for n in params:
    if len(params[n]) == 1:
        params[n] = params[n][0]

dx = 0.8
T = params['RUNTIME']
dt = params["DT"]
max_gen = ts.metadata["SLiM"]["tick"]
y_bins = [0, params['HEIGHT']]
x_bins = np.arange(0, params['WIDTH'] + dx, dx)
x_mids = x_bins[1:] - np.diff(x_bins)/2
t_bins = np.arange(0, max_gen + 1)

input_ticks = np.array(params['REMEMBER_TIMES'] + [max_gen])
output_ticks = max_gen - input_ticks

# Population sizes for each time step within each x bin
popsize = pyslim.population_size(ts, x_bins, y_bins, t_bins)

# "Observed" values of u
uhat = np.sum(popsize, axis=1) / (params["K"] * dx)
assert uhat.shape[0] == len(x_bins) - 1
assert uhat.shape[1] == len(t_bins) - 1

def plot_ticks(ax, ticks, legend=True, xlab=True, **kwargs):
    times = (max_gen - ticks) * dt
    cm = matplotlib.cm.cool
    legend_ticks = list(range(0, len(ticks) + 1, int((len(ticks) + 1) / 4)))
    for m, (j, t) in enumerate(zip(ticks, times)):
        ax.plot(x_mids, uhat[:, j], c=cm(m / len(ticks)),
                label=f"t={t:0.2f}" if m in legend_ticks else None)
    ax.text(np.max(x_mids), 0.8 * np.max(uhat), f"{min(times)} < t < {max(times)}", horizontalalignment="right")
    if xlab:
        ax.set_xlabel("location")
    ax.set_ylabel("density")
    if legend:
        ax.legend()
    return

num_plots = 3
k = int((len(output_ticks)-1)/num_plots)
fig, axes = plt.subplots(num_plots, 1, figsize=(3, 1.1*num_plots), sharex=True, sharey=True)
for j, ax in enumerate(axes):
    plot_ticks(ax, output_ticks[1+j*k+np.arange(k)], legend=False, xlab=(j == num_plots - 1))
    if j < num_plots - 1:
        plt.setp(ax.get_xticklabels(), visible=False)

plt.tight_layout()
plt.subplots_adjust(hspace=.0)
fig.savefig(f"{outbase}.steps.{output_type}")
