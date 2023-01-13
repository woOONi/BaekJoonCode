h, m= map(int,input().split(' '))
if m-45>=0:
    print(f'{h} {m-45}')
else:
    m = 60+m-45
    if h==0:
        print(f'23 {m}')
    else:
        print(f'{h-1} {m}')