total = int(input())
cnt = int(input())
sum=0
for i in range(cnt):
    a,c=(map(int,input().split(' ')))
    sum += a*c
result = 'Yes' if total==sum else 'No'
print(result)