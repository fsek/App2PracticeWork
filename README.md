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

## Practice 
Let's get to the actual practices. 

### Ideas
Skapa ny route/sida

Lägg till knapp i menyn

### Number 1
Change the text of one of the buttons in the "other" ("övrigt" on the Swedish app version) tab of the app. 

### Number 2
Now it's time to make something of our own. Try to add a button in the "other" screen. Don't worry about making it 
do anything, that will be the next step :). Just make it appear where you want it with your chosen text. 

### Number 3
Let's make the button useful! Make it not break the app and take us to a new page.

### number 4
Let's do something that is a bit more confusing to find your way in. With patience and some logical thinking we 
should be able to figure it out though. Say we want to change the color at the bottom bar to something different. 

## Hints and solutions
Here are solutions/hints to the different practice problems. Try solving it 
with just the hint first, they try to guide you in a way that is similar to 
how you might go about if you were doing something on your own.

### Hints
1. 
   1. The search function (there are actually 3 different search functions in VS Code, here we reference the tab on 
the left-hand side with a magnifying glass) is quite useful when you try to change something you are unfamiliar with.
Try searching for the button you are trying to change the name of.
   2. Try finding the page where the buttons are made, i.e. the screen of that page. Can you see find any hints as 
      to how the text is decided?
2. Can you "borrow" the code of the other buttons and see if you can recreate what they do?
3. Again, take a look at the "foundations" of another page (all the pages are located under the "screens" folder). 
   See  if you can find the necessities and do the same. Much of learning how to make stuff of your own is to borrow 
   what someone else has done. No need to reinvent the wheel!
4.
    1. Searching for color gives us a lot of results, the file we are looking for is the "themes.dart" file. See 
       if you can find the color that changes the right one. Experiment!
    2. If you need help  picking a color you can use this: **0xff6495ED**. (Flutter uses hex color codes, but it
        needs to be prefixed with the opacity. 0xff sets it the maximum of 255.)


### Solutions

1. This one seems a little tricky at first, but if you happen to first go to the other.dart file you see a 
   bunch of categories with the applocalizations. These are used for giving the app different texts depending on "context", 
   in this case your app's language. If you then search for otherSongbook (just an example, works for other buttons 
   too) you will find two files containing that, one for Swedish and one for English, as well a value connected to 
   it. This is the text you want to change. 
2. All you really need to do for this one is to add the text you want in the the corresponding section. No need to 
   do it the "proper" way which is to use the translation files, unless you really want to. 
3. Looking at another screen, what we seem to need are a class that extends the statefulwidget. Easiest would just 
   be to copy this clas as well as the _XxPageState and then remove the stuff we don't want. The onlu function we 
   need inside the second class is the build function which just need to return a widget. That can be an empty 
   Scaffold for example. If we want to make the page more interesting we can add stuff to the scaffold, e.g. an 
   appbar, maybe a button etc. Only your imagination sets the limits!
4. This one is a matter of navigating and searching through the folders. A 
   good tip is to use the search function, you could try searching for color 
   for example and look at your results to narrow it down. What needs to be 
   done is to change line 13 of themes.dart. replace the part 'Colors.orange
   [700]' with Color(0xff6495ED) (or the color of your choosing). This one 
   can be confusing with the fact that there are colors on so many places 
   with different purposes, so the best way is to test and try the different 
   ones and see what happens - if everything breaks you can always CTRL + Z, or in worst case just clone this repo and 
   start over.