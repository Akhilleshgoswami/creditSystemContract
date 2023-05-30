// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;
import "./interface/ICERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract CreditSystem is Ownable  {
    address  public immutable creditToken;
    error callerIsNotOwner(address ownerAddress, address callerAddress);
    error NotEnoughBalance(
        uint256 actualBalance,
        uint256 TransferRequestBalance
    );
    error NullAddress();
    error  ZeroAmount();



    modifier IsNullAddress(address account){
        if(account == address(0)) revert NullAddress();
        _;
    }
    modifier IsZeroAmount(uint256 amount){
        if(amount == 0) revert ZeroAmount();
        _;
    }

    event transferCredit(address from, address to, uint256 amount);

    constructor(address creditToken_) {
     creditToken = creditToken_;
    }


    function transferCredits(address to_, uint256 amount_) IsNullAddress (to_) IsZeroAmount(amount_) external {
        uint256 userBalance = balance(msg.sender);
        if (userBalance < amount_)
            revert NotEnoughBalance(userBalance, amount_);
        require(ICERC20(creditToken).transferFrom(msg.sender, to_, amount_));
        emit transferCredit(msg.sender, to_, amount_);
    }

    function balance(address account) public view returns (uint256) {
        return ICERC20(creditToken).balanceOf(account);
    }

function mint(address to_) external onlyOwner {
       ICERC20(creditToken).mint(to_, 1000*1e18);
    }

}
