/**
  {
    "api":1,
    "name":"Generate Time Slice",
    "description":"Convert a date into a timeslice of that day.",
    "author":"Max Bucknell",
    "icon":"quote",
    "tags":"baseup,timeslice"
  }
**/

function main(state) {
    const timestamp = Date.parse(state.selection) / 1000
    const timeslice = {
        startTimestamp: timestamp,
        endTimestamp: timestamp + 86340,
        dailyStartTime: 0,
        dailyEndTime: 86340,
        restrictToDays: 'MTWTFSS'
    }

    state.insert(JSON.stringify(timeslice, null, 4))
}
