# SRD 5.2.1 Combat (LLM Optimized)

Source: `SRD_CC_v5.2.1.pdf`  
Scope: Combat section and listed combat subsections (excludes Damage and Healing).

## Agent Usage
- Use this as the primary rule flow for running tactical turns.
- Resolve in this order: turn structure -> movement/position -> attack resolution -> special cases.
- If a needed term is undefined here, check SRD 5.2.1 Rules Glossary.

## Combat Loop
- Combat is organized into rounds; each round is about 6 seconds.
- Each participant gets one turn per round in Initiative order.
- Combat continues round by round until one side is defeated, surrenders, flees, or both sides stop.

## Combat Setup (Step by Step)
1. Establish positions.
2. Roll Initiative.
3. Take turns in Initiative order.
4. Repeat turns each round until combat ends.

## Initiative
- Each participant makes a Dexterity check for Initiative.
- GM can roll once for a group of identical creatures.
- Surprised creatures have Disadvantage on Initiative.
- Initiative order stays the same across rounds.
- Tie handling:
  - Players decide ties among player characters.
  - GM decides ties among monsters.
  - GM decides player-vs-monster ties.

## Your Turn
- On your turn, you can:
  - Move up to your Speed.
  - Take one action.
- You choose move-first or action-first.
- You can communicate briefly (short utterances/gestures) without spending move/action.
- Extended communication usually requires an action (typically Influence).

## Object Interaction on Turn
- One free object/environment interaction during move or action.
- A second interaction requires the Utilize action.
- Some items always require an action as stated in their descriptions.

## If You Do Nothing
- You may choose not to move or act.
- If unsure, common defaults are Dodge or Ready.

## Movement and Position
- Move up to Speed or do not move.
- Movement can include climbing, crawling, jumping, and swimming.
- Deduct distance as you move until Speed is spent.
- You can split movement before/after actions, bonus actions, and reactions on your turn.

## Difficult Terrain
- Each foot moved in difficult terrain costs 1 extra foot.
- If multiple effects make terrain difficult, each applies as written.

## Dropping Prone
- You can drop prone on your turn without spending action or Speed.
- You cannot do this if your Speed is 0.

## Creature Size and Space
- Size determines map space/control area in combat.
- Standard mapping:
  - Tiny: 2.5 ft space (4 per square)
  - Small/Medium: 5 ft (1 square)
  - Large: 10 ft (2x2)
  - Huge: 15 ft (3x3)
  - Gargantuan: 20 ft (4x4)

## Moving Through Other Creatures
- You can move through:
  - Ally space
  - Incapacitated creature space
  - Tiny creature space
  - A creature two sizes larger/smaller than you
- Another creature's space is difficult terrain for you unless it is Tiny or your ally.
- You cannot willingly end movement in another creature's space.

## Attack Resolution (Making an Attack)
1. Choose target (creature, object, or location) within range.
2. Determine modifiers:
  - Cover
  - Advantage/Disadvantage
  - Other effects/bonuses/penalties
3. Resolve attack roll.
4. On hit, apply damage or other effects.

## Unseen Attackers and Targets
- If you attack a target you cannot see, you have Disadvantage.
- If a creature cannot see you, you have Advantage on attacks against it.
- If hidden, you reveal your location when your attack hits or misses.

## Cover
- Cover grants defensive benefit depending on degree.
- Typical degrees: Half Cover, Three-Quarters Cover, Total Cover.
- If multiple cover sources apply, use the strongest applicable degree.
- A target with Total Cover cannot be directly targeted by an attack/spell that requires a clear target.

## Ranged Attacks
- You can make ranged attacks at targets within range.
- At long range, ranged attacks are made with Disadvantage.
- You cannot attack beyond maximum range.

## Ranged Attacks in Close Combat
- Making a ranged attack while an enemy is adjacent can impose Disadvantage (per SRD conditions/rules context).

## Melee Attacks
- Melee attacks generally target creatures within your reach.
- Unarmed strikes and melee weapon attacks follow standard attack resolution.

## Opportunity Attacks
- Trigger: a creature you can see leaves your reach.
- Reaction: make one melee attack against the provoking creature.
- Avoiding trigger commonly includes:
  - Disengage action
  - Forced movement that does not use the target's movement/action/reaction
  - Teleportation

## Two-Weapon Fighting
- When using qualifying light melee weapons, off-hand attack is available as a Bonus Action (per SRD details).
- Off-hand damage usually omits ability modifier unless a rule says otherwise.

## Grappling
- Usually initiated as part of an Unarmed Strike/Attack option.
- On success, target gains Grappled condition.
- Escaping a grapple uses the target's action/check as defined in SRD.

## Shoving a Creature
- Replace an attack with a shove attempt.
- On success, target is pushed or knocked prone (per SRD constraints).

## Mounted Combat
- Controlled mount acts on rider's turn and follows rider direction within mount rules.
- Mounting/dismounting has movement costs and edge-case rules.
- Forced movement/knockdown can cause falls from mount.

## Underwater Combat
- Underwater combat modifies attacks and movement depending on weapon/creature capabilities.
- Fire damage interactions are modified underwater (see SRD combat + Damage and Healing references).

## End of Combat
- End when one side is neutralized, routed, surrendered, or both sides stop fighting.
- Transition back to exploration/social procedures as appropriate.

## DM Subagent Prompt Stub
Use this exact context policy:
- Follow `SRD_CC_v5.2.1_Combat_LLM.md` as the tactical rules baseline.
- During combat, always output:
  1. Initiative tracker snapshot
  2. Active creature turn options
  3. Rule citations by section name from this file
  4. Resolved outcomes + next decision point
- If uncertain, state uncertainty and request the missing rule from Rules Glossary before final adjudication.
