class Solution:
    def addBinary(self, a: str, b: str) -> str:
        int_a = 0
        int_b = 0
        for i in range(len(a)):
            int_a += int(a[i])*(2**(len(a)-1-i))
        
        for i in range(len(b)):
            int_b += int(b[i])*(2**(len(b)-1-i))

        int_o = int_a + int_b

        return bin(int_o)[2:]
