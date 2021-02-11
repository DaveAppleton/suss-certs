// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract certs is ERC721, Ownable {

    address constant private custodean = 0x6518b78bFe8c3ad93FDE4B5ca300F15128273496;
    string []_tokenURIs = [
                        "QmXFBjks9LPgoydwtFiDAay4iTXbBPbxVe1att4uXcHcEj",
                        "QmVngxcGEmC7e8e1nhdMwnUbfeeEeQ5zoRgS5pMgYkA41j",
                        "QmSRfbvNRjJqdpjhy832TkdxV9ssjaNuwAeGdPizijTCrs",
                        "QmNvBLRUiwJqLUxY8i5KSrAnk6fgjGG5qqFsCV7HNZZAgY",
                        "Qma6n6EzgXK3qFnSFUGm28Qn2GVELvDYwub1zZwm2Kuyur",
                        "QmRFYFH6h6n6r3ExuiWsv6BYLngZW7HzJ4bdHem1SVJJVr",
                        "Qmf9jgZ3SCvqhJgWarLiFYWtTs5B8j7BBFRgyTWsRdFehJ",
                        "QmXdAMSX2MjxLkYqeVTD9are3Dxngg1LbSmZbJVVkbAP1t",
                        "QmefkQ3Br2hS2gTVv6hNQZtn8JyNVMPC8NX5Q7SBMWgx74",
                        "QmcAdRkw9Kmf6PdZ2dnPqk9y34FZ6NzNC2RY2ERY2WmQ7q",
                        "QmbbkeaRD4ArQdrCiuqEbJ7jqJcPobPsiS4sAjwE1FoXjT",
                        "QmWoSAWbTztEdMxUUTbpV9EE8N4Q21byViDMov6aBTawv2",
                        "QmdLNA9DsWdPWCtNHzu1pzmitDFJMemibqGrQvWcaFq7qJ",
                        "QmdEpKPpDTM52XrKL6Y1Haug4sJd9ppLDsAf6GTfu5Xi4i",
                        "QmS1oXJN6se3UDzSprqDV7Li9EHYVvN5PoJw9uuFfiebT6",
                        "QmZCubdm8QGWrUJFW53fMim3bn1eiCHHasUMd4yWxd4Ki3",
                        "QmYrNG2xQKZGF1c7YBY2jEgVa8AuTABFWAxSTEy1z1AsGr",
                        "QmaiSFoguHkUYgFNw8BT7FPE5AUKrwKjpXKjPsmCd15Aug",
                        "Qmc28bJecowsjcy53AanMaAg9fiS1zZQBUruEhBizAG615",
                        "QmSKxvHaTLiQhETzpajyprzPKFd3Nkc9oMig9HYZgHpNUg",
                        "QmZM6Hkbekh7w1i4Pij7Hs8A2zUEmENVPZ1Yfib8mdBTps",
                        "QmfRyQ1UYtJqu4ghKHc4FpppjFptQjaspNXXvjo6sgJSr9",
                        "QmVUTs1EGUGpaSQwYVz85fTbeLg9exTX3Vrv56rvuaDxTr",
                        "QmdX6x9ikaaDqGmr9xrtCW2G7Fde7xMof2YNicB6vYbKPi"
    ];

    constructor() ERC721("SUSS Skilltree Certificates","SSC") {
        _setBaseURI("https://cloudflare-ipfs.com/ipfs/");
        for (uint j = 0; j < _tokenURIs.length; j++) {
            _mint(custodean,j);
        }
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        require(tokenId < _tokenURIs.length, "ERC721Metadata: URI query for nonexistent token");
        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = baseURI();
        return string(abi.encodePacked(base, _tokenURI));
    }
    
    function mintMore(string[] memory certz) public onlyOwner {
        uint256 start = _tokenURIs.length;
        for (uint256 j = 0; j < certz.length; j++) {
            _mint(custodean,j+start);
            _tokenURIs.push(certz[j]);
        }
    }

    function mintMoreToOwners(address[] memory newOwners, string[] memory certz)  public onlyOwner {
        require(newOwners.length == certz.length,"two arrays different length");
        uint256 start = _tokenURIs.length;
        for (uint256 j = 0; j < certz.length; j++) {
            _mint(custodean,j+start);
            _tokenURIs.push(certz[j]);
        }
    }


}