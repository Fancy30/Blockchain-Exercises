//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IERC20{
    
    function transfer(address, uint) external returns (bool);

    function transferFrom(
        address,
        address,
        uint
    ) external returns (bool);
}
/*Create a struct named Campaign that has the following:
creator, goal, pledged, startAt, endAt, and claimed which is a bool.
*/
contract anu{
event Launch (uint id, address indexed creator, uint goal, uint startAt, uint endAt);
event Pledge(uint indexed id, address indexed caller, uint amount);
    event Unpledge(uint indexed id, address indexed caller, uint amount);
    event Claim(uint id);
    event Refund(uint id, address indexed caller, uint amount);

    struct Campaign{
        // Creator of campaign
        address creator;
        // Ckrowd funding, what we are raising is in digit
        uint goal;
        // Total amount pledged
        uint pledged;
        // Timestamp of start of campaign
        uint32 startAt;
        // Timestamp of end of campaign
        uint32 endAt;
        // True if goal was reached and creator has claimed the tokens.
        bool claimed;
    }

    IERC20 public immutable token;
    // Total count of campaigns created.
    // It is also used to generate id for new campaigns.
    uint public count;
    // Mapping from id to Campaign
    mapping(uint => Campaign) public campaigns;
    // Mapping from campaign id => pledger's address => amount pledged
    mapping(uint => mapping(address => uint)) public pledgedAmount;

    constructor (address _token) {
        token = IERC20(_token);
    }

    function launch(uint _goal, uint32 _startAt, uint32 _endAt) external {
        require(_startAt >= block.timestamp, "start at < now");
        require(_endAt >= _startAt, "end at < start at");
        require(_endAt <= block.timestamp + 90 days, "end at > max duration");

    //Create a struct input that contains the following: msg.sender,_goal 0, _startAt,_endAtfalse
  count +=1;
    campaigns[count] = Campaign(msg.sender, _goal, 0, _startAt, _endAt, false);
/*creator: msg.sender,goal: _goal,pledged: 0,startAt: _startAt,endAt: _endAt,claimed: false});
Note: there can be more than 1 campaign and each campaign would have its separe id*/

    emit Launch(count, msg.sender, _goal, _startAt, _endAt);
}
    function cancel(uint _id) view external{
        Campaign memory campaign = campaigns[_id];
        require(campaign.creator == msg.sender, "not creator");
        require(block.timestamp < campaign.startAt, "started"); 
}
 function pledge(uint _id, uint _amount) external {
     //Memory is not used here but storage cos it is an action that updates the struct
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp >= campaign.startAt, "campaign has not started");
        require(block.timestamp <= campaign.endAt, "campaign has ended");
/* Line 76 is like Total supply/ the total money in circulation.When each pledge is 
made the mapping amount increase to the total of the whole money pledge. Just like IERC20, 
it increase the total supply then after increasing the total supply the AMOUNT ADDED BY EACH Pledgee  */
        campaign.pledged += _amount;
/* Line 82 is adding the amount pledged by each pledgee so there is ability to track the pledge by each pledgee
and it shoes the address and id of the pledgee. It has well in turn affects the total money pledge since
each amount pledged is what amount to the total amount. It is as well adding the new amount pledge by a
particular address to the id of the campaign */
        pledgedAmount[_id][msg.sender] += _amount;
       
/*Token is from the IERC20 contract. .transferfrom is the person transfering/pledging. 
This code removes the token from the person sending and transfers to the address it wants to send to and 
the amount stated is the amount he wants to pledge. If the code line is not present, it will show that the 
person pledged but the amount to be deducted wount be deducted from the person's account.
address(this) is the instance of the contract, the money is going into the
 ckrowd funding address and not the address of the campaign creator. */
        token.transferFrom(msg.sender, address(this), _amount);

/* We then *emit* the event pledge we already created before. 
The caller(in the event pedge) is the person pledging. */
        emit Pledge(_id, msg.sender, _amount);
 }
 // id of the campaign you was to unpledge and the amount
        function unpledge(uint _id, uint _amount) external {
        //Allows us to have access to the struct campaign. We did not use memory here cos what we are doing will update the status of that particular struct
        Campaign storage campaign = campaigns[_id];
        //this indicates the *now time is lesser or equal to the end time, if it is greater that means campaign as ended
        require(block.timestamp <= campaign.endAt, "ended");
/* The variable/event we want to intereact with in the struct is pledged. This is because the unpleaded
 is resulting from the amount initially pledge. I f you did not pledge you cannot unpledge */
        campaign.pledged -= _amount;
       // the address of the person requesting to unpledge and the amount and the  as well the id
        pledgedAmount[_id][msg.sender] -= _amount;
/*the amout to be returned is been transferred/sent from the pledged amount in the ckrowd fund address
 which is the instance of the contract. Then we have the addres and amout to be sent */
        token.transfer(msg.sender, _amount);

        emit Unpledge(_id, msg.sender, _amount);
    }
    function claim(uint _id) external {
        Campaign storage campaign = campaigns[_id];
        //it is requiring that only the creator can claim
        require(campaign.creator == msg.sender, "not creator/owner");
        //requires that you can only claim at the end of the campaign
        require(block.timestamp > campaign.endAt, "not ended");
       /* requires that the pledged amount must be equal to or greater than the goal,  if not then creator 
       cannot claim hence there would have to be a refund. Here we we did else state that pledge is less than goal */
        require(campaign.pledged >= campaign.goal, "pledged < goal");
        /*require that you have not collected it before; that campaign has not been claimed by the claimer before. 
        This restricts you from claiming frpm multiple campaigns. So if it has,
         it will return campain already claimed or claimed. Note, exclamation means NOT*/
        require(!campaign.claimed, "claimed");
        //Since all the above conditions av been met, then we put the status of claiming the campaign to true
        campaign.claimed = true;
        /*Since all conditions are met, we are now transferring to the creator and the amount we are transferring
        is the total amount pledged in the campaign. Here the creator can only get the amount pledged and nothing more */
        token.transfer(campaign.creator, campaign.pledged);
    //we emit the id of the campaign
        emit Claim(_id);
    }
/* The person that calls function refund is a/the pledgee, also amount is not here cos it is assumend that
 it is the total money you paid that would be refunded */
    function refund(uint _id) external {
        /* memory is used here because after this time we will no longer keep the record of the person again, 
        hence we do not need to use storage */
        Campaign memory campaign = campaigns[_id];
        
    require(block.timestamp > campaign.endAt, " campaign has not ended");
  /*we are refunding and not claiming because the goal was not met,
    so if pledged amount is equal or greater than goal we cant refund., HENCE IT WILL RETURN PLEDGE IS GREATER OR Equal to goal */
        require(campaign.pledged < campaign.goal, "pledged >= goal");
/* Here we tracked how much you av that you want to requst for as refund by calling the pledged amount
 using the pledgee's address(msg.sender) and the id. Then we saved it in a variable balance.  */
        uint bal = pledgedAmount[_id][msg.sender];
/* Here now nullifies all you have (the line 84) to zero*/
        pledgedAmount[_id][msg.sender] = 0;
/*sends the amount pledged to the pledger (who is the person calling the function)  */
        token.transfer(msg.sender, bal);
/*  here we emit the event refund, not msg.sender is the address of the caller. The caller is the pledgee asking for refund*/
        emit Refund(_id, msg.sender, bal);
    }
}

