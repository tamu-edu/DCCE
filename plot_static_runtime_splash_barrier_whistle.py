import numpy as np
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.offsetbox import (OffsetImage, AnnotationBbox)
import matplotlib as mpl

# Create two axis
plt.rc('legend', fontsize=24)
plt.rc('font', size=23, family='Tw Cen MT')
fig, (ax1, ax2, ax3) = plt.subplots(3, 1, sharex=True)
fig.set_size_inches(20, 7.5)
fig.subplots_adjust(
        left=0.07,
        right=0.99,
        bottom=0.3,
        top=0.98,
        hspace=0.1,
        wspace=0.05)  # adjust space between axes

# zoom-in / limit the view to different portions of the data
ax1.set_ylim(1100, 15000)  # outliers only
ax1.set_yticks([1100, 15000])

ax2.set_ylim(200, 1000)  # most of the data
ax2.set_yticks([200, 500, 800, 1000])

ax3.set_ylim(0, 150)  # most of the data
ax3.set_yticks([0, 20,40,60,80,150])

ax1.yaxis.set_major_formatter(mpl.ticker.StrMethodFormatter('{x:,.0f}'))
ax2.yaxis.set_major_formatter(mpl.ticker.StrMethodFormatter('{x:,.0f}'))
ax2.yaxis.set_major_formatter(mpl.ticker.StrMethodFormatter('{x:,.0f}'))

# hide the spines between ax and ax2
ax1.spines.bottom.set_visible(False)
ax2.spines.top.set_visible(False)
ax2.spines.bottom.set_visible(False)
ax3.spines.top.set_visible(False)

ax1.xaxis.tick_top()
ax1.xaxis.set_visible(False)
ax1.tick_params(labeltop=False)  # don't put tick labels at the top

ax2.xaxis.tick_top()
ax2.xaxis.set_visible(False)
ax2.tick_params(labeltop=False)  # don't put tick labels at the top

ax3.xaxis.tick_bottom()


benches = [
 "barnes",
 "cholesky", 
 "fft", 
 "fmm", 
 "lu-cb", 
 "lu-ncb", 
 "ocean-c", 
 "ocean-n", 
 "radiosity", 
 "radix", 
 "raytrace", 
 "water-n", 
 "water-s", 
 "geomean",
        ]
species = [
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        "B-P", "B-D", "W-P", "W-D",
        ]

#weight_counts = {
#    "Benchmark": np.array([
#35.68,35.68,35.68,35.68,0.3,0.3,0.3,0.3,56.68,56.68,56.68,56.68,28.1,28.1,28.1,28.1,29.88,29.88,29.88,29.88,29.88,29.88,29.88,29.88,35.56,35.56,35.56,35.56,57.2,57.2,57.2,57.2,19.4,19.4,19.4,19.4,10.6,10.6,10.6,10.6,59.28,59.28,59.28,59.28,17.8,17.8,17.8,17.8,62.52,62.52,62.52,62.52,22.40705743,22.40705743,22.40705743,22.40705743
#        ]),
#    "Encoding": np.array([
#20.045,28.62,20.045,28.62,0,0,0,0,3.57,9.195,3.57,9.195,0.9,1.5,0.9,1.5,6.87,6.52,6.87,6.52,10.715,8.115,10.715,8.115,2.14,2.615,2.14,2.615,0.85,0.55,0.85,0.55,13,17.925,13,17.925,0.375,0.8,0.375,0.8,9.045,2.695,9.045,2.695,2.675,3.575,2.675,3.575,7.605,10.305,7.605,10.305,3.09183118,3.559991276,3.09183118,3.559991276
#        ]),
#    "Get CCID": np.array([
#3.925,0.525,13840.775,13832.2,0,0.025,0.525,0.1,0.125,0.65,325.675,163.125,1.525,0.3,265.525,91.9,0.8,0.15,908.325,557,1.65,0.7,969.7,499.225,1.6,0.55,0.225,1.225,0.475,0.025,7.6,3.05,0.15,0.55,10047.35,3006.075,0,0.025,237.35,108.1,3.95,0.575,4462.675,3119.725,0.75,0.675,365.0583333,152.625,2.425,0.4,154.0083333,55.525,0.617148882,0.426878304,253.3269345,131.018947
#        ]),
#}

weight_counts = {
    "Benchmark": np.array([
35.68,35.68,35.68,35.68,0.3,0.3,0.3,0.3,56.68,56.68,56.68,56.68,28.1,28.1,28.1,28.1,29.88,29.88,29.88,29.88,29.88,29.88,29.88,29.88,35.56,35.56,35.56,35.56,57.2,57.2,57.2,57.2,19.4,19.4,19.4,19.4,10.6,10.6,10.6,10.6,59.28,59.28,59.28,59.28,17.8,17.8,17.8,17.8,62.52,62.52,62.52,62.52,22.67958358,22.67958358,22.67958358,22.67958358
        ]),
    "Encoding": np.array([
20.045,40.35658151,20.045,40.35658151,0.01,0.025,0.01,0.025,3.57,74.7209888,3.57,74.7209888,0.9,12.33303781,0.9,12.33303781,6.87,6.70305591,6.87,6.70305591,10.715,8.688221616,10.715,8.688221616,2.14,4.141800495,2.14,4.141800495,0.85,0.65,0.85,0.65,13,25.12846438,13,25.12846438,0.375,3.049999379,0.375,3.049999379,9.045,37.44190097,9.045,37.44190097,2.675,7.483752773,2.675,7.483752773,7.605,19.57349415,7.605,19.57349415,2.377052725,6.757578988,2.377052725,6.757578988
        ]),
    "Get CCID": np.array([
3.925,3.5,13840.775,13820.46342,0.01,0.01,0.525,0.075,0.125,0.1,325.675,97.5990112,1.525,1,265.525,81.06696219,0.8,0.8,908.325,556.8169441,1.65,0.126778384,969.7,498.6517784,1.6,1,0.225,0.2,0.475,0.4,7.6,2.95,0.15,0.14,10047.35,2998.871536,0.01,0.01,237.35,105.8500006,3.95,3,4462.675,3084.978099,0.75,0.7,365.0583333,148.7162472,2.425,2.4,154.0083333,46.25650585,0.484418417,0.345561026,194.3991548,83.12728961
        ]),
}

#https://dribbble.com/shots/11434688/attachments/3050581?mode=media
colors = [
"#9CD6FF",
#"#4CB2FF",
"#2476FF",
"#0053B3"
        ]

#x = np.arange(len(species))  # the label locations
#x = [0,0.5,1.5,2]
x = [] # x position for scheme
x_bench = []
x_vline = []
pos= 0
for i in range(int(len(species)/4)):
    x_bench.append(pos-0.225)
    x_vline.append(pos-0.375)

    x.append(pos)
    pos += .5
    x.append(pos)
    pos += .5
    x.append(pos)
    pos += .5
    x.append(pos)
    pos += .75
x_vline.append(pos-0.375)

print(x)
width = 0.45
multi=0
bottom = np.zeros(56)
idx=0
for l, weight_count in weight_counts.items():
    offset = width * multi
    p3 = ax3.bar(x, weight_count, width, label=l, bottom=bottom, color=colors[idx], edgecolor='black')
    p2 = ax2.bar(x, weight_count, width, label=l, bottom=bottom, color=colors[idx], edgecolor='black')
    p1 = ax1.bar(x, weight_count, width, label=l, bottom=bottom, color=colors[idx], edgecolor='black')
    bottom += weight_count
    multi += 1
    idx += 1
#ax1.legend(labels=["Benchmark", "Encoding", "Get CCID"], loc="upper right")

idx = 0
for i in x_bench:    
    ax3.text(i, -175, benches[idx], fontsize=32, rotation=45)
    idx += 1

for i in x_vline:
    ll = ax3.plot([i,i], [0,-175], color='black', linewidth=1)
    ll[0].set_clip_on(False)

#ax1.text(10, 10000, "Static Instrumentation", fontsize=32)

#ll = ax2.plot([0,15], [140,140], color='black', linewidth=1)
#print(ll)
#ll[0].set_clip_on(False)


print(x)
print(species)
ax3.set_xticks(x, species,rotation=90, fontsize=28)

ax1.grid(axis='y', color = 'grey', linestyle = '--', linewidth = 0.5)
ax2.grid(axis='y', color = 'grey', linestyle = '--', linewidth = 0.5)
ax3.grid(axis='y', color = 'grey', linestyle = '--', linewidth = 0.5)

#ax2.set_ylabel('Runtime (Seconds)', fontsize=28)

#ax3 = plt.axes([0,0,1,1], facecolor=(1,1,1,0))
#x,y = np.array([[0.1, 0.9125], [0.575,0.575]])
#line = Line2D(x, y, lw=1, color='r', alpha=0.4)
#ax3.add_line(line)
#x,y = np.array([[0.1, 0.9125], [0.5575,0.5575]])
#line = Line2D(x, y, lw=1, color='r', alpha=0.4)
#ax3.add_line(line)
#x,y = np.array([[-4, 15], [140,140]])
#line = Line2D(x, y, lw=5., color='r', alpha=0.4)
#ax2.add_line(line)

x,y = np.array([[-4, 40], [1100, 1100]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle='--')
ax1.add_line(line)

x,y = np.array([[-4, 40], [1000,1000]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle='--')
ax2.add_line(line)

x,y = np.array([[-4, 40], [200,200]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle='--')
ax2.add_line(line)

x,y = np.array([[-4, 40], [150,150]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle='--')
ax3.add_line(line)

#ax1.bar([0,1], [1,2])
#ax2.bar([0,1], [3,4])

#logo="./squiz.jpg"
#imagebox = OffsetImage(logo, zoom = 0.15)
#ab = AnnotationBbox(imagebox, (5, 100), frameon = False)
#ax2.add_artist(ab)


plt.savefig("static_runtime_splash_barrier_whistle.pdf", format="pdf", bbox_inches="tight")
plt.show()

