// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract ManualToken {
    mapping(address => uint) private s_balances;

    function name() public view returns (string memory) {
        return "ManualToken";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return s_balances[_owner];
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_to != address(0), "ERC20: transfer to the zero address");
        require(
            s_balances[msg.sender] >= _value,
            "ERC20: transfer amount exceeds balance"
        );

        // Deduct from sender
        s_balances[msg.sender] -= _value;

        // Add to recipient
        s_balances[_to] += _value;

        return true;
    }
}
