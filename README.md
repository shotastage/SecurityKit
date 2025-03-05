# SecurityKit

![Swift Version](https://img.shields.io/badge/Swift_6-Compatible-green)
![GitHub License](https://img.shields.io/github/license/shotastage/SecurityKit?style=flat)

>> Now under construction...

Security utilities pack for both iOS and server-side.

## Password condition checker


To check password conditions, create `CSPasswordUtils` instance and call `validate` method with check conditions like following.

```swift
CSPasswordUtils(passwd: "PasswdChar").validate(conditions: [_CHECK_CONDITIONS_])
```


### Example

Check password string `@@Passwd123` with these conditions like below code.


- Uppercase alphabetic charactor must contain
- Lowercase alphabetic charactor must contain
- Symbol charactor must contain
- Minimum charactor count is 8


```swift
CSPasswordUtils(passwd: "@@Passwd123").validate(conditions: [
  .containNumericCharactors,
  .containUppercaseAlphabet,
  .containLowercaseAlphabet,
  .containNumericMinimum(8)
])
```


this code will return empty array as expectation.

```swift
Result: Array<InvalidCondition> -> [ ]
```



And then, very weak password string `qwerty` with same conditions.

```swift
CSPasswordUtils(passwd: "qwerty").validate(conditions: [
  .containNumericCharactors,
  .containUppercaseAlphabet,
  .containLowercaseAlphabet,
  .containNumericMinimum(8)
])
```


this code will return this result.

```swift
Result: Array<InvalidCondition> -> [
    .numericCharactorNotContained,
    .uppercaseNotContained,
    .notEnoughCharacters
]
```
