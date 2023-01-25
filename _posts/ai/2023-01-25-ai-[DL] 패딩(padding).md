---
layout: single
title: "[DL] 패딩(padding)
"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

### 1. 패딩

CNN에서 패딩(Padding)은 입력 데이터의 외곽에 추가되는 픽셀 값입니다. 

이를 통해 입력 데이터의 크기를 변경하지 않고도 컨볼루션 연산을 수행할 수 있도록 해줍니다.

### 2. (0,0) 패딩

일반적으로 패딩은 0을 사용하여 추가합니다. 이렇게 하면 입력 데이터의 크기를 변경하지 않고도 컨볼루션 연산을 수행할 수 있으며, 컨볼루션 계층에서 추출한 특징이 입력 데이터의 중심에 더 집중되도록 할 수 있습니다.

![https://blog.kakaocdn.net/dn/2hzfb/btqCJmTyg1R/unmfvdAnXwcGK16pYNAOr0/img.png](https://blog.kakaocdn.net/dn/2hzfb/btqCJmTyg1R/unmfvdAnXwcGK16pYNAOr0/img.png)

추가) 만약, 패딩을 (1,1)로 설정하면, 컨볼루션 계층에서 추출한 특징이 입력 데이터의 중심에 더 집중되도록 할 수 있습니다.

### 3. keras 층의 padding 옵션

1. same

padding='same'로 설정하면 패딩을 추가하여 

컨볼루션 연산 후의 출력 행렬의 크기가 입력 데이터와 동일하도록 할 수 있습니다.

```python
from keras.layers import Conv2D

# padding='same' 옵션을 설정하면 입력 데이터와 동일한 크기의 출력을 얻을 수 있습니다.
conv_layer = Conv2D(32, (3, 3), padding='same', activation='relu')
```

1. valid

'valid'는 padding을 하지 않는 옵션으로, 입력데이터의 크기가 변하며 컨볼루션 연산을 수행합니다.

```python
from keras.layers import Conv2D

# padding='valid' 옵션을 설정하면 패딩을 하지 않아 입력 데이터의 크기가 줄어듭니다.
conv_layer = Conv2D(32, (3, 3), padding='valid', activation='relu')
```

### 4. 마무리

padding 값을 조절하는것은 하이퍼 파라미터 튜닝 작업 중 하나입니다.

적절한 padding값을 찾아 모델의 성능을 끌어 올려보세요!