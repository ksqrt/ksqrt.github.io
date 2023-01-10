---
layout: single
title: "[DL] 원 핫 인코딩(One-Hot Encoding)"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

### 1. 원 핫 인코딩

원 핫 인코딩(one-hot encoding)은 컴퓨터가 인식할 수 있는 형태의 데이터로 변환하기 위한 기법이며 단일 값을 입력 데이터에서 가져와서 이 값을 유일한 요소로 가지는 새로운 벡터로 만들어 내는 기법입니다. 
일반적으로 이진 벡터(binary vector)를 사용하여 원 핫 인코딩을 수행합니다.

예를 들어, 우리가 세 개의 카테고리('apple', 'banana', 'orange')를 가지고 있다고 가정해봅시다.

이 카테고리 중 하나인 'banana'를 원 핫 인코딩하면 [0, 1, 0]으로 표현될 수 있습니다. 

이는 'banana'가 세 개의 카테고리 중에서 2번째이기 때문입니다.

이와 같은 원 핫 인코딩은 신경망의 입력층에서 카테고리 값을 입력 받을 때 자주 사용됩니다.

### 2. to_categorical 사용방법

```python
from tensorflow.keras.utils import to_categorical

# 정수 인코딩된 리스트
integer_encoded = [0, 1, 2]  # (3, )

# 원 핫 인코딩
one_hot_encoded = to_categorical(integer_encoded) #(3, 3)

print(one_hot_encoded)  # [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
```

### 3. tf.one_hot 사용방법

```python
import tensorflow as tf

# 정수 인코딩된 리스트
integer_encoded = [0, 1, 2, 3]

# 원 핫 인코딩
one_hot_encoded = tf.one_hot(integer_encoded, depth=4)

print(one_hot_encoded)  # [[1., 0., 0., 0.], [0., 1., 0., 0.], [0., 0., 1., 0.], [0., 0., 0., 1.]]
```

### 4. y 데이터를 원핫 인코딩 해야할떄

1. tf.one_hot

```python
# y 의 첫번째 칼럼을 원핫 인코딩 변환
y_train = tf.one_hot(y_train[0],depth =7)
y_test = tf.one_hot(y_test[0],depth= 7)
```

1. to_categorical

```python
y = to_categorical(y)
```