---
layout: single
title: "[DL] RNN"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

### 1.RNN

RNN(Recurrent Neural Network)는 시퀀스 데이터를 처리하는데 사용되는 신경망입니다.

순차적으로 작동하는 다른 신경망과 달리, RNN은 순환적으로 작동하며, 

이전 타임 스텝의 정보(기억) 를 저장하는 셀(cell)로 구성됩니다. 

이는 시퀀스 데이터의 순서에 대한 정보를 모델링하는데 도움이 됩니다.

### 2. 이해를 돕기 위한 자료

[노베를 위한 트랜스포머 - 특이점이 온다 마이너 갤러리](https://gall.dcinside.com/mgallery/board/view/?id=thesingularity&no=57914)

개인적으로 위의 링크가 쉽게 RNN 를  정리했다고 생각합니다.

### 3. 케라스에서 simpleRNN 사용해보기

```python
from keras.layers import SimpleRNN
from keras.models import Sequential

model = Sequential()
model.add(SimpleRNN(units=64, input_shape=(None, 1)))
```