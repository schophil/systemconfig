# Spring

## IoC

_Inversion of Control_

Control flow is managed by the framework.
The framework will _call_ the specific logic at specific points.

For example the @Controller annotation will convert a class into a REST controller.
The framework will receive the actual request and call the right method on the controller.

_Dependency Injection_

This concerns object composition. 
It defines how an object gets the objects/resources it depends on.

It is related to IoC but they are not really equal.

We can distinct 3 important features:
1. Bean definition - _which_ beans can be injected
1. Definition of the injection points - _where_ do the beans need to be injected
1. The scope of the injected beans - the lifecycle of the injected beans

## Application context

Represents the IoC container. It will assemble beans using a configuration.

Configuration can be done using:
- XML
- annotations
- Java code

Different types of application contexts exist; based on classpath, based on web-xml etc.

So spring takes your classes, your configuration and creates a fully functional system.

## Using javax.inject

@Inject: To indicate fields, constructors and setters that need injection.

If you have multiple possible implementations for a given interface that you want to inject, you need to use a qualifier.
@Named can be used:
1. On the injection point to refer to a specific _named_ bean.
1. On the candidate class to give it a _name_.

With @Qualifier you can create your own specific qualifiers.
@Named is a default qualifier.

## Using spring specific annotations

- Component
- Controller
- Service

The Spring annotations @Configuration and @Bean are used on a object that _defines and creates_ beans.
Example:
```
@Configuration
public class Foo {
	@Bean
	public Car car() {  }
}
```

## Bean injection

Dependency Injection in Spring can be done through constructors, setters or fields.

It is better to use constructor dependency:
- It clearly indicates what is mandatory for the class.
- It helps to identify code smells - a class with too many mandatory constructor arguments probably has too much responsabilities.
- Class can be made immutable (no setters).

The dependencies through setters can be handy for optional dependencies.
Make sure to set default values to avoid null checks all over the place.
An advantage though is that the class can be modified _after_ construction (can be handy for JMX).

## Bean scopes

By default _singleton_, one instance per application context.

Other scopes:

1. Prototype: Oposite of singleton. Each time the bean is referenced, a new instance is created.
1. Request: Scope is the lifecycle of a HTTP request. So an instance is coupled to the processing of a HTTP request. (WEB)
1. Session: Bean instances are coupled to HTTP sessions. (WEB)
1. Application: Bean instances are coupled to the SevletContext. (WEB)

## Others

_Micronaut_

Similar to Spring (same annotations can be used).

Similar to Spring Boot
- classpath scanning
- sensible defaults
- functionality is added though dependencies
- configuration through external file
- support for environments

Uses JVM annotation processing to avoid using reflection at runtime to find insertion points. This leads to shorter startup times and a smaller footprint (mempry).

Some errors can also be found at compile time.

