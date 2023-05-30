pragma solidity ^ 0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract CreditToken is ERC20,Ownable{

constructor(string memory tokenName,string memory symbol) ERC20(tokenName,symbol){
    _mint(msg.sender,1000*1e18);
    }
function mint(address to_, uint256 amount_) external onlyOwner {
        _mint(to_, amount_);
    }
}