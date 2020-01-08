pragma solidity ^0.5.0;

contract StrackerTask {
    enum State {
        created,
        inProgress,
        suspended,
        completed
    }

    struct WorkLog {
        string[4] IDs;
        string taskTitle;
        string date;
        int state;
        int workedTime;
        string actionDescription;
        string externalSource;
    }

    struct Task {
        int state;
        string taskTitle;
        string taskDescription;
        string userID;
        string createDate;
        string completeDate;
        string externalSource;
    }
    
        
    mapping(string => WorkLog) public workLogs;
    mapping(string  => Task) public tasks; //tasks to project

    
    function CreateTask(string memory taskID, int state, string memory taskTitle, string memory taskDescription, string memory userID, string memory createDate, string memory completeDate, string memory externalSource) public returns (bool success)
    {
        Task memory task = Task(state, taskDescription, taskTitle, userID, createDate, completeDate, externalSource);
        tasks[taskID] = task;
        
        return true;
    }
    
    function CreateWorklog(string memory projectID, string memory taskID,  string memory worklogID, string memory userID, string memory date, int state, int workedTime, string memory actionDescription) public returns (bool success)
    {
        if (tasks[taskID].state == int(State.completed)) return false;


        if (state == int(State.created)) {
            tasks[taskID].createDate = date;
        }
        
        if (state == int(State.completed)) {
            tasks[taskID].completeDate = date;
        }
        

        tasks[taskID].userID = userID;
        tasks[taskID].state = state;
        
        string[4] memory IDs = [projectID, taskID, worklogID, userID];
        
        WorkLog memory workLog = WorkLog(IDs, tasks[taskID].taskTitle, date, state, workedTime, actionDescription, tasks[taskID].externalSource);
        workLogs[worklogID] = workLog;

        return true;
    }
}
