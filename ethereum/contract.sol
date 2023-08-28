// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract Record {
    mapping(string => uint) public recordArrMapp;
    struct RecordItem {
        string data;
        string company;
        string serialNo;
        address uploader;
    }
    RecordItem [] public recordArray;

    function getAllRecords() public view returns (RecordItem[] memory) {
        return recordArray;
    }

    function createRecord(string memory company, string memory serialNo, string memory data ) public {
        uint arrPosition = recordArray.length;
        recordArrMapp[string.concat(company, serialNo)] = arrPosition;

        RecordItem memory newRecordItem = RecordItem({
            data: data,
            company: company,
            serialNo: serialNo,
            uploader: msg.sender
        });

        recordArray.push(newRecordItem);
    }
}