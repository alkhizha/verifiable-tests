# Verifiable Code-Writing Tests for CS Students
This application attempts to apply formal methods (D. Gries style)
to specification and verification of code-writting tasks for CS students.

It is still under development, but you can already use it
for all the task examples we have and the other ones you come up with
(see task files in `/tasks` for example of a task structure).

### Steps You Need to Get it Runnging
 1. Install [Node.js](nodejs.org).
 2. Clone repository with
 
    `git clone https://github.com/harry-tallbelt/verifiable-tests.git`
    
    or just download and unzip it.
 3. Enter the repo directory:
    
    `cd verification-tests`
 
 4. Install dependencies:
    
    `npm install`
 
 5. Run it with
 
    `node server.js`
 
    and check out `localhost:3000` in your browser.

### Note for MacOS Users
You probably won't be able to start the server under MacOS.
The prover we use - Simplify - comes only as precompiled binaries
and apparently the Mac binary is compiled under older version of the OS,
which prevents it from running on recent MacOS versions.
