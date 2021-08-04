# Solidity编程规范

## 函数顺序

排序有助于识别哪些函数可以调用，并更容易地找到构造函数和 fallback 函数的定义。

函数应根据其可见性和顺序进行分组：

- 构造函数
- fallback 函数（如果存在）
- 外部函数
- 公共函数
- 内部函数和变量
- 私有函数和变量

在一个分组中，把 `view` 和 `pure` 函数放在最后。

对于长函数声明，建议每个参数独立成行，并与函数体保持相同缩进级别；闭括号和开括号也独立成行，并与函数声明保持相同缩进级别。

```solidity
function thisFunctionHasLotsOfArguments(
    address a,
    address b,
    address c
)
    public
{
    doSomething();
}
```

如果一个长函数声明有修饰符，那么每个修饰符应该下沉独立成行。

```solidity
function thisFunctionNameIsReallyLong(
    address x,
    address y,
    address z,
)
    public
    onlyowner
    priced
    returns (address)
{
    doSomething();
}
```

多行输出参数和返回值语句

```
function thisFunctionNameIsReallyLong(
    address a,
    address b,
    address c
)
    public
    returns (
        address someAddressName,
        uint256 LongArgument,
        uint256 Argument
    )
{
    doSomething()

    return (
        veryLongReturnArg1,
        veryLongReturnArg2,
        veryLongReturnArg3
    );
}
```