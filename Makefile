#----------------------------------------------------------
#
#----------------------------------------------------------
# project name
PROJ  := demo
# build project args
# BARGS := --skip-test-unit
BARGS := -T
# work path
WPATH := $(shell pwd)/bin
# controller name
M := user
A := status
#
# attributes list
# L := name:string
# L += email:string
# L += password:string
L := content:string
L += user_id:integer
#
MS := home
MS += contact
# new branch
NB := new_branch
# front web
FW := bootstrap3
#
SARGS := $(M) $(L)
#-----------------------
# basic command
#-----------------------
# build new project
n:
	$(shell mkdir $(PROJ))
	$(shell cp -rf Makefile $(PROJ))
	rails new $(PROJ) $(BARGS)
# install gem on the project
b:
	$(WPATH)/bundle install
# set up server
s:
	$(WPATH)/rails s
# debug
console:
	$(WPATH)/rails console --sandbox
#-----------------------
# scaffold method
#-----------------------
sc:
	$(WPATH)/rails g scaffold $(SARGS)
#-----------------------
# generate model
#-----------------------
m:
	$(WPATH)/rails g model $(SARGS)
#-----------------------
# generate controller
#-----------------------
c:
	$(WPATH)/rails g controller $(M) $(MS)
#-----------------------
# generate layout devise
#-----------------------
ld:
	$(WPATH)/rails g layout:devise $(FW)
#-----------------------
# add attibut to model
#-----------------------
a:
	$(WPATH)/rails g migration add_$(A)_to_$(M)s
#-----------------------
# migrate database
#-----------------------
mi:
	$(WPATH)/rake db:migrate
#-----------------------
# roll back
#-----------------------
roll:
	$(WPATH)/rake db:rollback
# reset the database to clear out any users created at the console 
reset:
	$(WPATH)/rake db:reset
build:
	$(WPATH)/rake db:populate
#-----------------------
# list route methods
#-----------------------
route:
	$(WPATH)/rake routes
#-----------------------
# git command
#-----------------------
# git initial
gi:
	git init
	git add .
	git ci -m "Initial commit"
# make a new branch
gb:
	git co -b $(NB)
#-----------------------
# rspec command
#-----------------------
rs:
	$(WPATH)/rails g rspec:install
#-----------------------
# annotate command
#-----------------------
an:
	annotate
