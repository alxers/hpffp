## 1.2 What is functional programming?

The essence
of functional programming is that programs are a combination of
expressions. Expressions include concrete values, variables, and also
functions. Functions have a more specific definition: they are expres-
sions that are applied to an argument or input, and once applied, can
be reduced or evaluated.

The word purity in functional programming is sometimes also used to
mean what is more properly called referential transparency. Referential
transparency means that the same function, given the same values
to evaluate, will always return the same result in pure functional
programming, as they do in math.


## 1.3 What is a function?

A function is a relation between a set of
possible inputs and a set of possible outputs. The function itself
defines and represents the relationship.


## 1.4 The structure of lambda terms

The lambda calculus has three basic components, or lambda terms:
expressions, variables, and abstractions.

The word expression refers to a superset of all those things: an expression can be a variable name, an
abstraction, or a combination of those things. The simplest expression
is a single variable.

An abstraction is a function. It is a lambda term that has a head (a
lambda) and a body and is applied to an argument. An argument is an
input value.


Abstractions consist of two parts: the head and the body. The head of
the function is a λ (lambda) followed by a variable name. The body of
the function is another expression. So, a simple function might look
like this:

λx.x

The variable named in the head is the parameter and binds all instances
of that same variable in the body of the function. That means, when
we apply this function to an argument, each x in the body of the
function will have the value of that argument.

### Alpha equivalence

The variable x here is not semantically meaningful except in its role in
that single expression. Because of this, there’s a form of equivalence
between lambda terms called alpha equivalence. This is a way of saying
that:

λx.x   
λd.d   
λz.z   

all mean the same thing. They’re all the same function.


## 1.5 Beta reduction

When we apply a function to an argument, we substitute the input
expression for all instances of bound variables within the body of
the abstraction. You also eliminate the head of the abstraction, since
its only purpose was to bind a variable. This process is called beta
reduction.

(λx.x) 2  
2  
The only bound variable is the single x, so applying this function to 2
returns 2. This function is the identity function

We can also apply our identity function to another lambda abstraction:
(λx.x)(λy.y)
In this case, we’d substitute the entire abstraction in for x. We’ll use a
new syntax here, [x ∶= z], to indicate that z will be substituted for all oc-
currences of x (here z is the function λy.y). We reduce this application
like this:

(λx.x)(λy.y)   
[x ∶= (λy.y)]   
λy.y   

Applications in the lambda calculus are left associative. That is, unless
specific parentheses suggest otherwise, they associate, or group, to
the left.

(λx.x)(λy.y)z  

can be rewritten as:

((λx.x)(λy.y))z   

### Free variables

Variables in the body that are not bound by the head


## 1.6 Multiple arguments

Each lambda can only bind one parameter and can only accept one
argument. Functions that require multiple arguments have multiple,
nested heads. When you apply it once and eliminate the first (left-
most) head, the next one is applied and so on.

λxy.xy   

is a convenient shorthand for two nested lambdas (one for each argu-
ment, x and y):

λx.(λy.xy)   

### Intermission: Exercises
1. λxy.xz
=> Equal to λmn.mz

2. λxy.xxy
=> Equal to λa(λb).aab

3. λxyz.zx
=> Equal to λtos.st


## 1.7 Evaluation is simplification

There are multiple normal forms in lambda calculus, but here when
we refer to normal form we mean beta normal form. Beta normal form
is when you cannot beta reduce (apply lambdas to arguments) the
terms any further. This corresponds to a fully evaluated expression,
or, in programming, a fully executed program.

## 1.8 Combinators

A combinator is a lambda term with no free variables. Combinators,
as the name suggests, serve only to combine the arguments it is given.
So the following are combinators because every term in the body
occurs in the head:

1. λx.x
x is the only variable and is bound because it is bound by the
enclosing lambda.
2. λxy.x
3. λxyz.xz(yz)

And the following are not because there’s one or more free variables:

1. λy.x
Here y is bound (it occurs in the head of the lambda) but x is free.
2. λx.xz
x is bound and is used in the body, but z is free.


## 1.9 Divergence

Not all reducible lambda terms reduce neatly to a beta normal form.
This isn’t because they’re already fully reduced, but rather because
they diverge. Divergence here means that the reduction process never
terminates or ends.

Here’s an example of a lambda term called omega that
diverges:
1. (λx.xx)(λx.xx)
x in the first lambda’s head becomes the second lambda

2. ([x ∶= (λx.xx)]xx)
Using [var ∶= expr] to denote what x has been bound to.

3. (λx.xx)(λx.xx)
Substituting (λx.xx) in each for each occurence of x. We’re back
to where we started and this reduction process never ends — we
can say omega diverges.


## 1.11 Exercises

Determine if each of the following are combinators
1. λx.xxx => yes, no free variables
2. λxy.zx => no, z is a free variable
3. λxyz.xy(zx) => yes, no free variables
4. λxyz.xy(zxy) => yes, no free variables
5. λxy.xy(zxy) => no, z is a free variable

Determine if each of the following can be
reduced to a normal form or if they diverge.
1. λx.xxx => can be reduced
2. (λz.zz)(λy.yy) => is a diverge
3. (λx.xxx)z => can be reduced

Evaluate (that is, beta reduce) each of the following
expressions to normal form.

1. (λabc.cba)zz(λwv.w)   
λa(λb(λc.cba)zz(λwv.w)   
λb(λc.cbz)z(λwv.w)   
(λc.czz)(λwv.w)   
(λwv.w)zz   
(λv.z)z   
z   
2. (λx.λy.xyy)(λa.a)b   
(λy(λa.a)yy)(b)   
(λa.a)bb   
bb   
3. (λy.y)(λx.xx)(λz.zq)   
(λx.xx)(λz.zq)   
(λz.zq)(λz.zq)   
(λz.zq)q   
qq   
4. (λz.z)(λz.zz)(λz.zy)   
Hint: alpha equivalence.   
(λz.zz)(λz.zy)   
(λz.zy)(λz.zy)   
(λz.zy)y   
yy   
5. (λx.λy.xyy)(λy.y)y   
(λy.(λy.y)yy)y   
(λy.y)yy   
yy   
6. (λa.aa)(λb.ba)c   
((λb.ba)(λb.ba))c   
((λb.ba)a)c   
aac   
7. (λxyz.xz(yz))(λx.z)(λx.a)   
(λx(λy(λz.xz(yz)))(λx.z)(λx.a)   
  rename (λx.z) to (λx.z1), because it's a different z   
x:= (λx.z1)   
(λy(λz.(λx.z1)(z)(yz)))(λx.a)   
(λz.(λx.z1)(z)((λx.a)z))
-> (λx.z1)z -> z1   
(λz.z1((λx.a)z))
-> (λx.a)z -> a   
λz.z1a   
