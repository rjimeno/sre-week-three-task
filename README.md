For week 3, the weekly challenge includes two tasks:

Task 1: Implement a "big red button" to prevent a deployment
from being restarted too many times.

The proposed solution is implemented as a script named watcher.sh.
The script is run in the background, deattached form a controlling
tarminal. When a deployment is attampted more than three times, the
deployment is scaled-down to zero.

Note: The file swype-deployment.yml was not reaching the ready state
due to its demanding configuration. To get it to we changed the values
of 'cpu' from 1 to 0.1 and memory from 4Gb to 1Gb.


Task 2:

Some simple solution includes integrating Prometheus with commertial
products like Jira, PagerDuty and Grafana IRM.