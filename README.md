# Clone of F-App 2: Electric Boogaloo as of 2022-11-28
App for interacting with the fsektionen.se-api

## Setup
1. Clone the repo
2. `flutter pub get`
3. `flutter build apk`
4. run 'flutter pub run build_runner build'

## Background and setup 
The purpose of this repo is to serve as a more realistic and better mock-up 
of what the actual work you would or could be doing for the app compared to a "fake" one. 
Oftentimes practice work doesn't resemble the architecture of real and 
bigger projects. So the aim of these practices is to get you more familiar with flutter in general in more 
applicable scenarios as well as to get you more comfortable navigating and understanding the structure of the 
project  and its different files and folders. Feel free to use this as inspiration to experiment on your own too. 
This is more to help you to get started if it feels overwhelming (which it understandably might be). This is not 
intended to teach you flutter as a framework as there are other tutorials and documentation that are probably better 
and more detailed, but hopefully this makes those tools easier to use.  

Do note that this repository will most likely not resemble the up-to-date version, but that is not the point. This 
tutorial will suffice as a mock-up of the actual project until something 
major is changed, by then this has hopefully been updated to reflect that. 

First off make sure you have cloned the repository and then open the project (if you are using VS code you can just 
navigate to the folder in a terminal window and type "code ."). 

I am going to assume you have a working emulator and flutter version for this, so if that is not the case do that 
first (google does a good job of guiding you through this).  

## **Practice**
Let's get to the actual practices. 

### **Task 1**
Change the text of the Sångbok button in the "other" ("övrig" on the Swedish app version) section of the app to something different. 

### **Task 2**
Now it's time to make something of our own. Try to add a button in the "other" screen. Don't worry about making it 
do anything, that will be the next step :). Just make it appear where you want it with your chosen text. 

### **Task 3**
Let's make the button useful! Make it not break the app and take us to a new, empty page.

### **Task 4**
As of now, the page is empty and there is no way to return to our previous page. Add the bar at the top that gives us our return button (you will have to restart the app, either from the emulator or rerun the program, to be able to return to the normal app view).

### **Task 5** 
a) Okay, now we want to make the new page have some content. Add some text at the top of the screen that displays a number. 

b) Now add a button to the center of the screen with a size of 200x50 px. The button should add 1 to the number every time it is pressed. If you want you can use the TextButton for example. 
s
(This task requires quite a few more steps and a bit more work, there are multiple hints to help you so don't give up if it feels like too much to begin with! Google could (like it often is) be very useful for this task, as well as flutter docs.)

### **Task 6**
Now we will create a new page (or screen) called EpicUserPage, for showing some user data. This data is fetched from the backend using a GET request. Create a new button on the Other screen which links to a new empty page, just like in Task 3. On this new page, use the Text widget to display the name and email of the currently logged in user. 

### **Task 7**
Now we will add a button to EpicUserPage which will change the name of the user. Since this action aims to change data on the backend, a GET request won't do. In our case, we will send a PUT request to update the name. Add a TextButton which changes the users `firstname` to Poggus, and `lastname` to Champus.

### **Task 8**
Let's do something that is a bit more confusing to find where you are supposed to look. With patience and some logical thinking we 
should be able to figure it out though. Say we want to change the color at the bottom bar to something different, try doing that. (There are multiple hints for this so if you get stuck at any point don't be afraid to check there.)


# Hints and solutions
Here are solutions/hints to the different practice problems. Try solving it 
with just the hint first, they try to guide you in a way that is similar to 
how you might go about if you were doing something on your own.

## **Hints**
1. 
   a) The search function (there are actually 3 different search functions in VS Code, here we reference the tab on 
the left-hand side with a magnifying glass) is quite useful when you try to change something you are unfamiliar with.
Try searching for the button you are trying to change the name of.
   
   b) Try finding the page where the buttons are made, i.e. the screen of that page. Can you see find any hints as 
      to how the text is decided?
2. Can you "borrow" the code of the other buttons and see if you can recreate what they do?
3. Again, take a look at the "foundations" of another page (all the pages are located under the "screens" folder). 
   See if you can find the necessities and do the same. Much of learning how to make stuff of your own is to borrow 
   what someone else has done. No need to reinvent the wheel!
4. a) Look at the screen you took the scaffold from, can you see what gives that screen the top bar with the back button?
   
   b) It is just one line you need to add and it should be at the top of the scaffold. 
5. a) The first step here should be to try find out how we can make text appear on our screen. Can you find it in the docs or used in this project?

   b) Maybe the scaffold needs another attribute to make more widgets appear? Look at the scaffold docs for example. 

   c) We can use the same button we used before, but we need a way to have the scaffold contain multiple widgets in its body. Is there a widget that serves as a container for multiple other widgets? 

   d) Somehow we need to specify the size of our button, one way is to use the [SizedBox widget](https://api.flutter.dev/flutter/widgets/SizedBox-class.html).

   e) Is the text not updating on the screen when the button is pressed (and you have added the onPressed property to the button)? Google setState flutter! 
6. Use Ctrl + P (or Cmd + P) in VSCode to open settings.dart. Look in the `initState` method of `_SettingsPageState` for how to fetch a user from the backend and save it to a state variable in your widget.
7. In settings.dart we see how to update the user data. Look through the method `_saveOnClosePopup` in settings.dart. There, a TextButton has its `onPressed` argument set to the `_save` method. Check it out. 
8. a) Searching for color gives us a lot of results, the file we are looking for is the "themes.dart" file. See 
       if you can find the color that changes the right one. Experiment!
 
   b) If you need help  picking a color you can use this: **0xff6495ED**. (Flutter uses hex color codes, but it
        needs to be prefixed with the opacity. 0xff sets it the maximum of 255. (0x meaning the number is a hexadecimal number and ff is the hexadecimal of decimal 255.))


## **Solutions**

1. This one seems a little tricky at first, but if you happen to first go to the other.dart file you see a 
   bunch of categories with the applocalizations. These are used for giving the app different texts depending on "context", 
   in this case your app's language. If you then search for otherSongbook (just an example, works for other buttons 
   too) you will find two files containing that, one for Swedish and one for English, as well a value connected to 
   it. This is the text you want to change. To make the button still work we need to change the button's routemap key to what you changed the name to. So if you changed the Swedish version "Sångbok" in the routemap needs to be changed to what you changed in the translation file. 

2. All you really need to do for this one is to add the text you want the button to have in the the corresponding section. The sections are represented as list of names "categories", "about", "settings" and "support". The proper way, which for example the t.otherSongbook use it to create a new key value pair in the translation file you edited in the previous task. Then reference that with the Applocalizations variable (which is the `var t = AppLocalizations.of(context)!;`). But here we can just add it as hardcoded text to just see how we can change the buttons. 
3. Looking at another screen (inside the "screens" folder), what we seem to need are a class that extends the statefulwidget. Easiest would just 
   be to copy this class as well as the _XxPageState and then remove the stuff we don't want. The only function we 
   need inside the second class is the build function which just need to return a widget. That can be an empty 
   Scaffold for example. If we want to make the page more interesting we can add stuff to the scaffold, e.g. an 
   appbar, maybe a button etc. The build function returns what widget to create when the page is loaded. We also need to make sure the button sends us to this page, which we do by adding a key value pair to the RouteMap in the other.dart file. The value should be an object of the new page, similarily to how the other objects look. 

4. The line you are looking for is the appbar attribute/parameter, all you need to do is give that the value of an AppBar object. So inside the scaffold you need to add `appBar: AppBar()`. 
5. For this task there is a bit more things we need to do and understand. First of all, we need to add a body to our scaffold which is what the scaffold should actually contain. 

   a) For the first assignment we are interested in adding the text, which is as easy as just giving the body a `Text()` widget. If we want to center it we could do that by "wrapping" it with(putting the `Text` widget inside) a `Center` widget. We also need the text to contain something, which we can do by creating an integer, call it x, at the start of our class, before the build method. Then reference that variable in the widget like `Text("$x")`.

   b) Now we just need to add a button that interacts with this variable. One way of adding multiple widgets to our scaffold is to make the body of the scaffold a column, and then make the children all the widgets we want to appear, from top to bottom. The column is a widget that orders widget and puts them in a column underneath each other. We can wrap the column in a center widget instead of the text widget so everything becomes centered. After that we just need a `SizedBox` to determine the dimensions of the button and make the child a `TextButton`. The last tricky part is that we need to add the `setState` method in the `onPressed` parameter. This is because we need to update the screen (reload it kind of) everytime we change the variable so that it is portrayed correctly, since the build method is only called once we open the screen and then only when we tell it to re update. Inside the `setState` we just need to tell it to add one to our variable. 
   
   **Below is a suggestion for what the code could look like since this explanation got a bit long.**
   ```
   class _TestPageState extends State<TestPage>{
      int x = 0;
      Widget build(BuildContext context) {
         return Scaffold(
            appBar: AppBar(),
            body: Center(
               child: Column(children: [
                  Text("$x"),
                  Spacer(flex: 1),
                  SizedBox(
                     height: 50,
                     width: 200,
                     child: TextButton(
                        child: Text('Add one!'),
                        onPressed: () {
                           setState(() {
                              x += 1;
                           });
                        })),
                  Spacer(flex: 1)])));
      }
   }
   ```

   The spacers are optional so as just to make some room in the column between the widgets. [Here](https://api.flutter.dev/flutter/widgets/Spacer-class.html) you can read more on how they work if you want to try them out.
6. A quick Flutter recap: For a widget, there are three methods which are called at different times in its lifecycle. `initState`, `build`, and `dispose`.

   - To initialize, or set up, a widget, `initState` is called **once**, the first time a widget appears. 
   - To render, or display, a widget on screen, the `build` method is called. It is called **every** time the widget state is updated. For instance: When a counter variable is changed, as in Task 4, `build` is called because the new counter value must be rendered. `setState` tells the system that we wish to call `build` again because we changed the state.
   - `dispose` is called **once** at the very end of a widget's life.
   `initState` is where we will fetch user data. 
   First create the EpicUserPage widget with the basic Scaffold, AppBar and a button linking to it, as in Task 4. In EpicUserPage, declare a `user` state variable of type `User?`. Inside `initState`, call 
      ```
      locator<UserService>().getUser().then((userFromServer) {
         setState(() {
            user = userFromServer;
         });
      });
      ```
   VSCode should help you auto import `User` and `locator`. For `UserService` you might have to manually add this line to the top of the file containng EpicUserPage.
   ```
   import 'package:fsek_mobile/services/user.service.dart';
   ```  
   The `build` method should now return a `Scaffold` with its `appBar` argument set to an `AppBar` and `body` argument set to some container, use `Column` preferably. Inside this container, you can add Text like this
   ```
   Text(user?.email ?? '')
   ```
   This expression will be the empty string is `user` is `null`.
7. In EpicUserPage, below `build`, define your own method to change name. Below is an example. First we set names on the user object that lives on the phone. This is however not a permanent change unless we change the user data on the backend. Therefore we send the user object to the backend so it is saved to the database, using the `updateUser` method from `locator`.
   ```
   void _setName() {
      if(user == null) return;
      setState(() {
         user!.firstname = 'some'; 
         user!.lastname = 'name';
      });
      locator<UserService>().updateUser(user!).then((response) {
         //Request successful      
      }).catchError((err){
         //Request failed
      });
   }
   ```
8. This one is a matter of navigating and searching through the folders. A 
   good tip is to use the search function, you could try searching for color 
   for example and look at your results to narrow it down. What needs to be 
   done is to change line 13 of themes.dart. replace the part 'Colors.orange
   [700]' with Color(0xff6495ED) (or the color of your choosing). This one 
   can be confusing with the fact that there are colors on so many places 
   with different purposes, so the best way is to test and try the different 
   ones and see what happens - if everything breaks you can always CTRL + Z, or in worst case just clone this repo and 
   start over.
