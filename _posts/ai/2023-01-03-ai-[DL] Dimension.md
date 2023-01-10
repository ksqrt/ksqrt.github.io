---
layout: single
title: "[DL] Dimension"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

딥러닝 에서의 행렬의 종류

1. 스칼라 
2. 벡터 : 스칼라 의 모임 
    - x=[1,2,3] 일시 (3, ) 인데
        
        이것은 3개의 스칼라를 지니고 있는 벡터를 뜻합니다.
        
    - x= [[1],[2],[3]] 는 (3, 1)
    - x= [[1,2,3]] 는 (1, 3)
    
    작성 요령은 
    
    3개 짜리 가 1개 이며  ( ) **뒤**부터 **작은 단위** 부터 작성하도록 합시다.
    
    ex)
    
    ```python
    a = np.array([[1,2],[3,4]])
    print(a.shape)
    b = np.array([[[1,2,3]]])
    print(b.shape)
    c = np.array([[1,2,3],[4,5,6]])
    print(c.shape)
    d = np.array([[[1],[2]]])
    print(d.shape)
    e = np.array([[1,2,3],[4,5]])
    print(e.shape)
    ```
    
    ```python
    (2, 2)
    (1, 1, 3)
    (2, 3)
    (1, 2, 1)
    (2,)
    
    **C:\Users\bitcamp\AppData\Local\Temp\ipykernel_1496\444391095.py:9: VisibleDeprecationWarning: Creating an ndarray from ragged nested sequences (which is a list-or-tuple of lists-or-tuples-or ndarrays with different lengths or shapes) is deprecated. If you meant to do this, you must specify 'dtype=object' when creating the ndarray.
      a = np.array([[1,2,3],[4,5]])**
    ```
    
    참고로 e = np.array([[1,2,3],[4,5]]) 같이 잘못된 array 작성시 에러가 발생하므로 조심합시다
    
3. 텐서

위에서 작성한 모든 다차원 배열을 텐서라고 합니다.

 "텐서(tensor)"라는 용어는 수학 분야에서 유래했으며, 여기서는 여러 차원의 배열을 나타냅니다. 기계 학습에서 텐서는 이미지, 오디오 신호 및 텍스트와 같은 데이터와 신경망의 가중치 및 편향을 나타내는 데 사용됩니다.

Python에서 이 **`Tensor`**클래스는 널리 사용되는 기계 학습 라이브러리인 PyTorch에서 텐서를 나타내는 데 사용됩니다. **`Tensor`**NumPy 배열은 TensorFlow 라이브러리 의 클래스와 마찬가지로 Python에서 텐서를 나타내는 데 사용할 수도 있습니다 .

텐서는 딥 러닝 뒤에 있는 기계의 중요한 부분이며 많은 머신 러닝 알고리즘 및 데이터 파이프라인에서 중심적인 역할을 합니다.