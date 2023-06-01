result = []
while 1:
    a, b, c = list(map(int, input().split()))
    if a*b*c == 0:
        break
    a, b, c = sorted([a,b,c])
    if (a>0 and b>0 and c>0) and (c**2 == a**2 + b**2):
        result.append('right')
    else:
        result.append('wrong')

for i in result:
    print(i)