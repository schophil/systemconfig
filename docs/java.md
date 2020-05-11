# Java

Just an overview of the most interesting features.

## Access modifiers

All methods or accessible there where they are declared.

Default – No keyword required: Only accessible from classes from the same package _and_ subclasses from the same package.
Private: Only accessible inside the object ( instance ).
Protected: Only accessible to classes of the same package _and_ any sub class.
Public: Accessible to all.

## Copy by value

Java is always copy by value. However for objects the reference to the object is passed.
One exception are immutable objects like String. Those are copied by value.

https://www.javaworld.com/article/3512039/does-java-pass-by-reference-or-pass-by-value.html

## Java 8

**Static and default methods on interfaces.**

```
public interface Foo {
	static String bar() { ... }
	default String name() { ... }
}
```

Default methods can be overwritten. Mostly introduced for upgrading existing interfaces without breaking backward compatibility.

Static interface methods can only be accessed inside/through the interface. Hence they don't behave totally like _normal_ static methods.

**Methods references**

Static methods:

```
User::hasAccess;
```

Instance methods (two forms):

```
User user = new User();
user::getLongName
```

```
String::concat
```

Constructors:

```
User::new
```

**Optional**

Factory methods: Optional.of(), Optional.empty(), Optional.ofEmpty()

Interesting methods: map(), orElse(), flatMap(), orElseThrow()

**Streams**

Multithreading with _parallelStream()_ which converts a normal stream to one with parallel computation.

Different operations are possible, divided in:
1. Intermediate operations: can be chained, are lazy
2. Terminal operations: trigger iteration, cannot be chained

Intermediate operations: filtering, mapping
Terminal operations: forEach, collect, reduce, count, first

A word on _count_: An implementation may choose to not execute the stream pipeline (either sequentially or in parallel) if it is capable of computing the count directly from the stream source. In such cases no source elements will be traversed and no intermediate operations will be evaluated. Behavioral parameters with side-effects, which are strongly discouraged except for harmless cases such as debugging, may be affected.

In other words when doing something like the code below. It is _not_ guaranteed that the logic inside the peek will be executed for each element. If the stream comes from a linked list for example, the value of _count_ can just be get from the list without iterating over the list. 

stream.peek(_do something_).count()

We should avoid using operations that modify a shared variable. As streams are meant to be also facilitate parallelism it is dangerous. 
Instead try to solve the problem with the reduce method.

**Lambda expressions**

Any interface can be used as a functional interface if it only has 1 abstract method.

The package java.util.funtions contains common functional interfaces.

There is an annotaion @FunctionalInterface that can be used to indicate that an interface is to be used as lambda function type.
The annotation is not really needed but it helps declaring an intent.

Inside a lambda expression this refers to the enclosing type (enclosing scope).

When accessing a variable declared outside of the lambda expression this variable needs to be final or _effective final_. 
The latter means that its value is never changed.

https://www.baeldung.com/java-8-lambda-expressions-tips

## Java 9

**Module system (Jigsaw).**

**HTTP Client**

**Interface private methods**

**JShell**

## Java 10

**Local variable type inference**

```
var message = "Hello World";
```

Type is inferred. Can only be used for local variables (in methods).
Var is not a keyword, it is some kind of type.
Type of the variable cannot change at runtime.
Initial value is mandatory!
Null cannot be assigned.

**Container awareness**

## Java 11

**New string methods**

String::isBlank		// checks if string is empty
String::lines		// devide string by line termination
String::repeat		// repeats the string N times

```
jshell> "   ".isBlank()
$1 ==> true

jshell> "".isBlank()
$2 ==> true

jshell> "\t".isBlank()
$3 ==> true

jshell> "\t   \t   ".isBlank()
$4 ==> true
```

```
jshell> "hello".repeat(0)
$5 ==> ""

jshell> "hello".repeat(1)
$6 ==> "hello"

jshell> "hello".repeat(2)
$7 ==> "hellohello"
```
