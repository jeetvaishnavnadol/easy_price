<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Hey coders this is currency converter

## Features

long or largest numerical amount will be human readable value.

## Getting started

List prerequisites and provide or point to information on how to
start using the package.

## Usage

`Easy Price` is a simple package that can be used to show price in human readable

```dart
EasyPrice(
    price: 1750000,
    currencyType: 'inr',
    precision: 1,

)
```

## for additional styling of currency symbol & Easy Price

```dart
EasyPrice(
    price: 1750000,
    currencyType: 'inr',
    precision: 1,
    currencyStyle:TextStyle(color:Colors.red),
    textStyle:TextStyle(color:Colors.blue),
)
```

## Installation

```yaml
dependencies:
easy_price: ^0.0.5;
```

##Example

![Currency](https://github.com/jeetvaishnavnadol/easy_price/blob/main/images/currency.png)
