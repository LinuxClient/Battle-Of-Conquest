@echo off
REM DO NOT EDIT ANY CODE AS YOU MAY BREAK THE GAME WITH ANY CHANGES
REM If you want to make changes please make a copy of the original game
Title: Battle of Conquest vbeta 1.0.1
set localversion= vbeta 1.0.1
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
set /a money=1000
set /a health=200
set /a potions=0
set /a damage=20
set /a dd=15
set /a dh=25
set /a moneygain=100
set /a levels=5
set /a new=%dh%+5
set /a new=%dd%+5
:start
color 03
cls
echo Money:%money%
echo Health:%health%
echo Number of healing potions:%potions%
echo Choose the number:
echo -----------------------------------------------------
echo                Welcome to Battle Of Conqest
echo -----------------------------------------------------
echo 1. Fight The Battle!
echo 2. Travel to the market!
echo 3. Go to Title Screen!
echo 4. Drink Potion Of Healing!
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
goto menu
)
if '%choose%'=='4' (
goto nextx
)else goto start


:fight
cls
color 04
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
echo Money:%money%
echo Welcome to the store!
echo ========================
echo        In-Game Store
echo ========================
echo 1. Buy Sword
echo 2. Buy Health Potion
echo 3. Exit
set /p again=
if %again%==1 (
goto buysword
)
if %again%==2 (
goto buyheal
)
if %again%==3 (
goto start
)else goto store
:buysword
cls
set /a money=%money%-700
if %money% LSS 0 (
echo You cant buy that!
set /a money=%money%+700
pause
goto start
)else (
set /a damage=%damage%+4
echo You have upgraded your sword
pause
goto store
)
:buyheal
cls
set /a money=%money%-500
if %money% LSS 0 (
echo You cant buy that!
set /a money=%money%+500
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