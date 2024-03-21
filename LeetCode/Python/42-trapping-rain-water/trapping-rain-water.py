class Solution:
    def trap(self, height: List[int]) -> int:
        # stack
        stack = []
        volume = 0
        
        for i in range(len(height)):
            # 변곡점을 만나는 경우
            while stack and height[i] > height[stack[-1]]:
                # 스택에서 빠진다
                top = stack.pop()
                print(i,' top:', top)
                if not len(stack):
                    break
                
                # 이전과의 차이만큼 물높이 처리
                distance = i - stack[-1] - 1
                waters = min(height[i], height[stack[-1]]) - height[top]
                volume += distance * waters
                print(distance, waters, volume)

            stack.append(i)
        return volume

