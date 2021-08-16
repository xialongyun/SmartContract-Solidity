pragma solidity ^0.6.10;

contract Transfer {        
    
    address payable public owner;
    
    event Fallback(address, uint);
    event Received(address, uint);
    event Transfer(address _from, address _to, uint _amount);
    
    constructor() public payable{    
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
      require(msg.sender == owner, "Only owner could call this function !");
      _;
    }
    
    fallback() external payable { 
        emit Fallback(msg.sender, msg.value);
    }
    
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
    
    // transfer���˻�ת�� 
    function _transfer(address payable account) public payable onlyOwner() {
        account.transfer(msg.value);
        emit Transfer(msg.sender, account, msg.value);
    }
    
    // send���˻�ת�� 
    function _send(address payable account) public payable onlyOwner() {
        require(account.send(msg.value),"Transfer error !");
        emit Transfer(msg.sender, account, msg.value);
    }
    
    // ��ȡ�˻����
    function getBalanceOfAccount(address account) public view returns (uint256) {
        return account.balance;
    }
    
    // ��ȡ��ǰ��Լ�˻����
    function getBalanceOfContract() public view returns (uint256) {
        return address(this).balance;
    }
    
    // ��ȡ��ǰ�˻����
    function getBalance() public view returns (uint256) {
        address account = msg.sender;
        return account.balance;
    }
}