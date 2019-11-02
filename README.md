# Simon-Says
##### By Ryan Byrnes

## Description
There are two games called Simon-Says. There is the game where someone is Simon and everyone else must do the actions they preface with the phrase, "Simon says." There is also the memory game where buttons light up in a sequence and you must press them in the same order until the sequence gets too long for you to replicate. This project is an attempt to combine those games into one. 

The display that the player would see will contain a few things. Firstly, at the top there would be a number indicating the current round the player is on, which represents their score. Below the score, the player will receive the instructions for the round, after the instructions are given, there will be a timer that denotes how long a player has to complete the round. Toward the lower half of the display, there will be four buttons, each with a different color. 

The instructions the player will be given for the round will either have *Simon Says* in them or they will not. An example of what a round could look like follows: 
- *Simon says* **click** blue
- **swipe** green
- *Simon says* **swipe** yellow
- *Steve* says **not** red
- *Simon Says* **swipe** green

As you can see, some instructions will contain *Simon says* while others will not. Decoys will be throw in as well(Ex. *Steve* says **not** red). These will require players to pay more attention. Other curve balls will be thrown in as well, such as the text for the colors not being the same as the color they are(Ex. the word blue having a yellow font).

The instructions will contain **commands** which are denoted by the bold face in the examples. The commands instruct the player on what to do. *Click* means the player has to click on the button. *Swipe* means the player must swipe the button with their finger if they are using a touch screen or to click and drag the mouse in on a webpage. The *not* command instructs the player to not interact with a color, meaning *Simon says* **not** red translates to clicking or swiping a color other than red. An interesting case is the instruction, **not** red, in which case, since Simon didn't say, the player should click red. This already sounds hard to remember and you aren't even worrying about a timer!

## Architecture
When the game starts an arrayList of a **command** class will be made called **commands**. Next, a do while loop will start. This loop will represent each round. At the start of the loop a new **command** will be created using a constructor that randomizes the information in that **command**, then it will be added to the arrayList. Next, the arrayList will be iterated through and the relevent information will be displayed for an undetermined amount of time, until all the commands in the list are done. Next, the player will have to click and swipe the correct buttons in the correct order. If the player makes a mistake the variable for the do while loop will be set to false and they will imediately leave the loop. When a game ends their score will show up and they will be prompted to play again.
