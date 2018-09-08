pragma solidity ^0.4.17;

contract Up {
    function hi() public view returns (uint256){
        //return "testing Up" + bytes32(now);
        return  now;
    }
}
