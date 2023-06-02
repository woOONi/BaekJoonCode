cnt = int(input())
ans = []
for i in range(0,cnt):
    H, W, N = list(map(int, input().split()))

    result_100 = N % H * 100 if N % H != 0 else H * 100
    result_1 = N // H + 1 if N % H != 0 else N//H
    result = result_100 + result_1
    print(result)
