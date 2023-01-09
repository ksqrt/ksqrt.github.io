---
layout: single
title: "[DL] 모델 학습 조기 종료 EarlyStopping"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

### 1. EarlyStopping

Python으로 작성된 딥 러닝 라이브러리 의 콜백 함수입니다 .

훈련 프로세스에서 지정된 에포크 수에 도달하기 전에 신경망 훈련을 중지하는 데 사용됩니다.

이 함수는 교육 프로세스 중에 호출되며 지정한 중지 기준을 충족하면 교육이 중단됩니다. 

중지 기준은 손실 함수, 검증 정확도 또는 모니터링 중인 기타 메트릭 을 기반으로 할 수 있습니다.

### 2. 인수 값

- **`monitor`**
    
    : 모니터링할 수량입니다. 예를 들어 val_loss 을 모니터링하기 위해 'val_loss'로 설정할 수 있습니다.
    
- **`min_deltamin_delta`**
    
    : 이는 개선으로 인정되기 위한 변화량(숫자) 을 지정합니다. 
    
- **`patience`**
    
    개선이 안된다고 바로 종료시키지 않고, 개선을 위해 몇번의 에포크를 기다릴지 설정합니다. 
    
- **`verbose`**
    
    : 이것은 출력의 자세한 정도를 제어하는 선택적 인수입니다. 기본적으로 0(출력 없음)으로 설정됩니다.
    
- **`mode`**
    
    : 개선 여부를 결정하기 위해 모니터링 수량의 최소 또는 최대 값을 사용할지 여부를 지정하는 선택적 인수입니다.
    
    - **`mode='min'`**
        
        : 모니터링 되는 양이 더 이상 감소하지 않으면 교육이 중지됩니다.
        
        즉 계속 작아져야 진행이 되고 커지면 중지됩니다.
        
    - **`mode='max'`**
        
        : 모니터링되는 양이 증가를 멈추면 교육이 중지됩니다. 
        
        즉 계속 커져야 진행이 되고 작아지면 중지됩니다.
        
    - **`mode='auto'`**
        
        : 모니터링할 수량의 방향은 자동으로 설정됩니다.
        

### 3. 예시 코드

```python
from keras.callbacks import EarlyStopping

early_stopping = EarlyStopping(
monitor='val_loss',
min_delta=0.01, patience=3, 
verbose=1, 
mode='min')

model.fit(X_train, y_train, epochs=10, validation_data=(X_val, y_val), callbacks=[early_stopping])

```

위의 **`EarlyStopping`**함수는 val_loss 를 모니터링하고 3회 연속 에포크 동안 

val_loss 가 0.01 이상 줄어들지 않으면 교육을 중지합니다.