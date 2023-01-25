---
layout: single
title: "[DL] 풀링(pooling)"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

### 1. 풀링

풀링(pooling) 과정은 컨볼루션 계층에서 추출한 특징을 압축하는 과정입니다. 풀링 계층은 컨볼루션 계층에서 얻은 특징 맵(feature map)을 입력으로 받아, 이를 작은 크기의 특징 맵으로 압축합니다.

### 2. Max Pooling

일반적으로 사용되는 풀링 연산은 Max Pooling과 Average Pooling 입니다. Max Pooling은 주어진 영역에서 가장 큰 값을 선택하는 연산이고, Average Pooling은 주어진 영역에서 평균 값을 계산하는 연산입니다.

[https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FRhHG9%2FbtrbRaEEkDN%2FrkNLEAaKtalrEkYGuJ2kwK%2Fimg.png](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FRhHG9%2FbtrbRaEEkDN%2FrkNLEAaKtalrEkYGuJ2kwK%2Fimg.png)

그림 : max pooling

2x2 Max Pooling 은 특징 맵에서 2x2 크기의 영역마다 가장 큰 값을 선택하여 압축하는 것 입니다. 이렇게 하면 특징을 추출하는데 사용되는 파라미터 수를 줄일 수 있고, 일반화를 위해 특징을 추출하는데 사용되는 정보를 줄여줄 수 있습니다.

### 3. keras 레이어로 사용방법

```python
from keras.layers import MaxPooling2D,AveragePooling2D

# 2x2 Max Pooling
pooling_layer = MaxPooling2D(pool_size=(2, 2))
# 2x2 Average Pooling
# pooling_layer = AveragePooling2D(pool_size=(2, 2))
```

이렇게 하면 2x2 크기의 영역마다 가장 큰 값을 선택하여 압축하는 Max Pooling을 수행합니다. pool_size를 변경하면 다른 크기의 pooling을 수행 할 수 있습니다.

또한, Average Pooling 을 사용하려면 AveragePooling2D 를 사용하면 됩니다.

### 3. 요약

CNN의 풀링 과정은 컨볼루션 계층에서 추출한 특징을 압축하는 과정으로 Max Pooling, Average Pooling 을 주로 사용합니다. 풀링을 통해 파라미터 수를 줄이고 일반화를 위해 특징을 추출하는데 사용되는 정보를 줄일 수 있습니다.