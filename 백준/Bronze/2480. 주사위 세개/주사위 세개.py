d = list(map(int, input().split(' ')))
d.sort()
count,num = 0,0
for x in range(len(d)-1):
    for y in range(x+1,len(d)):
        if d[x]==d[y]:
            count+=1
            num=d[x]
result = num*1000+10000 if count==3 else (num*100+1000 if count==1 else max(d)*100)
print(result)