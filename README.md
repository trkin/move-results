# Move Results

Localized Opensource application for storing time results.
So it is for sports that involves moving and competing with a clock.
Supports:

* semifinals, finals race
* crew (like K4-500m)
* results per each check point (on 250m, on 500m)
* relay (like 2x12km or triatlon) is modeled with multiple checkpoint and
  multiple number of crew members

Model starts from activity (running, kayaking, hiking) and clubs can organize
events for specific discipline that belongs to an activity.
Visiting activity, user can find events for similar activities.

Since we need to know who created data we need to store audit trail.

User can create club and manage members, events for that club and upload
results. User can ask for administration of a club.
We assume that by default there is only one person with same name and age from
same city name.
Result data is csv for: descipline, crew, time, position
