.model small 
.stack 1000h 
.data 
   
    heading db 10,13,  '           ---------------WELLCOME TO GREEN BANK LTD--------------- $'
        
    exitmsg db 10,13, 'SYSTEM CLOSED! $'
    
    createmsg db 10,13, 'CREATE NEW ACCOUNT $'

    detailmsg db 10,13,' ACCOUNT DETAILS $'

    withdrawmsg db 10,13, 'WITHDRAW $'

    DEPOSITMSG db 10,13, 'DEPOSIT $'  

    mainmsg0 db 10,13,'0. Exit$'                         
    mainmsg1 db 10,13,'1. Create New Account$'
    mainmsg2 db 10,13,'2. Show Account Details$'
    mainmsg3 db 10,13,'3. Withdraw Money$'
    mainmsg4 db 10,13,'4. Deposit Money$'   
    mainmsg5 db 10,13,'Press Enter to return to main menu $'

    detailmsg1 db 10,13, 'Account Name : $'
    detailmsg2 db 10, 13, 'Account City : $' 
    detailmsg3 db 10, 13, 'No Accounts Available!!$' 
    detailmsg4 db 10, 13, 'Total Money Left : $' 
    detailmsg5 db 10, 13, 'Account Balance is Zero $'
    detailmsg7 db 10, 13, 'Account Phone No. : $' 

    moneymsg1 db 10,13,'1.  Rs. 1000$'
    moneymsg2 db 10,13,'2.  Rs  2000$'
    moneymsg3 db 10,13,'3.  Rs. 5000$'
    moneymsg4 db 10,13,'4.  Rs. 10000$'
    moneymsg5 db 10,13,'Enter Code >> $'
    moneymsg6 db 10,13,'Your Account have not enough balance. Please Enter Less Amount. $'
    moneymsg7 db 10,13,'Money Withdrawn Successfully. $' 
    moneymsg8 db 10,13,'Money Deposited Successfully. $'

    inputmsg db 'Choose an option >>  $'
    inputCode db ? 

    accountName db 20 dup('$')
    accountPIN db 20 dup('$')
    accountPhone db 20 dup('$')
    accountCity db 20 dup('$')
    accountPINcount dw 0       ;This keeps track how many digit a pin is
    totalAmount dw 0
    inputAmountOption db ? 
   
    create1 db 10,13,'1. Enter Account Name : $'
    create2 db 10,13,'2. Enter Account Pin :  $'
    create5 db 10,13,'3. Enter Phone No. :  $'
    create6 db 10,13,'4. Enter Your City :  $'
    create3 db 10,13,'Account Created. $'
    create4 db 10,13,'Press Enter to Confirm. $' 

    pinMsg db 10,13,'Enter Pin >> $'
    blank db 10,13,'>>  $'   ;for input blinker
    blank2 db 10,13, '    $' ;For Newline
.code 
                                                                  
;                           UTILITY FUNCTIONS                        

insert proc   
   lea dx, accountName
   mov cx, 20
   mov ah, 40h
   int 21h ; write to file...
   lea dx, accountPin
   mov cx, 20
   mov ah, 40h
   int 21h ; write to file...
   lea dx, accountPhone
   mov cx, 20
   mov ah, 40h
   int 21h ; write to file...
   lea dx, accountCity
   mov cx, 20
   mov ah, 40h
   int 21h ; write to file...

macro printString str 
    lea dx, str
    mov ah, 09h
    mov dx, offset str 
    int 21h 
endm 

displayHeading proc near 
    printString heading
    printString blank2
    ret 
displayHeading endp

displayinputMenu proc near   
    printString mainmsg1
    printString mainmsg2
    printString mainmsg3
    printString mainmsg4 
    printString mainmsg0
    printString mainmsg5
    printString blank2    
    ret
displayinputMenu endp 

inputMenu proc near 
    printString inputmsg 
    printString blank
    mov ah, 1
    int 21h 
    mov inputCode, al 
    ret 
inputMenu endp 

displayBye proc near  
    printString exitmsg
    printString blank2
    ret 
displayBye endp

waiting proc near 
    mov cx, 0fh
    mov dx, 4240h
    mov ah, 86h
    int 15h
waiting endp

clearScreen proc near
    printString blank2
    ret    
clearScreen endp

;-------------------  CREATE NEW ACCOUNT

macro account_name str 
    mov si, offset str 
    input: 
        mov ah, 1
        int 21h 
        cmp al, 13 
        je create_pin
        mov [si], al 
        inc si 
        jmp input 
    exitMac:
        ret 
endm 

macro account_pin str 
    mov si, offset str 
    input2: 
        mov ah, 1
        int 21h
        cmp al, 13 
        je create_phone 
        inc accountPINcount 
        mov [si], al 
        inc si 
        jmp input2 
    exitMac2:
        ret 
endm 

macro account_phone str 
    mov si, offset str 
    input3: 
        mov ah, 1
        int 21h
        cmp al, 13 
        je create_city 
        mov [si], al 
        inc si 
        jmp input3 
    exitMac3:
        ret 
endm

macro account_city str 
    mov si, offset str 
    input4: 
        mov ah, 1
        int 21h
        cmp al, 13 
        je  account_created 
        mov [si], al 
        inc si 
        jmp input4 
    exitMac4:
        ret 
endm

proc etc
   etcin:
      mov ah,1
      int 21h
      cmp al,13
      je mainloop
      jmp etcin
   ret 
etc endp

create_account proc 
    call clearScreen 
    printString createmsg    
    printString blank2
    printString create1
    printString blank
    account_name accountName
        
    create_pin: 
        printString create2 
        printString blank 
        account_pin accountPIN
        
    create_phone: 
        printString create5 
        printString blank 
        account_phone accountPhone
    
    create_city: 
        printString create6 
        printString blank 
        account_city accountCity
    
    account_created: 
        printString create4
        printString create3
        call etc
    ret
create_account endp      

;--------------------------------  RETRIEVE ACCOUNT DETAILS
checkAccountCreated proc 
    cmp accountPINCount, 0 
    je accountNotCreated 
    ret 
    accountNotCreated:
        call clearScreen 
        printString detailmsg3 
        printString mainmsg5
        printString blank2
        call etc 
checkAccountCreated endp 

clearkeyboardbuffer	proc near
    clearin:
        mov ah, 1   ; peek
        int 16h
        jz  NoKey
        mov ah, 0   ; get
        int 16h    
        jmp clearin:
    NoKey:
        ret
clearkeyboardbuffer	 endp

getPinInput proc 
    call clearScreen 
    printString pinMsg
    printString blank 

    mov si, offset accountPIN
    mov cx, accountPINCount 

    getInput: 
        mov ah, 7
        int 21h 
        cmp al, [si] 
        mov dl, '*' 
        mov ah, 2
        int 21h 
        jne mainLoop 
        inc si 
    loop getInput 
    ret
getPinInput endp 

printNumber proc 
    mov cx, 0
    mov dx, 0 

    label1: 
        cmp ax, 0 
        je print1 
        mov bx, 10 
        div bx 
        push dx 
        inc cx 
        xor dx, dx 
        jmp label1 

    print1:
        cmp cx, 0 
        je exitprint 
        pop dx 
        add dx, 48 
        mov ah, 02h 
        int 21h 
        dec cx 
        jmp print1 

    exitprint:
        ret 
printNumber endp 

print_details proc 
    call checkAccountCreated
    call getPinInput
    call clearScreen

    printString detailmsg
    printString blank2 
    
    printString detailmsg1
    printString accountName 
    printString blank2 

    printString detailmsg7
    printString accountPhone
    printString blank2
    
    printString detailmsg2
    printString accountCity
    printString blank2

    printString detailmsg4
    mov ax, totalAmount 
    cmp ax, 0
    je noMoneyError 
    call printNumber 
    printString mainmsg5
    printString blank2
    call etc

    noMoneyError:
        printString blank2
        printString detailmsg5
        printString mainmsg5
        printString blank2 
        call etc 
    ret 
print_details endp

;-------------------- WITHDRAW MONEY

proc inputAmountCode 
    printString blank2
    printString moneymsg5 
    printString blank
    mov ah, 1 
    int 21h 
    mov inputAmountOption, al 
    ret 
inputAmountCode endp

withdraw proc 
    call checkAccountCreated 
    call getPinInput 
    call clearScreen 
    printString withdrawmsg
    printString blank2 
    printString moneymsg1
    printString moneymsg2
    printString moneymsg3
    printString moneymsg4

    call inputAmountCode 

    cmp inputAmountOption, '1' 
    je withdraw_1000 

    cmp inputAmountOption, '2' 
    je withdraw_2000

    cmp inputAmountOption, '3' 
    je withdraw_5000

    cmp inputAmountOption, '4' 
    je withdraw_10000

    withdraw_1000:
        mov bx, totalAmount 
        cmp bx, 1000 
        jl lessMoney
        sub totalAmount, 1000 
        printString moneymsg7
        printString blank2
        jmp mainLoop

    withdraw_2000:
        mov bx, totalAmount 
        cmp bx, 2000 
        jl lessMoney
        sub totalAmount, 2000 
        printString moneymsg7
        printString blank2
        jmp mainLoop

    withdraw_5000:
        mov bx, totalAmount 
        cmp bx, 5000 
        jl lessMoney
        sub totalAmount, 5000 
        printString moneymsg7
        printString blank2
        jmp mainLoop
    
    withdraw_10000:
        mov bx, totalAmount 
        cmp bx, 10000 
        jl lessMoney
        sub totalAmount, 10000 
        printString moneymsg7
        printString blank2
        jmp mainLoop

    lessMoney:
        printString blank2 
        printString moneymsg6
        printString mainmsg5
        printString blank2
        call etc 
    ret 
withdraw endp 

; --------------------DEPOSIT MONEY  

deposit proc 
    call checkAccountCreated 
    call getPinInput 
    call clearScreen 

    printString DEPOSITMSG;
    printString blank2 
    printString moneymsg1
    printString moneymsg2
    printString moneymsg3
    printString moneymsg4

    call inputAmountCode 

    cmp inputAmountOption, '1' 
    je deposit_1000 

    cmp inputAmountOption, '2' 
    je deposit_2000

    cmp inputAmountOption, '3' 
    je deposit_5000

    cmp inputAmountOption, '4' 
    je deposit_10000

    deposit_1000:
        add totalAmount, 1000 
        printString moneymsg8
        printString blank2
        jmp mainLoop 

    deposit_2000:
        add totalAmount, 2000 
        printString moneymsg8
        printString blank2
        jmp mainLoop 

    deposit_5000:
        add totalAmount, 5000 
        printString moneymsg8
        printString blank2
        jmp mainLoop 

    deposit_10000:
        add totalAmount, 10000 
        printString moneymsg8
        printString blank2
        jmp mainLoop 
        
    ret 
deposit endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
;                E N T R Y    P O I N T             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                  

Main proc 
    mov ax, @data 
    mov ds, ax 

    call clearScreen
   
    mainLoop:
        call clearkeyboardbuffer
        call clearScreen
        call displayHeading
        printString blank2
        call displayinputMenu
        call clearkeyboardbuffer
        printString blank2
        call inputMenu 
        
        cmp inputCode, '1'
        je create_account

        cmp inputCode, '2'
        je print_details

        cmp inputCode, '3'
        je withdraw 

        cmp inputCode, '4'
        je deposit  
        
        cmp inputCode, '0' 
        je exit 
    
        jmp mainLoop
    exit:
        printString blank2 
        call displayBye
        printString blank2
        mov ah,4ch
        int 21h
    main endp 
end main 