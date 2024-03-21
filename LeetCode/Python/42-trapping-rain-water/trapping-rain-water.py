class Solution:
    def trap(self, height: List[int]) -> int:
        # two pointer 풀이
        if not height:
            return 0
        
        volume = 0
        left, right = 0, len(height)-1
        left_max, right_max = height[left], height[right]

        while left < right:
            left_max, right_max = max(left_max, height[left]),max(right_max, height[right])
            # 더 높은 쪽을 향하여 투 포인터 이동
            if left_max <= right_max:
                volume += left_max - height[left]
                # print('left:',left,left_max)
                # print('volume:',volume)
                left += 1
                
            else:
                volume += right_max - height[right]
                # print('right:',right,right_max)
                # print('volume:',volume)
                right -=1
            
        return volume

# left: 0 0
# volume: 0
# left: 1 1
# volume: 0
# left: 2 1
# volume: 1
# right: 11 1
# volume: 1
# left: 3 2
# volume: 1
# left: 4 2
# volume: 2
# left: 5 2
# volume: 4
# left: 6 2
# volume: 5
# right: 10 2
# volume: 5
# right: 9 2
# volume: 6
# right: 8 2
# volume: 6