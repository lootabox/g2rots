
const int Value_Ri_Xardas 		= 500;
const int Value_Ri_Fernando 	= 500;

/******************************************************************************************/
instance ItRi_Xardas(ItRi_Prototype)
{
	value 					=	Value_Ri_Xardas;

	visual 					=	"ItRi_Xardas.3ds";

	on_equip				=	Equip_ItRi_Xardas;
	on_unequip				=	UnEquip_ItRi_Xardas;

	description				= "Xardas' ???";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_ItRi_Xardas()
	{
		//
	};

	FUNC VOID UnEquip_ItRi_Xardas()
	{
		//
	};

/******************************************************************************************/
instance ItRi_Fernando(ItRi_Prototype)
{
	value 					=	Value_Ri_Fernando;

	visual 					=	"ItRi_Fernando.3ds";

	on_equip				=	Equip_ItRi_Fernando;
	on_unequip				=	UnEquip_ItRi_Fernando;

	description				= "Fernando's ???";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_ItRi_Fernando()
	{
		//
	};

	FUNC VOID UnEquip_ItRi_Fernando()
	{
		//
	};

