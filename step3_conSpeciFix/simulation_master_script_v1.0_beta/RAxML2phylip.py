sample=[]
f=open('sample.txt','r')
for l in f:
        sample.append(l.strip('\n'))
f.close()


liste=[]
dist={}
f=open("RAxML_distances.dist","r")
for l in f:
        a=l.strip("\n").split("\t")
        sp1,sp2 = a[0].strip(" ").split(" ")[0],a[0].strip(" ").split(" ")[1]
        if sp1 not in liste:
                liste.append(sp1)
        if sp2 not in liste:
                liste.append(sp2)
        if dist.has_key(sp1):
                pass
        else:
                dist[sp1] = {}
        if dist.has_key(sp2):
                pass
        else:
                dist[sp2] = {}
        dist[sp1][sp2] = a[1]
        dist[sp2][sp1] = a[1]

f.close()


h=open("matrix_sample.txt","w")
h.write(str(len(sample)) + "\n")
for sp1 in sample:
        tmp= [sp1]
        for sp2 in sample:
                if sp1 == sp2:
                        tmp.append("0")
                else:
                        tmp.append(dist[sp1][sp2])
                if len(tmp) > 10:
                        h.write("\t".join(tmp) + "\n")
                        tmp=[]
        if len(tmp) > 0:
                h.write("\t".join(tmp) + "\n")

h.close()

