@echo off
setlocal EnableDelayedExpansion

:generatePassword
set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+="
set "password="
set /p length= "Enter the length of the password: "

set "seed=%time:~-2%"
for /L %%i in (1,1,%length%) do (
    set /a random=!random!+%seed%
    set /a index=random %% 74
    for /l %%j in (!index!,1,!index!) do set "char=!characters:~%%j,1!"
    set "password=!password!!char!"
)

echo Your generated password is: %password%
goto generatePassword
