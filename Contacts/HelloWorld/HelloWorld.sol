pragma solidity 0.4.25;

contract HelloWorld {
    string name;

    constructor() public {
        name = "Hello, World!";
    }

    function get() public view returns (string memory) {
        return name;
    }

    function set(string memory _name) public {
        name = _name;
    }
}