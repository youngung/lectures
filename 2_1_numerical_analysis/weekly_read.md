**수치해석**
국립창원대학교 재료금속공학과 [정영웅](mailto:yjeong@changwon.ac.kr)

# 수업 목표
 - 기초 수치해석을 이해하고, Python 등의 프로그램을 활용해 수치해석에 활요할 수 있다.
# 주차별 내용
# Week1
## 수업 01-1 (오리엔테이션)
## 수업 01-2 (수치해석 전반 설명)
# Week2
## 수업 02-1 (수와 오차 Error)
  + 컴퓨터의 수
    * 컴퓨터가 다루는 수에는 항상 오차가 있다. (한정된 메모리)
  + 수의 종류
    - 정수 (integer): ..., -2, -1, 0, 1, 2, ...
    - 유리수 (rational): 분수로 나타낼 수 있는 수 (1/2, 2/3, 0.5, ...)
    - 무리수 (irrational): 소수로 끝없이 이어지는 수 (3.141592... , 1.414213..., Euler's number)
    ```python
    import numpy as np
    print('pi:',np.pi)
    # 내 컴퓨터에서는 3.141592653589793 까지만 출력되었다.
    # 여러분들 컴퓨터는 어떤가?
    print('Euler number:',np.exp(1))
    # 마찬가지로 2.718281828459045 까지만 출력되었다.
    ```
  + 오차의 종류
    * (1) 반올림 오차 (round-off error).
      메모리가 유한하므로, *유한한* 자리수까지만 저장한다.
      예: ```0.3333..```을 소수점 네자리까지만 저장하면 0.3333이 되고, 진짜 값과 '오차'가 생깁니다.
      ```python
      a = 0.1 + 0.2
      print(a)   # 0.30000000000000004
      ```
      위 예시에서, 컴퓨터는 2진법으로 수를 저장하다 보니, 정확히 0.3이 계산되지 않고, 오차가 생깁니다.

    * (2) 절단 오차 (truncation error)
      무한한 계산 과정을 중간에 끊어서 근사(approximation)할 때 생기는 오차에요. 예를 들어, Taylor급수로 sin(x)를 표현하면,
      $$
      \sin x= \sum_{n=0}^\infty\frac{(-1)^n}{(2n+1)!}x^{2n+1}
      $$
      따라서 만약 n=0,..,3까지만 전개해보면 아래와 같다.
      $$
      \sin x\approx
      \frac{1}{1!}x^1
      +\frac{-1^1}{3!}x^3
      +\frac{(-1)^2}{5!}x^5
      +\frac{-1^3}{7!}x^7
      $$

      우선 Factorial을 구현할 Python 함수를 구해보자.

      ```python
      def factorial(x):
          val=1
          for i in range(1,x+1):
              val=val*i
          return val

      ## Test factorial function
      for i in range(1,4):
          print(f'{i}! = {factorial(i)}')
      ```

      실은 math library에 이미 factorial 함수가 존재한다.
      ```python
      import math
      math.factorial(3)
      ```

      그 다음으로 테일러 급수를 함수로 표현해보면...
      ```python
      def sinx_taylor(x,fin):
          val=0.
          for n in range(0,fin+1):
              term=(-1)**n/(factorial(2*n+1))*(x**(2*n+1))
              # print(f'{n}-th term: {term}')
              val+=term
          return val
      ```

      - 테일러 항 차수에 따라 달라지는 오차의 변화를 살펴보자.
        * n값의 변화에 따라서,
        * 여러 x값에서 Taylor 급수와의 차이값을 그려보자.
        ```python
        import matplotlib.pyplot as plt
        import numpy as np
        xs=np.linspace(-1.5*np.pi,1.5*np.pi)

        plt.plot(xs,np.sin(xs),label='actual')
        for n in range(2,10):
            ys=sinx_taylor(xs,n)
            plt.plot(xs,ys,label=f'Taylor series n={n}')
        plt.legend()
        plt.xlim(-4,4)
        plt.ylim(-2,2)
        ```



## 수업 02-2 (컴퓨터의 유한 정밀도 (floating point 개념))
# Week3
## 수업 03-1 (근사치, 유효숫자, 반올림, 잘림(truncation))
## 수업 03-2 (유효숫자 계산 풀기)
# Week4
## 수업 04-1 (방정식을 왜 수치적으로 풀어야 하나), 해석적 풀이 vs. 수치적 풀이, 2차 방정식 손계산 vs 근사 계산)
## 수업 04-2 (2차 방정식 풀이 Python module 만들기)
# Week5
## 수업 05-1 (이분법 - Bisection method, root 2 찾기)
## 수업 05-2 (Newton raphson method)
# Week6
## 수업 06-1 고정점 반복법 (fixed-point iteration)
  +
  $$x=g(x)$$
  형태 변환과 반복
  + 수렴 조건
  + 간단한 함수로 실습
## 수업 06-2
# Week7 (중간고사)
## 수업 07-1
## 수업 07-2
# Week8 (연립방정식)
## 수업 08-1
## 수업 08-2
# Week9 (가우스 소거법)
## 수업 09-1
## 수업 09-2
# Week10 (가우스 조던법과 역행렬)
## 수업 10-1
## 수업 10-2
# Week11 (보간법)
## 수업 11-1
## 수업 11-2
# Week12 (수치적 분화 & 적분)
## 수업 12-1
## 수업 12-2
# Week13
## 수업 13-1
## 수업 13-2
# Week14
## 수업 14-1
## 수업 14-2
# Week15
## 수업 15-1
## 수업 15-2