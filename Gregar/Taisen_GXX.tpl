@archive 8B438C
@size 50

script 7 mmbn6 {
	jump
		target = 32
}

script 29 mmbn6 {
	msgOpen
	mugshotshow
		mugshot = MegaMan
	"Entry canceled"
	keyWait
		any = false
	end
}
script 32 mmbn6 {
	msgOpen
	mugshotshow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"Enter ModCard ID\n  "
	option
		brackets = 1
		left = 3
		right = 1
		up = 0
		down = 0
	space
		count = 1
	menuOptionNumberTrader
		char = 0
	"0"
	option
		brackets = 1
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 1
	menuOptionNumberTrader
		char = 1
	"0"
	option
		brackets = 1
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 1
	menuOptionNumberTrader
		char = 2
	"0 "
	option
		brackets = 1
		left = 2
		right = 0
		up = 3
		down = 3
	space
		count = 1
	"""
	OK
	\
	"""
	menuSelectPassword
		password = 221
		jumpIfCorrect = 40
		jumpIfIncorrect = 40
		jumpIfCancelled = 29
	end
}

script 40 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	soundPlay
		track = 115
	"ModCard loaded:  \n"
	"                      \n"
	keyWait
		any = false
	playerFinish
	playerResetScene
	end

	clearMsg
	"                                                  "
	keyWait
		any = false
	end
	"Error (Bad ID)      \n          "
	end
	"Error (Low MB)      \n          "
	end
	"Error (Duplicate)   \n          "
	end
	keyWait	
		any = false
	end
	"            "
	end
	"""
	100% Status Effect
	chance from [B]い is
	banned.   
	"""
	end
	"               "
	end
	"""
	[B]い Invis must be
	overriden to be
	tourney-legal.
	"""
	end

}