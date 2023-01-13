cnt = int(input())
num = []
for i in range(cnt):
    num.append(list(map(int,input().split(' '))))

for i in range(cnt):
    print(num[i][0]+num[i][1])