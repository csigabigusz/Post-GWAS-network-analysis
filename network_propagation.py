# initialize the network
import pandas as pd
import networkx as nx
# load network:
id2symbol={}
# load gene symbol for entrez ids:
with open("/content/entrez2symbol_extended.csv", 'r') as dictfile:
  for line in dictfile:
    [entrez, symbol]=line.strip().split(';')
    id2symbol[entrez]=symbol

file_path = "/content/STRING_edgelist_entrez_topQ60_extended.csv"
df = pd.read_csv(file_path, dtype={'node1': str, 'node2': str, 'score':int})[["node1", "node2","score"]]
graph = nx.from_pandas_edgelist(df, source="node1", target="node2")


print(len(graph.nodes))
print(len(graph.edges))

# load gene-scores and transform:
import numpy as np
gene_scores="/content/gormley3_all_p510-6.csv"
#gene_scores="/content/choquet-p510-6_network_ready.csv"
#gene_scores="/content/dori-p510-6_network_ready.csv"

maxscore_dict = {}
scores=[]
min=10
with open(gene_scores, 'r') as scorefile:
  scorefile.readline()
  for line in scorefile:
    [geneid, avgscore, maxscore] = line.strip().split(';')
    #avgscore_dict[geneid]=float(avgscore)
    maxscore_dict[geneid]=float(maxscore)
    scores.append(float(maxscore))
    if float(maxscore) < min:
      min=float(maxscore)

logmaxscore_dict={}
for item in maxscore_dict:
  logmaxscore_dict[item]=np.log(maxscore_dict[item]) - np.log(min)

# network propagation:
pr05 = nx.pagerank(graph, alpha=0.5, personalization=logmaxscore_dict, max_iter=100)


# print network with 100 top proteins and their important connections
import matplotlib.pylab as plt

score_dict=logmaxscore_dict
scores=list(score_dict.values())
scores.sort()
tops = scores[-100]
top1000 = scores[-100]

G_init = nx.Graph()
sublabels={}
for e in list(graph.edges):
  try:
    if score_dict[e[0]] > tops or score_dict[e[1]] > tops:
      if score_dict[e[0]] > top1000 and score_dict[e[1]] > top1000:
        G_init.add_edge(e[0],e[1])
        try:
          sublabels[e[0]]=id2symbol[e[0]]
        except:
          print(e[0])
          sublabels[e[0]]=e[0]
        try:
          sublabels[e[1]]=id2symbol[e[1]]
        except:
          print(e[1])
          sublabels[e[1]]=e[1]
  except:
    pass
print(len(G_init.edges))

pos = nx.kamada_kawai_layout(G_init)
nx.draw_networkx_edges(G_init, pos, width=0.8, edge_color='gray')
color={}
for n in list(G_init.nodes):
  color[n]=float(score_dict[n])
nodes = nx.draw_networkx_nodes(G_init, pos, node_size=20, node_color=list(color.values()), cmap='viridis')
nx.draw_networkx_labels(G_init, pos, labels=sublabels, font_size=6, horizontalalignment='right')

plt.colorbar(nodes)
plt.axis('off')
plt.show()
