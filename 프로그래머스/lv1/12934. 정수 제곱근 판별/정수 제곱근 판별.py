import numpy as np
def solution(n):
    return (np.sqrt(n) + 1) ** 2 if np.sqrt(n) == round(np.sqrt(n)) else -1