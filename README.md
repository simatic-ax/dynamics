# Dynamics Library

## Description

This library contains basic tools to work with dynamical systems. In particular, it contains dynamic controllers such as the PID Controller.

Fundamental concepts are:

- Signal (`ISignal`): Provides a long real value `output`
- Dynamic (`IDynamic`): Takes a long real value `value` and provides a long real value `output`
- Dynamic controller (`IDynamicController`): Takes two long real values `input` and `value` and provides a long real value `output`

To get a PID controller, take a `DynamicController` and assign an instance of `PID_Dynamic` to the public field `openDynamic`. You also have to assign the public field `elapsedTimeProvider` of the `PID_Dynamic`. The easiest way would be to use a `MeasuredTimeProvider`. However if you know you will call the method `Next` cyclically, for better resource efficiency use a `ConstantTimeProvider` instead and set the public field `seconds` to the cycle time in seconds.

## Install this package

Enter:

```cli
apax add @simatic-ax/dynamics
```

## Namespace

```iec-st
Simatic.Ax.Dynamics;
```

## Example

```iec-st
USING Simatic.Ax.Dynamics;

[...]

VAR_GLOBAL
    elapsedTimeProvider : MeasuredTimeProvider;
    dynamic : PID_Dynamic := (elapsedTimeProvider := elapsedTimeProvider);
    controller : DynamicController := (openDynamic := dynamic);
END_VAR

[...]

// Initialisation

dynamic.SetK(0.1);
dynamic.SetTISeconds(2.3);
dynamic.SetTDSeconds(4.5);

[...]

// Use

output := controller.Next(value, input);
```

## Contribution

Thanks for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section or, even better, is free to propose any changes to this repository using Merge Requests.

## License and Legal information

Please read the [Legal information](LICENSE.md)