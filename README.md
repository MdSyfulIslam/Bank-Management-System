# 🏦 Bank Management System (Assembly Language - 8086)

A simulation of core banking operations (like account creation, deposit, withdrawal, and display) developed using **Assembly Language** on the **Emu8086 Emulator**. This project showcases how low-level programming can be applied to model real-world systems with efficiency and memory precision.

---

## 📋 Table of Contents

- [🔍 Project Overview](#-project-overview)
- [🎯 Features](#-features)
- [⚙️ Tools & Technologies](#️-tools--technologies)
- [🧠 Key Procedures](#-key-procedures)
- [📊 Performance & Testing](#-performance--testing)
- [📈 Future Improvements](#-future-improvements)
- [👨‍💻 Author](#-author)

---

## 🔍 Project Overview

This **Bank Management System** is built entirely in **8086 Assembly Language** and executed on the **Emu8086** emulator. It mimics the basic workflow of banking systems by allowing users to:

- Create new accounts  
- View account details  
- Deposit or withdraw money  
- Validate balance before withdrawals  

The project serves as a practical learning exercise for mastering low-level programming and memory handling.

---

## 🎯 Features

- ✅ Create new accounts
- ✅ Store and retrieve account details
- ✅ Deposit money to existing accounts
- ✅ Withdraw money with balance validation
- ✅ Navigate through a menu-driven interface
- ⚙️ Efficient memory management under Emu8086 constraints
- ⛓ Built with low-level BIOS interrupts (INT 21h)

---

## ⚙️ Tools & Technologies

- **Language:** 8086 Assembly (x86 architecture)
- **Emulator:** [Emu8086](https://emu8086-microprocessor-emulator.software.informer.com/)
- **Interrupts:** INT 21h for Input/Output handling
- **Platform:** Windows OS with Emu8086 installed

---

## 🧠 Key Procedures

Each major function of the system is implemented through well-defined assembly procedures:

| Functionality     | Description                                           |
|------------------|-------------------------------------------------------|
| `Main Procedure`  | Handles menu navigation                              |
| `Create Account`  | Captures and stores user account information         |
| `Show Account`    | Displays all saved account details                   |
| `Deposit Money`   | Adds entered amount to a user’s account balance      |
| `Withdraw Money`  | Subtracts amount with sufficient balance check       |

---

## 📊 Performance & Testing

The project was thoroughly tested on Emu8086, validating the following actions:

- ✔ Account creation: Captures and confirms user entry
- ✔ Deposit: Adds amount successfully and updates balance
- ✔ Withdrawal: Checks balance before processing; shows error if insufficient

**Average response time:** Instantaneous, suitable for learning/demo purposes.  
**Memory Usage:** Optimized for emulator constraints (~64KB environment)

---

## 🧪 Limitations

- ❌ No persistent storage (data lost on program exit)
- ❌ Single-user, single-session use only
- ❌ No graphical interface (text-based only)
- ❌ No error handling for invalid inputs
- ❌ Not scalable for real-world banking

---

## 📈 Future Improvements

- 💾 Add file handling or disk writing for **data persistence**
- 🔐 Integrate **PIN protection or password verification**
- 🧮 Add advanced banking operations like **interest** or **loan calculations**
- 💻 Build a **GUI wrapper** or migrate to a high-level language (C/Java)
- 👥 Enable **multi-user support** with user authentication

---

## 👨‍💻 Author

**Md Syful Islam**  
🎓 B.Sc. in CSE (Day), Green University of Bangladesh  
🧑‍🏫 **Course:** Microprocessors & Microcontrollers Lab (CSE 304)  
👨‍🏫 **Instructor:** Mr. Md Nazmus Shakib  
📚 Section: **222 D6**  
📅 Submitted on: **13 December 2024**

---

## 📎 References

1. [Cool Assembly Projects – Quora](https://www.quora.com/What-are-some-cool-assembly-language-projects-I-can-do)  
2. [Procedure and Macro in Assembly](https://mlgansari.wordpress.com/wp-content/uploads/2020/04/5-procedure-and-macro-in-assembly-language-program.pdf)  
3. [EMU8086 User Guide PDF](https://www.philadelphia.edu.jo/academics/qhamarsheh/uploads/emu8086.pdf)  
4. [Command Line in Emu8086 – StackOverflow](https://stackoverflow.com/questions/34375300/how-to-pass-command-line-parameters-to-emu8086)  


