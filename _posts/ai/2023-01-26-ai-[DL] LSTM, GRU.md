---
layout: single
title: "[DL] LSTM, GRU"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

### 1. LSTM

RNN 의 경우 학습이 오래 지속될 경우 초기 학습한 내용이 잊혀진다는 단점이 있는데 

LSTM 은 이를 개선하였습니다.

LSTM은 기존 RNN과는 달리 은닉 상태(hidden state)와 셀 상태(cell state)를 각각 가지고 있습니다. 은닉 상태는 현재 시점의 정보를 기억하며, 셀 상태는 과거의 정보를 기억합니다. 이렇게 은닉 상태와 셀 상태를 분리함으로써 긴 시퀀스 데이터를 처리할 때 기억할 정보를 선별적으로 관리할 수 있습니다.

LSTM은 기억 게이트(memory gate), 입력 게이트(input gate), 출력 게이트(output gate)를 가지고 있습니다. 기억 게이트는 셀 상태에서 어떤 정보를 유지할지, 입력 게이트는 새로운 정보를 셀 상태에 얼마나 반영할지, 출력 게이트는 셀 상태에서 어떤 정보를 은닉 상태로 전달할지를 결정합니다. 이렇게 기억 게이트, 입력 게이트, 출력 게이트를 통해 LSTM은 셀 상태와 은닉 상태를 선별적으로 관리하며, 긴 시퀀스 데이터를 처리할 때 효율적입니다.

### 2.  keras 에서의 LSTM 사용방법

```python
from keras.models import Sequential
from keras.layers import LSTM, Dense

# 모델 생성
model = Sequential()

# LSTM 층 추가
model.add(LSTM(units=64, input_shape=(timesteps, input_dim)))

# 출력층 추가
model.add(Dense(1, activation='sigmoid'))
```

### 3. GRU

LSTM의 장기기억능력은 보존하면서 연산은 적은 모델입니다.

GRU는 이전 시점에서의 정보를 얼마나 유지할지 결정하는 게이트(gate)를 사용합니다. 이를 통해 시간에 따른 정보의 흐름을 제어하며, 긴 시퀀스의 기억을 제대로 할 수 있도록 합니다. GRU는 다층 퍼셉트론과 비슷하게 파라미터를 학습하며, 텍스트 분류, 언어 모델링 등 다양한 자연어 처리 작업에 사용됩니다.

### 4.  keras 에서의 GRU 사용방법

```python
from keras.models import Sequential
from keras.layers import Dense, GRU

# 모델 생성
model = Sequential()

# LSTM 층 추가
model.add(GRU(units=64, input_shape=(timesteps, input_dim)))

# 출력층 추가
model.add(Dense(1, activation='sigmoid'))
```