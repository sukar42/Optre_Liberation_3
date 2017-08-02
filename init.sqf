enableSaving [ false, false ];

[] call compileFinal preprocessFileLineNumbers "scripts\shared\atlas_manager.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNUmbers "gameplay_constants.sqf";
[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";

[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1600;
};

execVM "briefing.sqf";

[] execVM "CODI\postprocessdamagesystem\pp.sqf";

AR_SUPPORTED_VEHICLES_OVERRIDE = [ "OPTRE_Pelican_unarmed_black", "OPTRE_Pelican_unarmed_green", "OPTRE_Pelican_unarmed_marine", "OPTRE_Pelican_unarmed_tan", "OPTRE_Pelican_armed_black", "OPTRE_Pelican_armed_green", "OPTRE_Pelican_armed_marine", "OPTRE_Pelican_armed_tan", "OPTRE_UNSC_falcon_black", "OPTRE_UNSC_falcon_green", "OPTRE_UNSC_falcon_snow", "OPTRE_UNSC_falcon_tan", "OPTRE_Pelican_unarmed_ins", "OPTRE_Pelican_armed_ins", "OPTRE_UNSC_hornet_ins_CAP', "OPTRE_UNSC_hornet_ins_CAS",  "OPTRE_UNSC_hornet_black_CAP", "OPTRE_UNSC_hornet_black_CAS", "OPTRE_UNSC_hornet_desert_CAS", "OPTRE_UNSC_hornet_desert_CAP", "OPTRE_UNSC_hornet_green_CAP", "OPTRE_UNSC_hornet_green_CAS", "OPTRE_UNSC_hornet_snow_CAP", "OPTRE_UNSC_hornet_snow_CAS"  ];