DEMO: rexec

Usage: fill in the parameters and press execute.

Parameter fields
----------------------------------------------------------
Server:  Host Name or IP of server with an 
         RExec server running on port 512

UserName: The name of the user to login to the server

PassWord: Password for the user 
          CAUTION: This is sent  as plaintext

Command : The command to execute on the Server
          A series of commands can be used by seperating 
          them with a semicolon ;

Example Commands:
  ls -l
  DISPLAY=LOCALIP:0.0; xterm
  /usr/local/someApplication/startService
          