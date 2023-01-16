cnt = int(input())
sumresult=[]
for i in range(cnt):
    a,b=map(int,input().split(' '))
    sumresult.append(a+b)
for i in range(cnt):
    print(f'Case #{i+1}: {sumresult[i]}')