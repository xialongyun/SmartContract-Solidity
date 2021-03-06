# view 和 pure

view和pure为对函数中状态变量的可操作性的修饰符，被view修饰的函数不会修改函数中的状态变量，被pure修饰的函数则更加严格，不能修改函数中的状态变量并且不允许状态变量被读取。

## view

view函数不会修改状态。如果函数中存在以下语句，则被视为修改状态，编译器将抛出警告。

- 修改状态变量。
- 触发事件。
- 创建合约。
- 使用`selfdestruct`。
- 发送以太。
- 调用任何不是视图函数或纯函数的函数
- 使用底层调用
- 使用包含某些操作码的内联程序集。

## pure

Pure(纯)函数**不读取**或修改状态。如果函数中存在以下语句，则被视为读取状态，编译器将抛出警告。

- 读取状态变量。
- 访问 `address(this).balance` 或 `<address>.balance`
- 访问任何区块、交易、msg等特殊变量(msg.sig 与 msg.data 允许读取)。
- 调用任何不是纯函数的函数。
- 使用包含特定操作码的内联程序集。

如果发生错误，纯函数可以使用`revert()`和`require()`函数来还原潜在的状态更改。

声明纯函数，可以在函数声明里，添加`pure`关键字。