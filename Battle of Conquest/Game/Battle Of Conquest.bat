@echo off
REM DO NOT EDIT ANY CODE AS YOU MAY BREAK THE GAME WITH ANY CHANGES
REM If you want to make changes please make a copy of the original game
Title: Battle of Conquest vbeta 0.1.0
set localversion= vbeta 1.2.1
set localdev= Linux Services
color 0d
echo %date%

goto loading


:loading
echo loading...
pause
cls
echo THIS GAME DOES NOT SAVE DATA, ONCE THE WINDOW IS CLOSED ALL PROGRESS IS LOST FOR NOW!
pause

:menu

cls
echo %localdev%
echo Welcome to Battle Of Conquest!
echo %localVersion%
echo Choose the number:
echo 1. Start game
echo 2. Exit
set /p menu=
if '%menu%'=='1' (
goto sets
)
if '%menu%'=='2' (
exit
)else goto menu
:sets
cls
set /a money=1500
set /a health=200
set /a potions=0
set /a damage=20
set /a dd=15
set /a dh=25
set /a moneygain=100
set /a levels=5
set /a new=%dh%+5
set /a new=%dd%+2
:start
color 03
cls
echo %localdev%
echo Money:%money%
echo Health:%health%
echo Number of healing potions:%potions%
echo Number of mega healing potions:%mega%
echo Choose the number:
echo -----------------------------------------------------
echo                Welcome to Battle Of Conqest
echo -----------------------------------------------------
echo 1. Fight The Battle!
echo 2. Travel to the market!
echo 3. Adventure The Forest!
echo 4. Go Down a Random Path!
echo 5. Leave To Menu!
echo 6. Drink Healing Potion!
echo -----------------------------------------------------
set /p choose=
if '%choose%'=='1' (
cls
echo DO NOT HOLD THE ENTER KEY
pause
goto fight
)
if '%choose%'=='2' (
goto store
)
if '%choose%'=='3' (
goto sidequest
)
if '%choose%'=='4' (
goto random
)
if '%choose%'=='5' (
goto menu
)
if '%choose%'=='6' (
goto nextx
)else goto start

:random
setlocal EnableDelayedExpansion

set /a randomNum=%RANDOM% %% 5 + 1

if %randomNum%==1 (
cls
    echo You found a treasure chest!
    echo Inside was $10,000!
set /a money=%money%+10000
pause
goto start
cls
) else if %randomNum%==2 (
    echo A wandering merchant appears!
    echo He gives you 2 health potions
set /a potions=%potions%+2
pause
goto start
cls
) else if %randomNum%==3 (
    echo You encounter a friendly NPC!
    echo he waves at you!
pause
goto start
cls
) else if %randomNum%==4 (
    echo It starts raining heavily!
    echo you get wet!
    echo then slip and fall
    echo -5 health!
set /a health=%health%-5
pause
goto start
cls
) else (
    echo Unlucky you got robbed in the village of menimari
set /a money=%money%-1000
pause
goto start
cls
)

pause

:sidequest
color 03
echo Welcome to the Treasure Quest!
echo Your journey begins here.

pause
cls
echo.
echo You find yourself in a mysterious forest.
echo A magical voice speaks to you:
echo "To unveil the hidden treasure, you must solve the riddles."

pause
cls
rem Riddle 1
echo.
echo Riddle 1:
echo I speak without a mouth and hear without ears. I have no body, but I come alive with the wind. What am I?

set /p "answer1=Your answer: "
if /i "%answer1%"=="an echo" (
    echo Correct! Well done.
) else (
    echo Wrong answer. The forest seems to murmur disapprovingly.
pause
    goto :start
)

pause
cls
rem Riddle 2
echo.
echo Riddle 2:
echo The more you take, the more you leave behind. What am I?

set /p "answer2=Your answer: "
if /i "%answer2%"=="footsteps" (
    echo Correct! You're getting closer to the treasure.
) else (
    echo Wrong answer. The forest rustles in disappointment.
pause
    goto :start
)

pause
cls
rem Riddle 3
echo.
echo Riddle 3:
echo I fly without wings. I cry without eyes. Wherever I go, darkness follows me. What am I?

set /p "answer3=Your answer: "
if /i "%answer3%"=="cloud" (
    echo Correct! You've proven your wit.
) else (
    echo Wrong answer. The forest sighs in frustration.
pause
    goto :start
)

pause
cls
rem Congratulations
echo.
echo Congratulations! You've solved all the riddles.
echo The magical voice guides you to the treasure hidden deep within the forest.
set /a money=%money%+7500
echo you find $7,500
pause
goto start


rem End of the quest
:end_quest
echo.
echo Your quest comes to an end. Thank you for playing the Treasure Quest.
pause
goto

:fight
cls
color 04
echo %localdev%
echo =======================
echo Health:%health%      
echo Dragon's Health:%new%
echo =======================
echo You have encountered a dragon
echo Dragon: I AM THE EVIL DRAGON
echo Dragon: YOU ARE GONNA FEEL THE PAIN
echo       /\  /\
echo      ( o   o )
echo     (   "  "   )
echo     )         (
echo    (           )
echo    (             )
echo  (               )
echo (                 )
echo (                   )
echo (     (  )   (  )     )
echo(                       
echo(                       )
echo(                     )
echo (                   )
echo  (                 )
echo   (               )
echo    (_____________)                
pause
cls
echo Press enter to hit the dragon
set /p hit=
set /a new=%new%-%damage%
if %new% LSS 1 (
goto defeat
)
cls
echo Health:%health%
echo Dragon's Health:%new%
echo You have hit the dragon
echo The dragon lost %damage% health
pause
cls
echo The dragon has hit you!
set /a health=%health%-%dd%
if %health% LSS 1 (
goto defeated
)
pause
cls
goto fight
:defeat
cls
set /a dh=%dh%+20
set /a new=%dh%
set /a dd=%dd%+10
set /a new=%dd%
set /a money=%money%+500
set /a levels=%levels%+1
echo You defeated the dragon and earned $500.
echo Dragon: HOW CAN THIS BE!!!
pause
goto start
:defeated
cls
echo Sorry You died!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo RIP
echo You have killed %levels% dragon
pause
goto menu
:store
cls
echo %localdev%
echo Money:%money%
echo Welcome to the store!
echo ===============================
echo        In-Game Store
echo ===============================
echo 1. Buy +5 Attack Bonus!  $500
echo 2. Buy Health Potion!    $300
echo 3. Buy +10 Attack Bonus! $1,000
echo 4. Buy +20 Attack Bonus! $2,000
echo _______________________________
set /p again=
if %again%==1 (
goto buysword
)
if %again%==2 (
goto buyheal
)
if %again%==3 (
goto ten
)
if %again%==4 (
goto twenty
)
if %again%==5 (
goto mega
)
:twenty
cls
set /a money=%money%-2000
if %money% LSS 0 (
echo You cant buy that!
set /a money=%money%+2000
pause
goto start
)else (
set /a damage=%damage%+20
echo You Upgraded your sword with Extreme Skills!
pause
goto start
goto store
)
:ten
cls
set /a money=%money%-1000
if %money% LSS 0 (
echo You cant buy that!
set /a money=%money%+1000
pause
goto start
)else (
set /a damage=%damage%+10
echo You Upgraded your sword with Extreme Skills!
pause
goto store
)
:buysword
cls
set /a money=%money%-500
if %money% LSS 0 (
echo You cant buy that!
set /a money=%money%+500
pause
goto start
)else (
set /a damage=%damage%+5
echo You have upgraded your sword
pause
goto store
)
:mega
cls
set /a money=%money%-2000
if %money% LSS 0 (
echo You cant buy that!
set /a money=%money%+30
pause
goto store
)else (
set /a potions=%mega%+1
echo You have bought one mega heal potion
pause
goto start
)
:buyheal
cls
set /a money=%money%-300
if %money% LSS 0 (
echo You cant buy that!
set /a money=%money%+30
pause
goto store
)else (
set /a potions=%potions%+1
echo You have bought one heal potion
pause
goto start
)
:nextx
cls
if %potions%==0 (
echo Sorry. You dont have any potions.
pause
goto start
)else (
set /a health=%health%+50
set /a potions=%potions%-1
echo You have used one potion
pause
goto start
)