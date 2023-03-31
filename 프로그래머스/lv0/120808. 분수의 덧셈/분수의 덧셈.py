def solution(numer1, denom1, numer2, denom2):
    a = (numer1 * denom2) + (numer2 * denom1)
    b = denom1 * denom2
    gdc = []
    for i in range(min(a,b),0,-1):
        if (a%i==0) & (b%i==0):
            gdc.append(i)
    d = max(gdc)
    return [a/d, b/d]