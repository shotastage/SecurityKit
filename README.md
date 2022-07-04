# CoreSecurity

>> Now under construction...

Password strength checker for Swift.

## Password condition checker


To check password conditions, create `StrngPasswd` instance and call `validate` method with check conditions like following.

```swift
StrngPasswd(passwd: "PasswdChar").validate(conditions: [_CHECK_CONDITIONS_])
```


### Example

Check password string `@@Passwd123` with these conditions like below code.


- Uppercase alphabetic charactor must contain
- Lowercase alphabetic charactor must contain
- Symbol charactor must contain
- Minimum charactor count is 8


```swift
StrngPasswd(passwd: "@@Passwd123").validate(conditions: [
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
StrngPasswd(passwd: "qwerty").validate(conditions: [
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
