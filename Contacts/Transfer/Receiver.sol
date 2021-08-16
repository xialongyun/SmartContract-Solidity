pragma solidity ^0.6.10;

contract Receiver {
    
    event Fallback(address, uint);
    event Received(address, uint);
    
    fallback() external payable { 
        emit Fallback(msg.sender, msg.value);
    }
    
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
    
    // ��ȡ��ǰ��Լ�˻����
    function getBalanceOfContract() public view returns (uint256) {
        return address(this).balance;
    }
}