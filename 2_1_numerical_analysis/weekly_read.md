**수치해석**
국립창원대학교 재료금속공학과 [정영웅](mailto:yjeong@changwon.ac.kr)

# 수업 목표
 - 기초 수치해석을 이해하고, Python 등의 프로그램을 활용해 수치해석에 활요할 수 있다.
# 주차별 내용
# Week1
## 수업 01-1 (오리엔테이션)
  + 대상
    * 국립창원대학교 재료금속공학과 2학년 학생
    * 전공 필수 교과로써 반드시 이수하여야만 졸업 가능
    * 수업을 원활히 이해하기 위해서는 [**mse_data**](https://youngung.github.io/lecturenotes/data_mse/data_mse/) 강의를 선수강하길 강력 권함.
  + 준비물
    * 강의자료는 [여기](https://youngung.github.io/teaching)에서 찾을 수 있음
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
      - 예제: MacLaurin series expansion for chemical potential
  + 오차 측정 방법
    * (1) 절대 오차 (absolute error)
      $$
      E^a=|x^{true}-x^{approx}|
      $$
      ```python
      x_true=3
      x_approx=3.5
      err_rel= abs(x_true-x_approx)
      ```
    * (2) 상대 오차 (relative error)
      $$
      E^r=\frac{|x^{true}-x^{approx}|}{|x^{true}|}
      $$
      ```python
      x_true=3
      x_approx=3.5
      err_rel= abs(x_true-x_approx)/abs(x_true)
      ```
      ** 상대 오차를 사용할 수 없는 경우는 언제일까?
    * (3) 수열의 오차?
      만약 수열
      $$
      \boldsymbol x
      $$
      가 여러 값으로 이루어진 배열이라면?
      각 배열내의 요소의 절대 오차가 아래와 같이 정의되겠다.
      $$
      E_i=|x^{true}_i-x^{approx}_i|
      $$
      전체 수열의 오차를 구하면?
      $$
      \sum_iE_i=|x^{true}_i-x^{approx}_i|
      $$
      혹은 아래와 같이 표현이 더욱 유용할 수 있겠다.
      $$
      Error=\sqrt{\sum_i(x^{true}_i-x^{approx}_i)^2}
      $$
      위와 같은 수열의 오차를 표현하자면 아래와 같다.
      ```python
      import numpy as np # numpy 패키지 활용
      x_true  =np.array([  1,   2,  4])
      x_approx=np.array([1.3,-1.9,4.3] )

      summedup=0.
      for i in range(len(x_true)):
        summedup+=(x_true[i]-x_approx[i])**2
      error=np.sqrt(summedup)

      ## 혹은 Numpy의 broadcasting 기능과 .sum() method 활용해
      ## 더욱 축약해 아래와 같이 표현할 수 있겠다.
      error=np.sqrt(((x_true-x_approx)**2).sum())
      ```
    * 두 벡터
      $$
      \boldsymbol a, \boldsymbol b
      $$
      가 서로 얼마나 유사한지, 둘 사이의 오차를 구한다면?
      $$
      \boldsymbol a -\boldsymbol b=?
      $$

      $$
      Error=\sqrt{(a_1-b_1)^2+(a_2-b_2)^2+(a_3-b_3)^2}
      $$
      혹은 위의 수열에 대한 오차를 표기했듯
      $$
      Error=\sqrt{\sum_i^3(a_i-b_i)^2}
      $$
      라 표기할 수 있겠다. 그리고 이는 더욱 축약하자면
      $$
      Error=|\boldsymbol a- \boldsymbol b|
      $$
      와 같이 표기할 수 있겠다.

      만약 상대 오차를 구한다면?
      $$
      Error=\frac{|\boldsymbol a- \boldsymbol b|}{0.5(|\boldsymbol a|+|\boldsymbol b|)}
      $$
      혹은 더욱 명백하게 인덱스 notation을 활용해 표현하자면
      $$
      Error=\frac{\sqrt{(a_1-b_1)^2+(a_2-b_2)^2+(a_3-b_3)^2}}{0.5\big(\sqrt{a_1^2+a_2^2+a_3^2}+\sqrt{b_1^2+b_2^2+b_3^2}\big)}
      $$
      ```python
      import numpy as np
      def get_abs(v):
          """
          Function that calculates the magnitude of
          given vector `v`

          Arguments
          ---------
          v

          Returns
          -------
          the magnitude of given vector v
          """
          return np.sqrt(v[0]**2+v[1]**2+v[2]**2)

      ## two vectors
      a=np.array([1. ,2. ,3. ])
      b=np.array([1.2,1.9,3.1])

      ## absolute error between the two vectors
      err=get_abs(a-b)
      print('1 error:',err)
      ## Relative error between the two vectors
      err=get_abs(a-b) #분자까지만,
      err=err/0.5*(get_abs(a)+get_abs(b)) # 분모로 나누면..
      print('2 error:',err)
      ```

## 수업 02-2 (컴퓨터의 유한 정밀도 (floating point 개념))
  + 유한정밀도
    - 컴퓨터는 0과 1 (이진수, binary)만 저장할 수 있음.
    - 무리수를 비롯한 실수(real number)는 무한히 많은 자리수 (3.141592...)를 가질 수
      있으나, 메모리가 한정되어 정해진 비트 수까지만 저장가능함 (32비트, 62비트 등)
    - 그로인해 수를 근사치로 저장하고 표현함; 유한한 정밀도를 가짐 (finite precision)
  + 부동 소수점 (Float point) (cf. <-> 고정 소수점 (Fixed piont))
    - 수를 저장하는 방식
      부호(sign), 지수(exponent), 가수(mantisa)를 각각 이진법(0 혹은 1)로 표현함.
    $$
    값=(-1)^{sign}\times (1+mantisa)\times 2 ^{exponent-bias}
    $$
    - 예 10진수 5.75를 저장하기
      * 5 = ```101```
      * 0.75 = ``0.11``

        0.75를 이진수로 만들기 위해서는 우선 2를 곱한다:
        $$
        0.75\times 2 = 1.5
        $$
        실수 ```1```을 제외한 나머지 ```0.5```에 다시 2를 곱한다.
        $$
        0.5\times 2 = 1.0
        $$
        실수 ```1```을 제외한 나머지가 0이 되어 사라질때까지 반복한다.
        따라서  5.75 = `101.11` 가 된다. 이 값을 정규화와 부호 및 지수 처리를 한 후 저장.

      * 정규화(normalization)

        [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754)에 의하여
        항상 수를
        $$
        1.\text{XXXX..} \times 2^n
        $$
        형태로 바꿔서 저장함.
        $$
        101.11=1.\green{0111}\times 2^{\red{2}}
        $$
        위와 같이 저장하면 두 부분의 수가 저장되어야 함.
        + 가수(mantissa) = $\green{0111}0000$ (정해진 칸내에서 유효숫자 뒤는 0으로 채운다.)
        + 지수(exponent) = $\red{2}$
        + base가 ```2```인 이유는 이진법을 활용하기 때문에...
      * 부호

        ```5.75```는 양수 이므로, 부호는 양수로 저장 (부호비트 이진수 = ```0```)

      * 지수

        [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754)에 의하여 지수를
        바이어스(bias) 방식으로 저장한다.
        - [double precision](https://en.wikipedia.org/wiki/Double-precision_floating-point_format)의 바이어스는 = $\blue{1023}$
        - 실제 지수는 $\red{2}$.
        - 저장되는 지수는 $\red{2}+\blue{1023}$=1025
        - 따라서 바이어스 처리된 1025를 아래와 같이 2진수로 표현하면?
        ```text
        1025 ÷ 2 = 512 … 1
        512 ÷ 2  = 256 … 0
        256 ÷ 2  = 128 … 0
        128 ÷ 2  = 64  … 0
        64 ÷ 2   = 32  … 0
        32 ÷ 2   = 16  … 0
        16 ÷ 2   = 8   … 0
        8 ÷ 2    = 4   … 0
        4 ÷ 2    = 2   … 0
        2 ÷ 2    = 1   … 0
        1 ÷ 2    = 0   … 1
        ```
        ```10000000001```가 된다 (11비트, 즉 2진법으로 11자리)
      * 가수 (Mantissa, fraction)

        정규화된 수 $1.0111 \times 2^2$ 에서 앞의 1은 항상 생략(숨겨진 1),
        따라서 저장되는 건 0111 뒤에 0으로 채운 52비트입니다.
        mantissa = 0111000...0 (52비트)

      * ```5.75```를 [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754)
      방식으로 저장한다면..
        - 부호 = ```0``` (1비트, 즉 0(+) 또는 1(-))
        - 지수 = ```10000000000``` (11비트)
        - 가수 = ```0111000000000000000000000000000000000000000000000000``` (54비트)
  + 유한 정밀도 (finite precision)의 한계
    * 가수부가 52비트로 제한되어 있음. 약 15~16자리 10진수까지만 정확히 표현 가능
    * 그 이후 자리수는 '잘림'(truncation)
    * 반올림 오차가(round-off error)가 발생
    * 한계 사례
      - 0.1 을 저장한다면...
        0.1=```0.00011001100110011 ... ``` (무한 반복되어 정확히 저장 불가)
      - 큰 수와 작은수를 더할 때
        $$
        10^{16}+1-10^{16}=?
        $$
        ```python
        print(1e16+1-1e16)
        ```
      - 연산 순서에 따라 결과가 달라질 수 있음
        ```python
        # 예제 1: 큰 수 + 작은 수
        a = 1e16   # 매우 큰 수
        b = 1.0    # 작은 수
        c = -1e16  # 큰 음수

        res1 = (a + b) + c
        res2 = a + (b + c)

        print("(a + b) + c =", res1)
        print("a + (b + c) =", res2)
        ```

# Week3
  + 목표
    - 방정식을 해석적(analytic)으로 그리고 수치적(numerical)으로 푸는 방법 비교
## 수업 03-1 (방정식을 왜 수치적으로 풀어야 하나), 해석적 풀이 vs. 수치적 풀이, 2차 방정식 손계산
  + 해석적 풀이가 가능한 경우
    - 1차, 2차 방정식: 공식 존재
      * $ax^2+bx+c=0$ 의 근의 공식
      * $x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}$
  + 해석적 풀이가 불가능하거나 매우 복잡한 경우
    - [5차이상의 다항식의 경우, 근의 공식 없음](https://ko.wikipedia.org/wiki/오차_방정식) (사칙연산이나, 거듭 제곱근 등, 손으로 계산 못한다.) 하지만 실근은 존재한다.
    ```python
    import matplotlib.pyplot as plt
    import numpy as np

    def poly(x,*args):
        """
        polynomial function
        """
        n=len(args)-1
        y=0.
        print('n,i,arg')
        for i, arg in enumerate(args):
            print(n,i,arg)
            y+=arg*(x**n)
            n-=1
        return y

    xs=np.linspace(-1.3,1,100)
    ys=poly(xs,-5,-2,5,3,2,1)
    plt.plot(xs,ys,'-')
    ```
    - $x=\cos(x)$ 만족하는 $x$값 구하기.
      근은 존재한다.
      ```python
      import numpy as np
      import matplotlib.pyplot as plt
      def func(x):
          return np.cos(x)-x

      xs=np.linspace(-10,10)
      plt.plot(xs,func(xs),label=r'$y=\cos(x)$')
      plt.axhline(c='k')
      plt.legend()
      ```

## 수업 03-2
# Week4
## 수업 04-1 vs 근사 계산
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