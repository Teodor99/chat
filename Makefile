# leave these lines alone
.SUFFIXES: .erl .beam .yrl

.erl.beam:
	erlc -W $<
.yrl.erl:
	erlc -W $<

ERL = erl -boot start_clean 

# Here's a list of the erlang modules you want compiling
# If the modules don't fit onto one line add a \ character 
# to the end of the line and continue on the next line

# Edit the lines below
MODS = echo utils chat_server chat_client 

#       module3 ... special1 ...\
#       ...
#       moduleN

# The first target in any makefile is the default target.
# If you just type "make" then "make all" is assumed (because
#   "all" is the first target in this makefile)

all: compile

compile: ${MODS:%=%.beam}

#subdirs # at the end of the previous life
	
## special compilation requirements are added here

#special1.beam: special1.erl    
#	${ERL} -Dflag1 -W0 special1.erl

## run an application from the makefile

echo: compile
	${ERL} -noshell -pa . -s echo start Arg1 Arg2 

chat_server: compile
	${ERL} -pa . -sname serv -setcookie pass -s chat_server start

chat_client1: compile
	${ERL} -noshell -pa . -sname client1 -setcookie pass -s chat_client start_client1 
	
chat_client2: compile
	${ERL} -noshell -pa . -sname client2 -setcookie pass -s chat_client start_client2 

#	${ERL} -pa Dir1  -s application1 start Arg1 Arg2 

# the subdirs target compiles any code in 
# sub-directories

#subdirs:
#	cd dir1; $(MAKE)
#	cd dir2; $(MAKE)
#	...

# remove all the code

clean:	
	rm -rf *.beam erl_crash.dump
#	cd dir1; $(MAKE) clean
#	cd dir2; $(MAKE) clean  