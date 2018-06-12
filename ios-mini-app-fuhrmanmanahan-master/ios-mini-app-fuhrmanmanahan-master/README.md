# ios-mini-app-fuhrmanmanahan
ios-mini-app-fuhrmanmanahan created by GitHub Classroom

Team member list:
- Benjamin Fuhrman (bdf7kt)
- Mark Manahan (mmm5ja)

Device Name: iPhone 8

Project/App Title: An iOS Bucket List Application

Basic instructions on usage:
This application serves as an electronic bucket list; user will be able to use this application as a bucket list to keep track of things they want to do before graduation.
On launch, the application will present a pre-populated bucket list of activities that have to be completed or are done, which are sorted from soonest to latest. The application sorts activities separately between incomplete and complete activities, with incomplete activities coming before complete ones, and among those activities, from soonest to latest.
From the main screen, a user can tap on an activity to bring up its details. Swiping an activity's cell from right to left will reveal buttons that will allow a user to edit that activity or mark it as completed. Tapping the edit button brings up the editing interface while tapping the done button marks the activity as completed, changing its cell's color and resorting it in the overall list.
Tapping on the "plus" icon in the upper right brings a user to the add interface. The add interface will have descriptor fields that can be filled in for an activity's name, longitude and latitude coordinates, and description; an activity's due date can be chosen from the date spinner. Tapping on the "save" button in the upper right will create the activity given what is in the descriptor fields and sort it among the incomplete items in the overall bucket list. Tapping on the "cancel" button in the upper left will terminate the interface and not add any activity to the overall bucket list.
Editing an item that is already on the list is similar to adding an item to the list in that the interface is identical except for the fact that the descriptor fields are filled in with the information of the activity to be edited. Tapping the "save" button in the upper right records the changes made to the activity, if any, and those changes are reflected in the overall bucket list. Tapping the "cancel" button in the upper left terminates the interface and does not make any changes to the activity that was prompted for edit.

Any special info we need to run the app: None.

Lessons learned (at least half a page):
We were able to reinforce our understanding of controllers, storyboards, and Swift class files through this IOS milestone project. Thankfully, a lot of knowledge of application functionality from the Android platform translated to the iOS platform. The new core lessons we learned were centered on developing on the iOS/Swift platform. We learned the semantics of Swift as a language, seeing as it as a branch of Objective C. Swift files themselves can be tailored to be a specific type of interface for the application, inheriting functionality from built-in types. Variables in Swift can be marked as “var” to mark that they can be mutable or with “let” to mark that they cannot be changed. A “this” instance in Swift is done by using “self.” Function headers are different in that return types are referenced at the end and they are marked with “func” in the beginning; calling a function requires listing out the parameters with their corresponding arguments. The storyboard in Swift is the .xml equivalent in the Android platform with a lot more visual cues. View Controllers effectively serve as Activity screens, with Navigation controllers managing movement to view controllers from other view controllers. Information is passed between view controllers through segues, which are named connections between controllers, which makes use of prepare() functions which prompts for a specific segue name and sends any necessary information.
