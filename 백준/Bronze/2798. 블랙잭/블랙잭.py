N, M = list(map(int, input().split()))
list_num = sorted(list(map(int, input().split())), reverse = True)
result = 0

for x in range(N):
    for y in range(x+1,N):
        for z in range(y+1,N):
            if list_num[x] + list_num[y] + list_num[z] > M:
                continue
            else :
                result = max(result,list_num[x] + list_num[y] + list_num[z])

                

print(result)