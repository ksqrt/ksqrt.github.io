---
layout: single
title: "[DL] 시그모이드 (sigmoid)"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

### 1. 시그모이드

시그모이드 함수(sigmoid function)은 입력값을 0과 1 사이의 값으로 변환하는 함수입니다. 

일반적으로 신경망에서 출력층의 활성화 함수로 사용됩니다. 공식으로는 아래와 같습니다.

### 2. 식과 그래프

```python
f(x) = 1 / (1 + e^(-x))
```

![https://mlnotebook.github.io/img/transferFunctions/sigmoid.png](https://mlnotebook.github.io/img/transferFunctions/sigmoid.png)

### 3. 시그모이드를 어디에 사용 해야할까요?

시그모이드 함수는 입력값이 일정한 값 이상이면 출력값은 1로 수렴하고, 일정한 값 이하이면 출력값은 0으로 수렴하기 때문에 

**이진 분류(binary classification)**에 적합합니다.

### 4. 사용법

```python
model = Sequential([
    Dense(10,input_dim = 8),
    Dense(10,activation="sigmoid"),
    Dense(10,activation="sigmoid"),
    Dense(10,activation="sigmoid"),
    Dense(10,activation="sigmoid"),
    Dense(1)
])
model.summary()
```

keras 에서 제공하는 완전연결층인 Dense  의 활성화 함수 인자값으로 활용됩니다 

참고) activation 을 지정하지않으면 default 값인 activation = “linear” 입니다