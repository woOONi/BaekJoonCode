N, X = map(int, input().split(' '))
nums = list(map(int, input().split(' ')))
result = [i for i in nums if i < X]
for i in result:
    print(i, end=' ')