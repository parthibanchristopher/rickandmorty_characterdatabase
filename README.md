# rickandmorty_characterdatabase
<b>Rick &amp; Morty Character Database iOS App</b>
<br>
An app that shows the list of characters from the 'Rick & Morty' cartoon.
<hr>
<h3>Screenshots of The App</h3>
<img src="https://user-images.githubusercontent.com/91655657/193464041-712a17e0-c168-4054-97ee-73964138ffc4.png" height="50%" width="50%"/>
<b>Screenshot of the Home Screen. </b>
<br>
First two screenshots show the app successfully loading the character data into a scroll view as selectable buttons. The last screenshot shows what the app would look like if they are unable to/face issues in either receiving or loading the data.
<br>
<img src="https://user-images.githubusercontent.com/91655657/193464280-14d06476-f789-4b3d-a4ee-ddb6a9a5d9ae.png"  height="50%" width="50%"/>
<b>Screenshot of the Detail Screen.</b>
<br>
The first screenshot shows the data of the character who has little episode appearance. The last two screenshots shows the data of the character who has many episode appearance and how the scrollview allows the user to scroll through and view all the data.
<br>
<hr>
<h4>Short Commentary of Thought Process etc:</h4>
<ul>
<li>Took some time to break down the given task</li>
<li>Went to take a look at the API and see what are the data required to process</li>
<li>Decided to use MVVM architecture and set up the project accordingly</li>
<li>Decided to use NavigationView to display the characters</li>
<li>Worked on the UI for individual characters for the NavigationView to display dynamically</li>
<li>Worked on setting up the UI for Home Screen and the NavigationView to dynamically display the characterview</li>
<li>Worked on setting up the connection to the API, retrieving the data and parsing/decoding the data into character objects</li>
<li>Decided to not implement another API call for the Detail Screen, as I could reduce the network usage by just sending the selected object from the Home Screen over to the Detail Screen.</li>
<li>Decided to add some additional details like name for title bar and error screen if data was not loaded in the Home Screen. As long as data was loaded in the Home Screen, there will be data to send over to the Detail Screen.</li>
<li>Added unit tests and UI tests</li>
</ul>

<h4>A Small Note:</h4>
I would like to thank the team for being kind enough to give me an opportunity to try this take home exercise.
