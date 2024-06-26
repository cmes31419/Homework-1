// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    uint256 public code = 12300;

    function register() external returns (uint256) {
        // TODO: please add your implementaiton here
        code /= 10;
        return code;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        if(IClassroomV2(msg.sender).isEnrolled())return 123;
        return 1230;
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        uint t = gasleft();
        if(t%2==1)return 1230;
        return 123;
    }
}
