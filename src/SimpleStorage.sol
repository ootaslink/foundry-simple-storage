// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 public storedData;

    struct Person {
        uint256 myStoredData;
        string name;
    }

    Person[] public people;

    mapping(string => uint256) public nameToMyStoredData;

    function set(uint256 x) public {
        storedData = x;
    }

    function get() public view returns (uint256) {
        return storedData;
    }

    function addPerson(uint256 _myStoredData, string memory _name) public {
        people.push(Person(_myStoredData, _name));
        nameToMyStoredData[_name] = _myStoredData;
    }
}
