import numpy as np
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.offsetbox import (OffsetImage, AnnotationBbox)
import matplotlib as mpl

# Create two axis
plt.rc('legend', fontsize=24)
plt.rc('font', size=23, family='Tw Cen MT')
fig, (ax1, ax2) = plt.subplots(2, 1, sharex=True)
fig.set_size_inches(20, 7.5)
fig.subplots_adjust(
        left=0.07,
        right=0.99,
        bottom=0.3,
        top=0.96,
        hspace=0.1,
        wspace=0.05)  # adjust space between axes

# zoom-in / limit the view to different portions of the data
ax1.set_ylim(700, 10000)  # outliers only
ax1.set_yticks([700, 5000, 7500, 10000 ])
ax2.set_ylim(0, 600)  # most of the data
ax2.set_yticks([0,100,200,400,600])
ax1.yaxis.set_major_formatter(mpl.ticker.StrMethodFormatter('{x:,.0f}'))
ax2.yaxis.set_major_formatter(mpl.ticker.StrMethodFormatter('{x:,.0f}'))
#ax1.ticklabel_format(axis='y', style='sci', scilimits=(0, 1))
#ax2.ticklabel_format(axis='y', style='sci', scilimits=(0, 1))


# hide the spines between ax and ax2
ax1.spines.bottom.set_visible(False)
ax2.spines.top.set_visible(False)

ax1.xaxis.tick_top()
ax1.xaxis.set_visible(False)
ax1.tick_params(labeltop=False)  # don't put tick labels at the top
ax2.xaxis.tick_bottom()


benches = [
 "namd", 
 "parest", 
 "mcf", 
 "lbm", 
 "omnetpp", 
 "xalanc", 
 "x264", 
 "leela", 
 "xz", 
 "gmean", 
        ]
species = [
        "W-DR", "W-D",
        "W-DR", "W-D",
        "W-DR", "W-D",
        "W-DR", "W-D",
        "W-DR", "W-D",
        "W-DR", "W-D",
        "W-DR", "W-D",
        "W-DR", "W-D",
        "W-DR", "W-D",
        "W-DR", "W-D",
        #"DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE",
        ]

weight_counts = {
    "Benchmark": np.array([
45.112,45.112,104.03,104.03,124.253,124.253,117.11,117.11,60.526,60.526,54.89,54.89,23.057,23.057,71.13,71.13,64.618,64.618,66.08618048,66.08618048

        ]),
    "Encoding": np.array([
13.754,7.731,91.801,53.565,756.847,630.347,0.98,1.413,506.174,500.174,205.44,120.105,68.909,50.312,245.828,126.365,21.311,15.56,130.7341946,97.71819381
        ]),
    "Get CCID": np.array([
765.258,158.529,4518.86998,888.21348,8712.7,1592.946,708.54,118.523,6884.203,1545.59,1113.257,288.814,1494.95845,288.35182,1615.422,146.521,1730.47235,404.06041,2096.788487,416.8723884
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
for i in range(int(len(species)/2)):
    x_bench.append(pos-0.225)
    #x_bench.append(pos-0.125)
    x_vline.append(pos-0.375)
    x.append(pos)
    pos += 0.5
    x.append(pos)
    pos += 0.75
x_vline.append(pos-0.375)

print(x)
width = 0.45
multi=0
bottom = np.zeros(20)
idx=0
for l, weight_count in weight_counts.items():
    offset = width * multi
    p2 = ax2.bar(x, weight_count, width, label=l, bottom=bottom, color=colors[idx], edgecolor='black')
    p1 = ax1.bar(x, weight_count, width, label=l, bottom=bottom, color=colors[idx], edgecolor='black')
    bottom += weight_count
    multi += 1
    idx += 1
ax1.legend(labels=["Benchmark", "Encoding", "Get CCID"], loc="upper right")

idx = 0
for i in x_bench:    
    ax2.text(i, -500, benches[idx], fontsize=32, rotation=45)
    idx += 1

for i in x_vline:
    ll = ax2.plot([i,i], [0,-500], color='black', linewidth=1)
    ll[0].set_clip_on(False)


#ll = ax2.plot([0,15], [140,140], color='black', linewidth=1)
#print(ll)
#ll[0].set_clip_on(False)


print(x)
print(species)
ax2.set_xticks(x, species,rotation=90, fontsize=28)

ax1.grid(axis='y', color = 'grey', linestyle = '--', linewidth = 0.5)
ax2.grid(axis='y', color = 'grey', linestyle = '--', linewidth = 0.5)

#ax2.set_ylabel('Runtime (Seconds)', fontsize=24)

#ax3 = plt.axes([0,0,1,1], facecolor=(1,1,1,0))
#x,y = np.array([[0.1, 0.9125], [0.575,0.575]])
#line = Line2D(x, y, lw=1, color='r', alpha=0.4)
#ax3.add_line(line)

x,y = np.array([[-4, 20], [700, 700]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle="--")
ax1.add_line(line)

x,y = np.array([[-4, 20], [600,600]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle="--")
ax2.add_line(line)


#ax1.bar([0,1], [1,2])
#ax2.bar([0,1], [3,4])

#logo="./squiz.jpg"
#imagebox = OffsetImage(logo, zoom = 0.15)
#ab = AnnotationBbox(imagebox, (5, 100), frameon = False)
#ax2.add_artist(ab)


plt.savefig("dynamic_runtime_spec_whistle.pdf", format="pdf", bbox_inches="tight")
plt.show()

