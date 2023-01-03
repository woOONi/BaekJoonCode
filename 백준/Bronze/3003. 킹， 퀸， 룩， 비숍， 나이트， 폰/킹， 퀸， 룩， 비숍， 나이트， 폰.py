list_ch=[1,1,2,2,2,8]
input_ch= list(map(int, input().split(' ')))
for i in range(len(list_ch)):
    print(list_ch[i]-input_ch[i], end=' ')