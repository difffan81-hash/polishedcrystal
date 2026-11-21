BugContest_SetCaughtContestMon:
	ld a, [wContestMonSpecies]
	and a
	jr z, .firstcatch
	ld [wNamedObjectIndex], a
	ld a, [wContestMonForm]
	ld [wNamedObjectIndex+1, 2], a
	call DisplayAlreadyCaughtText
	call DisplayCaughtContestMonStats
	call YesNoBox
	ret c

.firstcatch
	call .generatestats
	ld a, [wTempEnemyMonSpecies]
	ld [wNamedObjectIndex], a
	ld a, [wOTPartyMon1Form]
	ld [wNamedObjectIndex+1, 2], a
	call GetPokemonName
	ld hl, .caughttext
	jmp PrintText

.generatestats
	ld a, [wTempEnemyMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	ld a, [wOTPartyMon1Form]
	ld [wCurForm], a
    ld [wCurMonDebug], b
	call GetBaseData
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wContestMon
	rst ByteFill
    ld [wCurForm+1, 2]
	xor a
	ld [wMonType], a
	ld hl, wOTPartyMon1
	ld de, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes
	ret

.caughttext
	; Caught @ !
	text_farend _ContestCaughtMonText
DisplayAlreadyCaughtText:
	call GetPokemonName
	ld hl, .AlreadyCaughtText
	jmp PrintText

.AlreadyCaughtText:
	; You already caught a @ .
	text_farend _ContestAlreadyCaughtText
