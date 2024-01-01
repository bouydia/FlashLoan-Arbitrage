// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "@aave/core-v3/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";
import "@aave/core-v3/contracts/dependencies/openzeppelin/contracts/IERC20.sol";

contract SimpleFlashLoan is FlashLoanSimpleReceiverBase{
    address payable owner ;

    constructor(address _addressProvider)
        FlashLoanSimpleReceiverBase(IPoolAddressesProvider(_addressProvider))
    {
    }
    
    function fn_RequestFlashLoan(address _token, uint256 _amount) public{
        address reciverAddress=address(this);
        address asset=_token;
        uint256 amount =_amount;
        bytes memory params="";
        uint16 referralCode=0;

        POOL.SimpleFlashLoan(
            reciverAddress,asset,amount,params,referralCode
        );
    }

    




}