-- ------------------------------
-- OPTION
-- ------------------------------

OPTION IMPORT;

-- ------------------------------
-- TRANSACTION
-- ------------------------------

BEGIN TRANSACTION;

-- ------------------------------
-- TABLE DATA: scripts
-- ------------------------------

UPDATE scripts:1 CONTENT { code: '
switch(user.score.step) {
  case 1:
    /** validation */


    /** modification */
    user.score.step = 2;
    user.score.state = "lift-off";

    /** action */
    user.resource_completed("module-1");
    user.add_resource("form-1");

    break;

  case 2:
    /** modification */
    // user.score = { step: 3, mood: 0 };
    user.score.step = 3;

    /** action */
    user.resource_completed("form-1");
    user.add_resource(["slides-1", "slides-2"]);

    break;

  default:
    console.error("Reached default case");
    break;
}', name: 'push' };

-- -- -- --

UPDATE scripts:2 CONTENT { code: '
switch(user.score.step) {
  case 3:
    /** validation */

    /** modification */
    user.score.step = 4;
    user.score.state =  "orbit";

    /** action */
    user.resource_completed(["slides-1", "slides-2"])

    break;

  case 4:
    /** validation */

    /** modification */
    user.score.step =  5;
    user.score.state = "landed";
    
    /** action */
    console.log("completed")

    break;

  case undefined:
    /** validation */

    /** modification */
    user.score.step = 1;
    user.score.state = "ignition";

    /** action */
    user.add_resource("module-1");

    break;

  default:
    console.error("Reached default case");
    break;
}', name: 'steps' };

-- ------------------------------
-- TRANSACTION
-- ------------------------------

COMMIT TRANSACTION;

