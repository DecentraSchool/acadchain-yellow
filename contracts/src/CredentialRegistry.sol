// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract CredentialRegistry is ERC721 {

    uint256 public tokenId;

    struct Credential {
        string studentName;
        uint256 gpa;
        string university;
        bool verified;
    }

    mapping(uint256 => Credential) public credentials;

    constructor() ERC721("AcadCredential", "ACRED") {}

    function issueCredential(
        address student,
        string memory name,
        uint256 gpa,
        string memory university
    ) public {

        tokenId++;

        _mint(student, tokenId);

        credentials[tokenId] = Credential(
            name,
            gpa,
            university,
            true
        );
    }
}