# Ruby Basketball Team Organiser

## R3. Provide full attribution to referenced sources (where applicable)
Nil

## R4. Provide a link to your source control repository
This is a link to my source control repository : [Feng-CA/Portfolio] ()

## R5. Develop a statement of purpose and scope for your application. It must include:
- describe at a high level what the application will do
- identify the problem it will solve and explain why you are developing it
- identify the target audience
- explain how a member of the target audience will use it

The purpose and scope of the terminal application
- This application can help the management of a basketball team to organise the team players in a training day. It enables the fairness and transparency of training activities.

- The target audience will be the member of management of the basketball team. He can simply run the application and choose one or more options to proceed and follow the instruction prompted. If he is not sure where to go then can find more information on help documentation.

## R6. Develop a list of features that will be included in the application. It must include:
- at least THREE features
- describe each feature

Note: Ensure that your features above allow you to demonstrate your understanding of the following language elements and concepts:
- use of variables and the concept of variable scope
- loops and conditional control structures
- error handling

Consult with your educator to check your features are sufficient.

- player substitution
On a perticalar day one or more players can not come to play so we will find a subsitution from outside associated player to come in. Firstly we need to remove the player who can not come from the team list and then add the substitution to the team list. Because on that day we need to evenly divide 15 players in 3 teams.
- randomize 3 teams and select 2 teams to play
On the day we need to randomly divide 15 players into 3 teams to play game. Each team should have 5 players. These feature will help use to achive this purpose and also we will decide the first and second selected team will start the game on the floor. The third team will be ratation on the bench.

- a coin flip game for which team wins the ball
we use the coin flip game to decide which team wins the ball. Firstly we get two representives respectively from the two teams who will play on the floor. They can only choose one side of the coin either heads or tails. Then the application will randomly choose heads or tails. If one player guess is same as the random result. His team will get the ball. The game can start now.

## R7. Develop an outline of the user interaction and experience for the application.
Your outline must include:
- how the user will find out how to interact with / use each feature
- how the user will interact with / use each feature
- how errors will be handled by the application and displayed to the user


## R8. Develop a diagram which describes the control flow of your application. Your diagram must:
- show the workflow/logic and/or integration of the features in your application for each feature.
- utilise a recognised format or set of conventions for a control flow diagram, such as UML.


## R9. Develop an implementation plan which:
- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

Utilise a suitable project management platform to track this implementation plan

> Your checklists for each feature should have at least 5 items.

## R10. Design help documentation which includes a set of instructions which accurately describe how to use and install the application.

You must include:
- steps to install the application
- any dependencies required by the application to operate
- any system/hardware requirements

### installation guide
- make sure Ruby version 3.0.2 installed on the computer
- on the terminal proceed to local repository where you store the applicaion source code
- run ./install-dependencies.sh to intall all required gems.
- installation completed

### dependencies requirement
- gem colorize
- gem tty-prompt
- gem rspec

### system/hardware requirement
- Windows 10
- hardware has not perticular requirement