//Defining ability scores

#define WEAPON_SKILL "Weapon Skill"
#define BALLISTIC_SKILL "Ballistic Skill"
#define STRENGTH "Strength"
#define TOUGHNESS "Toughness"
#define AGILITY "Agility"
#define INTELLIGENCE "Intelligence"
#define PERCEPTION "Perception"
#define WILLPOWER "Willpower"
#define FELLOWSHIP "Fellowship"

//Define background types
#define LOWLIFE "Low-Life"
#define CRIMINAL "Criminal"
#define POLICEMAN "Police Officer"
#define SOLDIER "Soldier"
#define SERVICEMAN "Service Employee"
#define JANITOR "Janitor"
#define BARTENDER "Bartender"
#define LABOURER "Labourer"
#define CLERK "Office Clerk"
#define SCIENTIST "Scientist"
#define SECURITY_GUARD "Security Guard"
#define MEDIC "Medic"
#define TEACHER "Teacher"

//Define Skills
#define AWARENESS "Awareness"
#define	CONCEALMENT "Concealment"
#define	DISGUISE "Disguise"
#define	DODGE "Dodge"
#define	LOGIC "Logic"
#define	SEARCH "Search"
#define	SILENT_MOVE "Silent Move"

//Define lists for fast access

GLOBAL_LIST_INIT(scores_modifier, list(
	LOWLIFE = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	CRIMINAL = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	POLICEMAN = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	SOLDIER = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	SERVICEMAN = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	JANITOR = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	BARTENDER = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	LABOURER = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	CLERK = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	SCIENTIST = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	SECURITY_GUARD = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	MEDIC = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20,
	),
	TEACHER = list(
		WEAPON_SKILL = 20,
		BALLISTIC_SKILL = 25,
		STRENGTH = 20,
		TOUGHNESS = 20,
		AGILITY = 20,
		INTELLIGENCE = 20,
		PERCEPTION = 20,
		WILLPOWER = 15,
		FELLOWSHIP = 20
	),
))

GLOBAL_LIST_INIT(basic_skills, list(
	AWARENESS,
	CONCEALMENT,
	DISGUISE,
	DODGE,
	LOGIC,
	SEARCH,
	SILENT_MOVE,
))

//Give the mob the skill capacity

/mob
	var/experience = 400
	var/background = POLICEMAN
	var/list/datum/ability_score/ability_scores = list()
	var/list/datum/skills/skills = list()
	var/list/feats = list()

//Characters ability scores for every mob
/datum/ability_score/
	var/name = "abilityscore"
	var/score = 0
	var/modifier = 0

/datum/ability_score/weapon_skill
	name = WEAPON_SKILL

/datum/ability_score/ballistic_skill
	name = BALLISTIC_SKILL

/datum/ability_score/strength
	name = STRENGTH

/datum/ability_score/toughness
	name = TOUGHNESS

/datum/ability_score/agility
	name = AGILITY

/datum/ability_score/intelligence
	name = INTELLIGENCE

/datum/ability_score/perception
	name = PERCEPTION

/datum/ability_score/willpower
	name = WILLPOWER

/datum/ability_score/fellowship
	name = FELLOWSHIP

//Skill Datum

/datum/skills
	var/name = "skill"
	var/tied_score = WEAPON_SKILL
	var/value = 0

/datum/skills/awareness
	name = AWARENESS
	tied_score = PERCEPTION

/datum/skills/concealment
	name = CONCEALMENT
	tied_score = AGILITY

/datum/skills/disguise
	name = DISGUISE
	tied_score = FELLOWSHIP

/datum/skills/dodge
	name = DODGE
	tied_score = AGILITY

/datum/skills/logic
	name = LOGIC
	tied_score = INTELLIGENCE

/datum/skills/search
	name = SEARCH
	tied_score = PERCEPTION

/datum/skills/silent_move
	name = SILENT_MOVE
	tied_score = AGILITY

//Initialize skills

/mob/proc/init_scores()
	for(var/thing as anything in init_subtypes(/datum/ability_score))
		var/datum/ability_score/S = thing
		S.init_roll(src.background)
		ability_scores[S.name] = S
	init_skills()

/mob/proc/init_skills()
	for(var/skill as anything in GLOB.basic_skills)
		for(var/datum/skills/skill_type as anything in init_subtypes(/datum/skills))
			if(skill_type.name != skill)
				continue
			var/datum/skills/S = skill_type
			S.value = round(src.ability_scores[S.tied_score].score/2)
			skills[S.name] = S


//Scores Rolls

/datum/ability_score/proc/init_roll(background)
	score = roll(2,10) + GLOB.scores_modifier[background][src.name]
	modifier = round(score/10)

//TODO: make experience system
