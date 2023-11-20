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
        left=0.09,
        right=0.99,
        bottom=0.35,
        top=0.96,
        hspace=0.1,
        wspace=0.05)  # adjust space between axes

# zoom-in / limit the view to different portions of the data
ax1.set_ylim(10000,115000)  # outliers only
ax1.set_yticks([10000, 50000, 115000])
ax2.set_ylim(700, 9000)  # most of the data
ax2.set_yticks([700, 2000, 5000, 9000])
ax3.set_ylim(0, 600)  # most of the data
ax3.set_yticks([0, 100, 200, 400, 600])

ax1.yaxis.set_major_formatter(mpl.ticker.StrMethodFormatter('{x:,.0f}'))
ax2.yaxis.set_major_formatter(mpl.ticker.StrMethodFormatter('{x:,.0f}'))
ax3.yaxis.set_major_formatter(mpl.ticker.StrMethodFormatter('{x:,.0f}'))


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
        "W-DR", "W-D",
        "W-DR", "W-D",
        "W-DR", "W-D",
        "W-DR", "W-D",
        ]

weight_counts = {
    "Benchmark": np.array([
39.5,39.5,0.3,0.3,87.3,87.3,28.8,28.8,31.4,31.4,41.3,41.3,34.9,34.9,56.1,56.1,21.7,21.7,9.9,9.9,71.3,71.3,18.8,18.8,72.2,72.2,24.17350491,24.17350491
        ]),
    "Encoding": np.array([
460.7,380.2,0.6,0.4,444.7,265.5,41.5,28.9,153.7,126.9,170.2,148.3,2.9,1.2,1.1,1.3,232.8,177.2,46.1,30.5,770.8,768.4,66,54.2,10.3,6.5,64.58983067,51.33540874
        ]),
    "Get CCID": np.array([
19551.13893,7470.3,140.9368684,23.1,16785.66319,4118.2,21696.52889,7228.3,9359.554906,2835.5,17296.54484,3461.4,5095.823104,1783.8,8199.803444,2566.4,15968.47458,3337.4,1844.159886,397.1,13709.70538,4762.3,8665.087316,2079.6,113399.1967,23194.3,8532.885082,2182.52678
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
bottom = np.zeros(28)
idx=0
for l, weight_count in weight_counts.items():
    offset = width * multi
    p3 = ax3.bar(x, weight_count, width, label=l, bottom=bottom, color=colors[idx], edgecolor='black')
    p2 = ax2.bar(x, weight_count, width, label=l, bottom=bottom, color=colors[idx], edgecolor='black')
    p1 = ax1.bar(x, weight_count, width, label=l, bottom=bottom, color=colors[idx], edgecolor='black')
    bottom += weight_count
    multi += 1
    idx += 1
#ax1.legend(labels=["Benchmark", "Encoding", "Get CCID"], loc="upper left")

idx = 0
for i in x_bench:    
    ax3.text(i, -950, benches[idx], fontsize=32, rotation=45)
    idx += 1

for i in x_vline:
    ll = ax3.plot([i,i], [0,-950], color='black', linewidth=1)
    ll[0].set_clip_on(False)


#ll = ax2.plot([0,15], [140,140], color='black', linewidth=1)
#print(ll)
#ll[0].set_clip_on(False)


print(x)
print(species)
ax3.set_xticks(x, species,rotation=90, fontsize=28)

ax1.grid(axis='y', color = 'grey', linestyle = '--', linewidth = 0.5)
ax2.grid(axis='y', color = 'grey', linestyle = '--', linewidth = 0.5)
ax3.grid(axis='y', color = 'grey', linestyle = '--', linewidth = 0.5)

#ax1.set_ylabel('Runtime in Seconds', fontsize=24)

#ax3 = plt.axes([0,0,1,1], facecolor=(1,1,1,0))
#x,y = np.array([[0.1, 0.9125], [0.575,0.575]])
#line = Line2D(x, y, lw=1, color='r', alpha=0.4)
#ax3.add_line(line)
#x,y = np.array([[0.1, 0.9125], [0.5575,0.5575]])
#line = Line2D(x, y, lw=1, color='r', alpha=0.4)
#ax3.add_line(line)
x,y = np.array([[-4, 20], [10000, 10000]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle='--')
ax1.add_line(line)

x,y = np.array([[-4, 20], [9000, 9000]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle='--')
ax2.add_line(line)

x,y = np.array([[-4, 20], [700, 700]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle='--')
ax2.add_line(line)

x,y = np.array([[-4, 20], [600, 600]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle='--')
ax3.add_line(line)

#ax1.bar([0,1], [1,2])
#ax2.bar([0,1], [3,4])

#logo="./squiz.jpg"
#imagebox = OffsetImage(logo, zoom = 0.15)
#ab = AnnotationBbox(imagebox, (5, 100), frameon = False)
#ax2.add_artist(ab)


plt.savefig("dynamic_runtime_splash_whistle.pdf", format="pdf", bbox_inches="tight")
plt.show()

