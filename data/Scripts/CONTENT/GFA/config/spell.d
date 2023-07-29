/*
 * This file contains all configurations for free aiming in spell combat (spells). See config\reticle.d for reticle
 * configurations.
 *
 * Requires the feature GFA_SPELLS (see config\settings.d).
 *
 * List of included functions:
 *  func int GFA_ShiftAimVob(int spellID)
 *
 * Related functions that can be used:
 *  func void GFA_AimVobAttachFX(string effectInst)
 *  func void GFA_AimVobDetachFX()
 */


/*
 * Shift the destination visualization (aim vob) away from any walls
 */
const int oCVob__HasNpcEnoughSpace				= 7848896; //0x77C3C0
func int Spell_Blink_CorrectDestination(var int posPtr) {
	var int pos[3];
	MEM_CopyWords(posPtr, _@(pos), 3);
	posPtr = _@(pos);

	// Get camera vob
	var zCVob camVob; camVob = _^(MEM_Game._zCSession_camVob);
	var zMAT4 camPos; camPos = _^(_@(camVob.trafoObjToWorld));

	// Set up variables for iteration
	var int enoughSpace; enoughSpace = FALSE;
	var int herPtr; herPtr = _@(hero);
	var int shifted; shifted = 0;
	var int stepSize; stepSize = 100; // 1 meter step size
	var int stepSizeF; stepSizeF = mkf(stepSize);

	// Shift the position of the aim vob towards the camera until enough space
	while(!enoughSpace);
		// Manipulate the position towards the camera
		pos[0] = subf(pos[0], mulf(camPos.v0[zMAT4_outVec], stepSizeF));
		pos[1] = subf(pos[1], mulf(camPos.v1[zMAT4_outVec], stepSizeF));
		pos[2] = subf(pos[2], mulf(camPos.v2[zMAT4_outVec], stepSizeF));
		shifted -= stepSize;

		// Check if there is enough space now
		const int call = 0;
		if (CALL_Begin(call)) {
			CALL_PtrParam(_@(posPtr));
			CALL_PutRetValTo(_@(enoughSpace));
			CALL__thiscall(_@(herPtr), oCVob__HasNpcEnoughSpace);
			call = CALL_End();
		};
	end;

	// Return the necessary amount to shift the aim vob in centimeters
	return shifted;
};

/*
 * This function is called continuously while aiming with spells to correct the aim vob position. The return value is
 * interpreted as the amount of centimeters, the aim vob should be shifted along the camera out vector (viewing angle).
 * This function should never be of use and should be adjusted for individual spells only. Usually, no spell requires
 * the aim vob to be shifted. Exceptions are spells that utilize the aim vob as target to spawn VFX on it with the
 * functions GFA_AimVobAttachFX() and GFA_AimVobDetachFX().
 */
func int GFA_ShiftAimVob(var int spellID, var int posPtr) {
	// if (spellID == ...) { return -100; }; // Push the aim vob 100 cm away from any wall towards the player

	// Summons
	if (spellID == SPL_SummonGoblinSkeleton)
	|| (spellID == SPL_SummonWolf)
	|| (spellID == SPL_SummonSkeleton)
	//|| (spellID == SPL_SummonGolem)
	|| (spellID == SPL_SummonDemon)
	|| (spellID == SPL_ArmyOfDarkness)
	|| (spellID == SPL_SummonGuardian)
	//|| (spellID == SPL_SummonZombie)
	|| (spellID == SPL_SummonMud)
	{
		MEM_PushIntParam(posPtr);
		MEM_Call(Spell_Blink_CorrectDestination);
		return MEM_PopIntResult();
	};

	// Usually none
	return 0;
};
