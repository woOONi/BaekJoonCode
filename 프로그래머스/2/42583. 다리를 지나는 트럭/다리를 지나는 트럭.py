from collections import deque

def solution(bridge_length, weight, truck_weights):
    time = 0                            # 걸린시간
    bridge = deque([0] * bridge_length)        # 0이 들어가있는 bridge_length길이의 리스트
    dq = deque(truck_weights)
    sum_bridge = 0
    
    while dq:
        # 트럭하나는 무조건 올라가고 지나가니까 1 더해주기
        time += 1
        
        # 하나 지나가므로 bridge의 0 하나빼줘야함
        # 다리를 건넌 트럭 제거
        out_truck = bridge.popleft()
        sum_bridge -= out_truck  # **나간 트럭 무게 반영**
        
        # 만약 브릿지의 무게가 아직 괜찬다면 다음걸 올려주기 
        if sum_bridge + dq[0] <= weight :
            tmp = dq.popleft()
            sum_bridge += tmp
            bridge.append(tmp)
            
        else: # 아니라면 0 추가 해주기
            bridge.append(0)
    
    # 마지막은 무조건 0 추가 횟수가 들어가야하므로 bridge_length 추가해주기
    return time + bridge_length
