class CfgPatches
{
	class Corey_Scripts
	{
	units[] = {};
	weapons[] = {};
	requiredVersion = 1.05;
	requiredAddons[] = {};
	};
};


class CfgFunctions
{
	class Corey_Scripts
	{
		class myCategory
		{
			// call the function upon mission start, after objects are initialized.
			class postInit
			{
				postInit = 1;
				file = '/pso_scripts/addons/pso_scripts/functions/postInit.sqf';
			};
		};
	};
};