pragma solidity ^0.4.17;
//import '/home/something/Dev/Eth/node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol';
//^truffle version issue. huge waste of time
// ^this is an issue with some npm modules at a higher directoy i think
contract Up {

    //flag if eth is deposited and contract is used
    bool isUsed = false;
    //creator address
    address ownerAddress;

    uint256 endTime;

    //TODO deal with time conversion on front end
    //TODO limit on length
    //TODO check for overflows once openzeppelin can be imported
    function deposit(uint256 amount, uint256 length) payable public{
        require(msg.value == amount);

        ownerAddress = msg.sender;
        isUsed = true;
        endTime = now + length;
    }

    //TODO code to verify owner (save creator address)
    function withdraw() public{
        if (now > endTime) {
            ownerAddress.transfer(address(this).balance);
            //send back money
        }
    }
}
