//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.2;

contract todolist {
    uint public taskCount;

    struct task {
        uint id;
        string content;
        bool complete;
    }
    mapping(uint => task) public tasks;

    event taskCreated(uint id, string content, bool complete);
    event taskComplete(uint id, bool complete);

    constructor() {
        taskCount = 0;
    }

    function createTask(string memory _content) external {
        taskCount++;
        tasks[taskCount] = task(taskCount, _content, false);
        emit taskCreated(taskCount, _content, false);
    }

    function toggleComplete(uint _id) public {
        task memory _task = tasks[_id];
        _task.complete = true;
        tasks[_id] = _task;
        emit taskComplete(_id, _task.complete);
    }
}
