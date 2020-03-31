pragma solidity ^0.5.0;

import "./ERC20Detailed.sol";
import "../../ownership/Ownable.sol";
import "./ERC20Mintable.sol";
import "./ERC20Burnable.sol";
import "./ERC20Pausable.sol";

contract ERC20Kaleido is ERC20Mintable, ERC20Burnable, ERC20Pausable, ERC20Detailed, Ownable {
  constructor()
    Ownable()
    ERC20Detailed("Stable Currency", "SC", 0)
    ERC20Mintable()
    ERC20Burnable()
    ERC20Pausable()
    public {
    _mint(super.owner(), 1000 * 10**uint(super.decimals()));
  }
}
