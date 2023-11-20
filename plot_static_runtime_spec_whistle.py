import numpy as np
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.offsetbox import (OffsetImage, AnnotationBbox)

# Create two axis
plt.rc('legend', fontsize=24)
plt.rc('font', size=23, family='Tw Cen MT')
fig, (ax1, ax2) = plt.subplots(2, 1, sharex=True)
fig.set_size_inches(20, 7.5)
fig.subplots_adjust(
        left=0.07,
        right=0.99,
        bottom=0.32,
        top=0.98,
        hspace=0.1,
        wspace=0.05)  # adjust space between axes

# zoom-in / limit the view to different portions of the data
ax1.set_ylim(700, 900)  # outliers only
ax2.set_yticks([700, 800, 900])
ax2.set_ylim(0, 450)  # most of the data
ax2.set_yticks([0,100,200,300,450])

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
        "W-P", "W-D",
        "W-P", "W-D",
        "W-P", "W-D",
        "W-P", "W-D",
        "W-P", "W-D",
        "W-P", "W-D",
        "W-P", "W-D",
        "W-P", "W-D",
        "W-P", "W-D",
        "W-P", "W-D",
        #"DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE", "DrCCTProf", "DCCE",
        ]

#weight_counts = {
#    "Benchmark": np.array([
#25.97,25.97,39.798,39.798,66.451,66.451,116.294,116.294,38.444,38.444,29.341,29.341,11.136,11.136,38.181,38.181,31.298,31.298,36.66991016,36.66991016,
#
#        ]),
#    "Encoding": np.array([
#19.836,19.574,69.194,68.693,64.835,64.116,7.216,7.136,15.222,13.162,24.116,23.412,10.276,10.429,30.889,31.9,31.876,31.866,28.66698449,28.32386338,
#        ]),
#    "Get CCID": np.array([
#11.904,9.227,63.553,33.971,690.214,114.976,8.327,24.625,373.734,51.237,204.909,27.856,63.246,8.111,215.461,28.801,202.488,31.324,143.6993977,30.36529189,
#        ]),
#}


weight_counts = {
    "Benchmark": np.array([
25.97,25.97,39.798,39.798,66.451,66.451,116.294,116.294,38.444,38.444,29.341,29.341,11.136,11.136,38.181,38.181,31.298,31.298,36.66991016,36.66991016
]),
    "Encoding": np.array([
19.836,23.26156695,69.194,74.4475,64.835,88.8325,7.216,10.421,15.222,17.359,24.116,27.0355,10.276,11.6465,30.889,39.3595,15,100,21.82241208,31.92905413
]),
    "Get CCID": np.array([
11.904,5.539433054,63.553,28.2165,690.214,90.2595,8.327,21.34,373.734,47.04,204.909,24.2325,63.246,6.8935,215.461,21.3415,202.488,25.406,99.06357503,22.14863303
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
    ax2.text(i, -360, benches[idx], fontsize=32, rotation=45)
    idx += 1

for i in x_vline:
    ll = ax2.plot([i,i], [0,-360], color='black', linewidth=1)
    ll[0].set_clip_on(False)


#ll = ax2.plot([0,15], [140,140], color='black', linewidth=1)
#print(ll)
#ll[0].set_clip_on(False)


print(x)
print(species)
ax2.set_xticks(x, species,rotation=90, fontsize=28)

ax1.grid(axis='y', color = 'grey', linestyle = '--', linewidth = 0.5)
ax2.grid(axis='y', color = 'grey', linestyle = '--', linewidth = 0.5)

#ax1.set_ylabel('Runtime in Sec.', fontsize=24)

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
x,y = np.array([[-4, 20], [700, 700]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle='--')
ax1.add_line(line)

x,y = np.array([[-4, 20], [450,450]])
line = Line2D(x, y, lw=2.5, color='r', alpha=0.8, linestyle='--')
ax2.add_line(line)


#ax1.bar([0,1], [1,2])
#ax2.bar([0,1], [3,4])

#logo="./squiz.jpg"
#imagebox = OffsetImage(logo, zoom = 0.15)
#ab = AnnotationBbox(imagebox, (5, 100), frameon = False)
#ax2.add_artist(ab)


plt.savefig("static_runtime_spec_whistle.pdf", format="pdf", bbox_inches="tight")
plt.show()

