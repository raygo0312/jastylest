#import "./template-document.typ": *

#show: it => jarticle(
  // titlepage: true,
  title: "おあそび",
  author: "raygo",
  date: true,
  it,
)

複素関数$f(z)=u(x,y)+i v(x,y)a b$が点，$z_0=x_0+i y_0$において正則であるための必要十分条件は，$z_0$のある$epsilon$近傍$Delta(z_0,epsilon)$においてコーシー・リーマン方程式
$
(partial u)/(partial x)&=(partial v)/(partial y)\
(partial u)/(partial y)&=-(partial v)/(partial x)
$
を満たすことである．

$epsilon$-$delta$論法