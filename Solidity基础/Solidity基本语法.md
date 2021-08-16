# Solidity基本语法

## 类型

在用任何语言编写程序时，都需要使用变量来存储各种信息。变量是内存空间的名称，变量有不同类型，例如整型、字符串类型等等。操作系统根据变量的数据类型分配内存。

Solidity中，变量类型有以下几大类：

- 值类型
- 地址类型
- 引用类型

### 值类型

| 类型             | 保留字    | 取值                                                         |
| :--------------- | :-------- | :----------------------------------------------------------- |
| 布尔型           | `bool`    | true/false                                                   |
| 有符号整型       | `int`     | 有符号整数（int8 to int256）                                 |
| 无符号整型       | `uint`    | 无符号整数（uint8 to uint256）                               |
| 有符号定长浮点型 | `fixed`   | 有符号定长浮点型，关键字fixedMxN，其中M表示按类型取的位数，N表示小数点。M应该能被8整除，从8到256。N可以是0到80。 |
| 有符号定长浮点型 | `unfixed` | 无符号定长浮点型，关键字ufixedMxN，其中M表示按类型取的位数，N表示小数点。M应该能被8整除，从8到256。N可以是0到80。 |

### 地址类型

地址类型表示以太坊地址，长度为20字节。

地址类型也分为两种：`address` 和 `address payable` 。

`address` 转 `address payable` 是显式转换：`payable(address)`
`address payable` 转 `address` 是隐式转换。

address 类型具有下面属性

- `.balance (uint256)` // 获取地址余额
- `.code (bytes memory)` // code at the Address (can be empty)
- `.codehash (bytes32)` // the codehash of the Address
- `.transfer(uint256 amount)` // 向地址发送 ETH，转发 2300 gas
- `.send(uint256 amount) returns (bool)` // 向地址发送 ETH，转发 2300 gas。与上面的区别是，转账失败了这个函数不会抛出异常而是返回 false，推荐使用 transfer
- `.call(bytes memory) returns (bool, bytes memory)` // 调用合约，转发所有可用的 gas。跟 send 一样，失败不会抛异常，只会返回 false
- `.delegatecall(bytes memory) returns (bool, bytes memory)` // call 就相当于普通的 api 接口调用，delegatecall 则是借用目标合约的目标函数的代码，上下文（任何全局或局部变量）还是在本合约中，可以利用这个特性实现可升级合约。delegatecall 调用时，代理合约的 slot 位置完全对应 delegatecall 合约的 slot 位置，与变量名无关
- `.staticcall(bytes memory) returns (bool, bytes memory)` // 调用合约的只读函数

### 引用类型

Solidity中，有一些数据类型由值类型组合而成，相比于简单的值类型，这些类型通常通过名称引用，被称为引用类型。

引用类型包括：

- 数组 
- struct 
- mapping

#### 数组

数组分为静态数组和动态数组

动态数组在内存中的布局是：第一个 32 字节的内容表示动态数组的长度，后面才是动态数组的内容（类似于 golang 中的 slice 有一个长度的字段一样）

`memory` 生命周期的 array 只能是静态数组，通过 `new` 来初始化，而且必须指定大小，而且 push 函数不可用，不能自动扩容

`bytes` 是动态大小的字节数组，等于 `byte[]`。包括bytes1——bytes32。

`string` 动态大小的 UTF-8 编码字符串，可以隐式按照 utf8 编码转化为 `bytes`，也可以说是个特别的数组。

#### 结构体







函数可见性

函数访问限制符

变量存储类型