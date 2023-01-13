h, m= map(int,input().split(' '))
time = int(input())
result = h*60+m+time
if result >= 24*60:
    print(f'{((result//60)-24)} {result%60}')
else :
    print(f'{result//60} {result%60}')