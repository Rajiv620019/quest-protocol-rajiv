// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import '@openzeppelin/contracts/utils/Base64.sol';
import '@openzeppelin/contracts/utils/Strings.sol';

contract TicketRenderer {
    using Strings for uint256;

    function generateTokenURI(
        uint _tokenId
    ) public pure returns (string memory) {
        bytes memory dataURI = abi.encodePacked(
            '{',
            '"name": "RabbitHole Tickets #',
            _tokenId.toString(),
            '",',
            '"description": "A reward for completing quests within RabbitHole, with unk(no)wn utility",',
            '"image": "',
            generateSVG(_tokenId),
            '"',
            '}'
        );
        return string(abi.encodePacked('data:application/json;base64,', Base64.encode(dataURI)));
    }

    function generateSVG(uint _tokenId) public pure returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">',
            '<style>.base { fill: white; font-family: serif; font-size: 14px; }</style>',
            '<rect width="100%" height="100%" fill="black" />',
            '<text x="50%" y="40%" class="base" dominant-baseline="middle" text-anchor="middle">RabbitHole Tickets #',
            _tokenId.toString(),
            '</text>',
            '</svg>'
        );
        return string(abi.encodePacked('data:image/svg+xml;base64,', Base64.encode(svg)));
    }
}